import { afterNextRender, Component } from '@angular/core';
import { HomeService } from './service/home.service';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ModalProductComponent } from '../guest-view/component/modal-product/modal-product.component';

declare function SLIDER_PRINCIPAL([]): any;
declare function DATA_VALUES([]): any;
declare function PRODUCTS_CAROUSEL_HOME([]): any;
declare function MODAL_PRODUCT_DETAIL ([]): any;
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

  constructor(
    public homeService: HomeService,
  ) {
    afterNextRender(() => {
      this.homeService.home().subscribe((resp: any) => {
        console.log(resp);
        this.SLIDERS = resp.sliders_principal;
        this.BANNERS_SECUNDARIOS = resp.sliders_secundario;

        this.CATEGORIES_RANDOMS = resp.categories_randoms;

        this.TRADING_PRODUCT_NEW = resp.product_tranding_new.data;
        this.TRADING_PRODUCT_FEATURE = resp.product_tranding_featured.data;
        this.TRADING_PRODUCT_TOP_SELLER = resp.product_tranding_top_sellers.data;
        this.PRODUCTS_ELECTRONICS = resp.product_eletronics.data;
        this.PRODUCTS_CAROUSEL = resp.products_carusel.data;
        this.BANNERS_PRODUCTS = resp.sliders_products;
        this.LASTS_PRODUCT_DISCOUNT = resp.product_last_discounts.data;
        this.LASTS_PRODUCT_FEATURE = resp.product_last_featured.data;
        this.LASTS_PRODUCT_SELLING = resp.product_last_selling.data;

        this.DISCOUNT_FLASH = resp.discount_flash;
        this.DISCOUNT_FLASH_PRODUCTS = resp.discount_flash_products;

        setTimeout(() => {
          SLIDER_PRINCIPAL($);
          DATA_VALUES($);
          PRODUCTS_CAROUSEL_HOME($);
        }, 50)
      })
    })
  }

  ngOnInit(): void {

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

  openDetailProduct(PRODUCT:any) {
    this.product_selected = null;
    this.variation_selected = null;

    setTimeout(() => {
      this.product_selected = PRODUCT;
      MODAL_PRODUCT_DETAIL($);
    }, 50)
  }

  selectedVariation(variation:any) {
    this.variation_selected = null;
    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50)
  }
}
