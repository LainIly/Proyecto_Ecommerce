import { afterNextRender, Component } from '@angular/core';
import { HomeService } from '../../home/service/home.service';
import { CookieService } from 'ngx-cookie-service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { CartService } from '../../home/service/cart.service';
import { ToastrService } from 'ngx-toastr';
import { ModalProductComponent } from '../component/modal-product/modal-product.component';

declare var $: any;

@Component({
  selector: 'app-filter-advance',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule, ModalProductComponent],
  templateUrl: './filter-advance.component.html',
  styleUrl: './filter-advance.component.css'
})
export class FilterAdvanceComponent {

  Categories: any = [];
  Colors: any = [];
  Brands: any = [];
  Products_relateds: any = [];

  PRODUCTS: any = [];

  currency: string = 'COP';

  product_selected: any = null;
  variation_selected: any = null;

  categories_selected: any = [];
  colors_selected: any = [];
  brands_selected: any = [];

  min_price: number = 0;
  max_price: number = 0;

  options_aditional: any = [];

  search: string = '';

  constructor(
    public homeService: HomeService,
    public cookieService: CookieService,
    public cartService: CartService,
    public toastr: ToastrService,
    private router: Router,
    public activedRouter: ActivatedRoute
  ) {
    this.homeService.getConfigFilter().subscribe((resp: any) => {
      // console.log(resp);

      this.Categories = resp.categories;
      this.Colors = resp.colors;
      this.Brands = resp.brands;
      this.Products_relateds = resp.product_relateds.data;
    })

    this.activedRouter.queryParams.subscribe((resp:any) => {
      // console.log(resp);
      this.search = resp.search;
    });

    this.homeService.filterAdvanceProduct({ search: this.search }).subscribe((resp: any) => {
      // console.log(resp);
      this.PRODUCTS = resp.products.data;
    })
  }

  ngOnInit(): void {
    this.currency = this.cookieService.get("currency") ? this.cookieService.get("currency") : 'COP';

    if (typeof $ !== 'undefined') {
      $("#slider-range").slider({ //Estos valores son en COP (Moneda Colombiana)
        range: true,
        min: 0,

        max: 10000000,
        values: [50, 100000],
        slide: (event: any, ui: any) => {
          $("#amount").val(this.currency + ' ' + ui.values[0] + " - " + this.currency + ' ' + ui.values[1]);
          this.min_price = ui.values[0];
          this.max_price = ui.values[1];
        }, stop: () => {
          this.filterAdvanceProduct();
        }
      });
      $("#amount").val(this.currency + ' ' + $("#slider-range").slider("values", 0) +
        " - " + this.currency + ' ' + $("#slider-range").slider("values", 1));
    }
  }

  addCompare(PRODUCT: any) {
    let COMPARES = localStorage.getItem('compares') ? JSON.parse(localStorage.getItem('compares') ?? '') : [];

    let INDEX = COMPARES.findIndex((item: any) => item.id == PRODUCT.id);
    if (INDEX != -1) {
      this.toastr.error('El producto ya se encuentra en la lista de comparacion.');
      return;
    }

    COMPARES.push(PRODUCT);
    this.toastr.success('Producto agregado a la lista de comparacion.')
    localStorage.setItem('compares', JSON.stringify(COMPARES));

    if (COMPARES.length > 1) {
      this.router.navigateByUrl('/compare-product');
    }
  }

  addCategorie(categorie: any) {
    let INDEX = this.categories_selected.findIndex((item: any) => item == categorie.id);

    if (INDEX != -1) {
      this.categories_selected.splice(INDEX, 1);
    } else {
      this.categories_selected.push(categorie.id);
    }
    // console.log(this.categories_selected);
    this.filterAdvanceProduct();
  }

  addBrand(Brand: any) {
    let INDEX = this.brands_selected.findIndex((item: any) => item == Brand.id);

    if (INDEX != -1) {
      this.brands_selected.splice(INDEX, 1);
    } else {
      this.brands_selected.push(Brand.id);
    }
    // console.log(this.brands_selected);
    this.filterAdvanceProduct();
  }

  addColor(color: any) {
    let INDEX = this.colors_selected.findIndex((item: any) => item == color.id);

    if (INDEX != -1) {
      this.colors_selected.splice(INDEX, 1);
    } else {
      this.colors_selected.push(color.id);
    }
    // console.log(this.colors_selected);
    this.filterAdvanceProduct();
  }

  addOptionAditional(option: string) {
    let INDEX = this.options_aditional.findIndex((item: any) => item == option);

    if (INDEX != -1) {
      this.options_aditional.splice(INDEX, 1);
    } else {
      this.options_aditional.push(option);
    }
    // console.log(this.options_aditional);
    this.filterAdvanceProduct();
  }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  filterAdvanceProduct() {

    let data = {
      categories_selected: this.categories_selected,
      colors_selected: this.colors_selected,
      brands_selected: this.brands_selected,
      min_price: this.min_price,
      max_price: this.max_price,
      currency: this.currency,
      options_aditional: this.options_aditional,
      search: this.search,
    }
    this.homeService.filterAdvanceProduct(data).subscribe((resp: any) => {
      // console.log(resp);
      this.PRODUCTS = resp.products.data;
    })
  }

  getTotalCurrency(PRODUCT: any) {
    if (this.currency == 'COP') {
      return PRODUCT.price_cop;
    } else {
      return PRODUCT.price_usd;
    }
  }

  addCart(PRODUCT: any) {
    if (!this.cartService.authService.user) {
      this.toastr.error('Validacion', 'Debes iniciar sesion para agregar productos al carrito.');
      this.router.navigateByUrl('/login');
      return;
    }

    if (PRODUCT.variations.length > 0) {
      $('#producQuickViewModal').modal('show');
      this.openDetailProduct(PRODUCT); // Abre el modal para seleccionar variaciones
      return;
    }

    let discount_g = null;

    if (PRODUCT.discount_g) {
      discount_g = PRODUCT.discount_g;
    }

    let data = {
      product_id: PRODUCT.id,
      type_discount: discount_g ? discount_g.type_discount : null,
      discount: discount_g ? discount_g.discount : null,
      type_campaing: discount_g ? discount_g.type_campaing : null,
      code_cupon: null,
      code_discount: discount_g ? discount_g.code : null,
      product_variation_id: null,
      quantity: 1,
      price_unit: this.currency == 'COP' ? PRODUCT.price_cop : PRODUCT.price_usd,
      subtotal: this.getTotalPriceProduct(PRODUCT),
      total: this.getTotalPriceProduct(PRODUCT) * 1,
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

  openDetailProduct(PRODUCT: any, DISCOUNT_FLASH: any = null) {
    this.product_selected = null;
    this.variation_selected = null;

    setTimeout(() => {
      setTimeout(() => {
        if (DISCOUNT_FLASH) {
          this.product_selected.discount_g = DISCOUNT_FLASH;
        }
      }, 25)
      this.product_selected = PRODUCT;
      // MODAL_PRODUCT_DETAIL($);
    }, 50)
  }

  getNewTotal(PRODUCT: any, DISCOUNT_FLASH_P: any) {
    if (this.currency == 'COP') {
      if (DISCOUNT_FLASH_P.type_discount == 1) {
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        return PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01);
      } else {
        return PRODUCT.price_cop - DISCOUNT_FLASH_P.discount;
      }
    } else {
      if (DISCOUNT_FLASH_P.type_discount == 1) {
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        return PRODUCT.price_usd - PRODUCT.price_usd * (DISCOUNT_FLASH_P.discount * 0.01);
      } else {
        return PRODUCT.price_usd - DISCOUNT_FLASH_P.discount;
      }
    }
  }

  getTotalPriceProduct(PRODUCT: any) {
    if (PRODUCT.discount_g) {
      return this.getNewTotal(PRODUCT, PRODUCT.discount_g);
    }
    if (this.currency == 'COP') {
      return PRODUCT.price_cop;
    } else {
      return PRODUCT.price_usd;
    }
  }

  reset() {
    window.location.href = '/productos-busqueda';
  }
}