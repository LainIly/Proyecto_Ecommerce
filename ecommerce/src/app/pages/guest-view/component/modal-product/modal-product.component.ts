import { CommonModule } from '@angular/common';
import { afterRender, Component, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CartService } from '../../../home/service/cart.service';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;

@Component({
  selector: 'app-modal-product',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './modal-product.component.html',
  styleUrl: './modal-product.component.css'
})
export class ModalProductComponent {

  @Input() product_selected: any;
  variation_selected: any;
  sub_variation_selected: any;
  currency: string = 'COP';

  constructor(
    private toastr: ToastrService,
    private router: Router,
    private cartService: CartService,
    public cookieService: CookieService,
  ) {
    afterRender(() => {
      this.currency = this.cookieService.get('currency') ? this.currency = this.cookieService.get('currency') : 'COP';
    })
  }

  ngOnInit(): void {
    setTimeout(() => {
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  formatPriceToCOP(price: number) {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  } // Funcion para dar formato a los precios en COP

  getNewTotal(PRODUCT: any, DISCOUNT_FLASH_P: any): string {

    let total: number = 0;

    if (DISCOUNT_FLASH_P.type_discount == 1) { //Porcentaje de descuento
      // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
      total = PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01);
    } else { //Monto Fijo
      total = PRODUCT.price_cop - DISCOUNT_FLASH_P.discount;
      // return (PRODUCT.price_cop - DISCOUNT_FLASH_P.discount).toFixed(0);
    }
    return this.formatPriceToCOP(total);
  }

  getTotalPriceProduct(PRODUCT: any): string {
    if (PRODUCT.discount_g) {
      return this.getNewTotal(PRODUCT, PRODUCT.discount_g);
    }
    return this.formatPriceToCOP(PRODUCT.price_cop);
  }

  selectedVariation(variation: any) {
    this.variation_selected = null;
    this.sub_variation_selected = null;

    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50)
  }

  selectedSubVariation(subvariation: any) {
    this.sub_variation_selected = null;
    setTimeout(() => {
      this.sub_variation_selected = subvariation;
    }, 50)
  }

  addCart() {
    if (!this.cartService.authService.user) {
      this.toastr.error('Validacion', 'Debes iniciar sesion para agregar productos al carrito.');
      this.router.navigateByUrl('/login');
      return;
    }

    let product_variation_id = null;

    if (this.product_selected.variations.length > 0) {
      if (!this.variation_selected) {
        this.toastr.error('Validacion', 'Debes seleccionar una variacion del producto.');
        return;
      }
      if (this.variation_selected && this.variation_selected.subvariations.length > 0) {
        if (!this.sub_variation_selected) {
          this.toastr.error('Validacion', 'Debes seleccionar una subvariacion del producto.');
          return;
        }
      }
    }

    if (this.product_selected.variations.length > 0 && this.variation_selected && 
      this.variation_selected.subvariations.length == 0) {
      product_variation_id = this.variation_selected.id;
    }

    if (this.product_selected.variations.length > 0 && this.variation_selected && 
      this.variation_selected.subvariations.length > 0) {
      product_variation_id = this.sub_variation_selected.id;
    }

    let discount_g = null;

    if (this.product_selected.discount_g) {
      discount_g = this.product_selected.discount_g;
    }

    let data = {
      product_id: this.product_selected.id,
      type_discount: discount_g ? discount_g.type_discount : null,
      discount: discount_g ? discount_g.discount : null,
      type_campaing: discount_g ? discount_g.type_campaing : null,
      code_cupon: null,
      code_discount: discount_g ? discount_g.code : null,
      product_variation_id: product_variation_id,
      quantity: $('#tp-cart-input-val').val(),
      price_unit: this.product_selected.price_cop,
      subtotal: this.getTotalPriceProduct(this.product_selected),
      // total: this.getTotalPriceProduct(this.product_selected) * $('#tp-cart-input-val').val(), //ACA ESTA EL ERROR.
      currency: this.currency,
    }
    this.cartService.registerCart(data).subscribe((resp: any) => {
      // console.log(resp);

      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.cartService.changeCart(resp.cart);
        this.toastr.success('Exito', 'Producto agregado al carrito de compras.');
      }
    }, err => {
      console.log(err);
    })
  }
}