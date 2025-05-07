import { afterRender, Component } from '@angular/core';
import { HomeService } from './service/home.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ModalProductComponent } from '../guest-view/component/modal-product/modal-product.component';
import { CookieService } from 'ngx-cookie-service';
import { CartService } from './service/cart.service';
import { ToastrService } from 'ngx-toastr';
import { Router, RouterModule } from '@angular/router';

declare function SLIDER_PRINCIPAL([]): any;
declare function DATA_VALUES([]): any;
declare function PRODUCTS_CAROUSEL_HOME([]): any;
declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [FormsModule, RouterModule, CommonModule, ModalProductComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {

  SLIDERS: any = [];
  CATEGORIES_RANDOMS: any = [];
  TRADING_PRODUCT_NEW: any = [];
  TRADING_PRODUCT_FEATURE: any = [];
  TRADING_PRODUCT_TOP_SELLER: any = [];
  PRODUCTS_ELECTRONICS: any = [];
  PRODUCTS_CAROUSEL: any = [];

  BANNERS_SECUNDARIOS: any = [];
  BANNERS_PRODUCTS: any = [];

  LASTS_PRODUCT_DISCOUNT: any = [];
  LASTS_PRODUCT_FEATURE: any = [];
  LASTS_PRODUCT_SELLING: any = [];

  DISCOUNT_FLASH: any;
  DISCOUNT_FLASH_PRODUCTS: any = [];

  product_selected: any = null;
  variation_selected: any = null;

  currency: string = 'COP';

  constructor(
    public homeService: HomeService,
    private cookieService: CookieService,
    public cartService: CartService,
    private toastr: ToastrService,
    private router: Router,
  ) {
    // afterNextRender(() => {
    this.homeService.home().subscribe((resp: any) => {
      // console.log(resp);
      this.SLIDERS = resp.sliders_principal;
      this.CATEGORIES_RANDOMS = resp.categories_randoms;
      this.TRADING_PRODUCT_NEW = resp.product_tranding_new.data;
      this.TRADING_PRODUCT_FEATURE = resp.product_tranding_featured.data;
      this.TRADING_PRODUCT_TOP_SELLER = resp.product_tranding_top_sellers.data;
      this.BANNERS_SECUNDARIOS = resp.sliders_secundario;
      this.PRODUCTS_ELECTRONICS = resp.product_eletronics.data;
      this.PRODUCTS_CAROUSEL = resp.products_carusel.data;
      this.BANNERS_PRODUCTS = resp.sliders_products;

      this.LASTS_PRODUCT_DISCOUNT = resp.product_last_discounts.data;
      this.LASTS_PRODUCT_FEATURE = resp.product_last_featured.data;
      this.LASTS_PRODUCT_SELLING = resp.product_last_selling.data;

      this.DISCOUNT_FLASH = resp.discount_flash;
      this.DISCOUNT_FLASH_PRODUCTS = resp.discount_flash_products;
    })
    // })
    afterRender(() => {
      setTimeout(() => {
        SLIDER_PRINCIPAL($);
        DATA_VALUES($);
        PRODUCTS_CAROUSEL_HOME($);
        this.SLIDERS.forEach((SLIDER: any) => {
          this.getLabelSlider(SLIDER)
          this.getSubtitleSlider(SLIDER)
        });
        this.BANNERS_SECUNDARIOS.forEach((BANNER: any, index: number) => {
          if (index == 0) {
            this.getTitleBannerSecundario(BANNER, 'title-banner-s-' + BANNER.id);
          } else {
            this.getTitleBannerSecundario(BANNER, 'title-banner-sa-' + BANNER.id);
          }
        });
      }, 50)
      this.currency = this.cookieService.get('currency') ? this.currency = this.cookieService.get('currency') : 'COP';
    })
  }

  ngOnInit(): void {

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
  getLabelSlider(SLIDER: any) {
    var miDiv: any = document.getElementById('label-' + SLIDER.id);
    miDiv.innerHTML = SLIDER.label;
    return '';
  }

  getSubtitleSlider(SLIDER: any) {
    var miDiv: any = document.getElementById('subtitle-' + SLIDER.id);
    miDiv.innerHTML = SLIDER.subtitle;
    return '';
  }

  getTitleBannerSecundario(BANNER: any, ID_BANNER: string) {
    var miDiv: any = document.getElementById(ID_BANNER);
    miDiv.innerHTML = BANNER.title;
    return '';
  }

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

  getTotalCurrency(PRODUCT: any) {
    if (this.currency == 'COP') {
      return PRODUCT.price_cop;
    } else {
      return PRODUCT.price_usd;
    }
  }

  getTotalBanner(BANNER: any) {
    if (this.currency == 'COP') {
      return this.formatPriceToCOP(BANNER.price_cop);
    } else {
      return this.formatPriceToCOP(BANNER.price_usd);
    }
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

  selectedVariation(variation: any) {
    this.variation_selected = null;
    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50)
  }
}