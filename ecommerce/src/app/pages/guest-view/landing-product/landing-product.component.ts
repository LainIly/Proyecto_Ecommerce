import { afterRender, Component } from '@angular/core';
import { HomeService } from '../../home/service/home.service';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ModalProductComponent } from '../component/modal-product/modal-product.component';
import { CookieService } from 'ngx-cookie-service';
import { CartService } from '../../home/service/cart.service';

declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;
declare function LANDING_PRODUCT([]): any;
declare function MODAL_QUANTITY_LANDING([]): any;

@Component({
  selector: 'app-landing-product',
  standalone: true,
  imports: [CommonModule, FormsModule, ModalProductComponent, RouterModule],
  templateUrl: './landing-product.component.html',
  styleUrl: './landing-product.component.css'
})
export class LandingProductComponent {

  PRODUCT_SLUG: any;
  PRODUCT_SELECTED: any;
  variation_selected: any;
  sub_variation_selected: any;
  PRODUCT_RELATEDS: any = [];
  product_selected_modal: any;
  CAMPAING_CODE: any;
  DISCOUNT_CAMPAING: any;

  currency: string = 'COP';

  plus: number = 0;

  constructor(
    public homeService: HomeService,
    public activedRouter: ActivatedRoute,
    private toastr: ToastrService,
    private router: Router,
    private cookieService: CookieService,
    public cartService: CartService,
  ) {
    this.activedRouter.params.subscribe((resp: any) => {
      this.PRODUCT_SLUG = resp.slug;
    })

    this.activedRouter.queryParams.subscribe((resp: any) => {
      this.CAMPAING_CODE = resp.campaing_discount;
    })
    // afterNextRender(() => { // Este metodo es para ejecutar del lado del Servidor. 
    // Sin esta, se ve la respuesta solo en HTML
    // Con este, la respuesta llega en formato JSON
    this.homeService.showProduct(this.PRODUCT_SLUG, this.CAMPAING_CODE).subscribe((resp: any) => {
      // console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
        this.router.navigateByUrl('/');
      } else {
        this.PRODUCT_SELECTED = resp.product;
        this.PRODUCT_RELATEDS = resp.product_relateds.data;
        this.DISCOUNT_CAMPAING = resp.discount_campaing;
        if (this.DISCOUNT_CAMPAING) {
          this.PRODUCT_SELECTED.discount_g = this.DISCOUNT_CAMPAING;
        }
      }
    })
    // })
    afterRender(() => {
      setTimeout(() => {
        MODAL_PRODUCT_DETAIL($);
        LANDING_PRODUCT($);
      }, 50);
      this.currency = this.cookieService.get('currency') ? this.cookieService.get('currency') : 'COP';
    })
  }

  ngOnInit(): void {
    setTimeout(() => {
      MODAL_QUANTITY_LANDING($);
    }, 50);
  }

  // ngAfterViewInit(): void {
    
  // }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  getNewTotal(PRODUCT: any, DISCOUNT_FLASH_P: any) {
    if (this.currency == 'COP') {
      if (DISCOUNT_FLASH_P.type_discount == 1) {
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        return ((PRODUCT.price_cop+this.plus) - (PRODUCT.price_cop+this.plus) * (DISCOUNT_FLASH_P.discount * 0.01));
      } else {
        return ((PRODUCT.price_cop+this.plus) - DISCOUNT_FLASH_P.discount);
      }
    } else {
      if (DISCOUNT_FLASH_P.type_discount == 1) {
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        return ((PRODUCT.price_usd+this.plus) - (PRODUCT.price_usd+this.plus) * (DISCOUNT_FLASH_P.discount * 0.01));
      } else {
        return ((PRODUCT.price_usd+this.plus) - DISCOUNT_FLASH_P.discount);
      }
    }
  }

  getTotalPriceProduct(PRODUCT: any) {
    if (PRODUCT.discount_g) {
      return this.getNewTotal(PRODUCT, PRODUCT.discount_g);
    }
    if (this.currency == 'COP') {
      return PRODUCT.price_cop + this.plus;
    } else {
      return PRODUCT.price_usd + this.plus;
    }
  }

  getTotalCurrency(PRODUCT: any) {
    if (this.currency == 'COP') {
      return PRODUCT.price_cop;
    } else {
      return PRODUCT.price_usd;
    }
  }

  selectedVariation(variation: any) {
    this.variation_selected = null;
    this.sub_variation_selected = null;
    this.plus = 0;
    setTimeout(() => {
       this.plus += variation.add_price;
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  selectedSubVariation(subvariation: any) {
    this.sub_variation_selected = null;
    this.plus = this.variation_selected.add_price;
    setTimeout(() => {
      this.plus += subvariation.add_price;
      this.sub_variation_selected = subvariation;
      // MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  openDetailModal(PRODUCT: any) {
    this.product_selected_modal = null;

    setTimeout(() => {
      this.product_selected_modal = PRODUCT;
    }, 50);
  }

  addCart() {
    if (!this.cartService.authService.user) {
      this.toastr.error('Validacion', 'Debes iniciar sesion para agregar productos al carrito.');
      this.router.navigateByUrl('/login');
      return;
    }

    let product_variation_id = null;

    if (this.PRODUCT_SELECTED.variations.length > 0) {
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

    if (this.PRODUCT_SELECTED.variations.length > 0 && this.variation_selected &&
      this.variation_selected.subvariations.length == 0) {
      product_variation_id = this.variation_selected.id;
    }

    if (this.PRODUCT_SELECTED.variations.length > 0 && this.variation_selected &&
      this.variation_selected.subvariations.length > 0) {
      product_variation_id = this.sub_variation_selected.id;
    }

    let discount_g = null;

    if (this.PRODUCT_SELECTED.discount_g) {
      discount_g = this.PRODUCT_SELECTED.discount_g;
    }

    let data = {
      product_id: this.PRODUCT_SELECTED.id,
      type_discount: discount_g ? discount_g.type_discount : null,
      discount: discount_g ? discount_g.discount : null,
      type_campaing: discount_g ? discount_g.type_campaing : null,
      code_cupon: null,
      code_discount: discount_g ? discount_g.code : null,
      product_variation_id: product_variation_id,
      quantity: $("#tp-cart-input-val").val(),
      price_unit: this.currency == 'PEN' ? this.PRODUCT_SELECTED.price_pen : this.PRODUCT_SELECTED.price_usd,
      subtotal: this.getTotalPriceProduct(this.PRODUCT_SELECTED),
      total: this.getTotalPriceProduct(this.PRODUCT_SELECTED) * $("#tp-cart-input-val").val(),
      currency: this.currency,
    };

    this.cartService.registerCart(data).subscribe((resp: any) => {
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.cartService.changeCart(resp.cart);
        this.toastr.success('Exito', 'Producto agregado al carrito de compras.');
      }
    }, err => {
      console.log(err);
    });
  }
}