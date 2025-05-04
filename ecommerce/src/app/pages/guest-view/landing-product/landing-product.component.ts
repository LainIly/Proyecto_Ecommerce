import { afterNextRender, afterRender, Component } from '@angular/core';
import { HomeService } from '../../home/service/home.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ModalProductComponent } from '../component/modal-product/modal-product.component';
import { CookieService } from 'ngx-cookie-service';

declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;
declare function LANDING_PRODUCT([]): any;


@Component({
  selector: 'app-landing-product',
  standalone: true,
  imports: [CommonModule, FormsModule, ModalProductComponent],
  templateUrl: './landing-product.component.html',
  styleUrl: './landing-product.component.css'
})
export class LandingProductComponent {

  PRODUCT_SLUG: any;
  PRODUCT_SELECTED: any;
  variation_selected: any;
  PRODUCT_RELATEDS: any = [];
  product_selected_modal: any;
  CODE_CAMPAING: any;
  DISCOUNT_CAMPAING: any;

  currency: string = 'COP';

  constructor(
    public homeService: HomeService,
    public activedRouter: ActivatedRoute,
    private toastr: ToastrService,
    private router: Router,
    private cookieService: CookieService,
  ) {
    this.activedRouter.params.subscribe((resp: any) => {
      this.PRODUCT_SLUG = resp.slug;
    })

    this.activedRouter.queryParams.subscribe((resp: any) => {
      this.CODE_CAMPAING = resp.campaing_discount;
    })
    // afterNextRender(() => { // Este metodo es para ejecutar del lado del Servidor. 
    // Sin esta, se ve la respuesta solo en HTML
    // Con este, la respuesta llega en formato JSON
    this.homeService.showProduct(this.PRODUCT_SLUG, this.CODE_CAMPAING).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
        this.router.navigateByUrl('/');
      } else {
        this.PRODUCT_SELECTED = resp.product;
        this.PRODUCT_RELATEDS = resp.product_relateds.data;
        this.DISCOUNT_CAMPAING = resp.discount_campaing;
        if (this.DISCOUNT_CAMPAING) {
          this.PRODUCT_SELECTED.discount_g = this.DISCOUNT_CAMPAING
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

    if (this.currency == 'COP') {
      if (DISCOUNT_FLASH_P.type_discount == 1) { //Porcentaje de descuento
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        total = PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01);
      } else { //Monto Fijo
        total = PRODUCT.price_cop - DISCOUNT_FLASH_P.discount;
        // return (PRODUCT.price_cop - DISCOUNT_FLASH_P.discount).toFixed(0);
      }
    } else {
      if (DISCOUNT_FLASH_P.type_discount == 1) { //Porcentaje de descuento
        // return (PRODUCT.price_cop - PRODUCT.price_cop * (DISCOUNT_FLASH_P.discount * 0.01)).toFixed(0);
        total = PRODUCT.price_usd - PRODUCT.price_usd * (DISCOUNT_FLASH_P.discount * 0.01);
      } else { //Monto Fijo
        total = PRODUCT.price_usd - DISCOUNT_FLASH_P.discount;
        // return (PRODUCT.price_cop - DISCOUNT_FLASH_P.discount).toFixed(0);
      }
    }
    return this.formatPriceToCOP(total);
  }

  getTotalPriceProduct(PRODUCT: any): string {

    if (PRODUCT.discount_g) {
      return this.getNewTotal(PRODUCT, PRODUCT.discount_g);
    }

    if (this.currency == 'COP') {
      return this.formatPriceToCOP(PRODUCT.price_cop);
    } else {
      return this.formatPriceToCOP(PRODUCT.price_usd);
    }
  }

  getTotalCurrency (PRODUCT: any) {
    if (this.currency == 'COP') {
      return this.formatPriceToCOP(PRODUCT.price_cop);
    } else {
      return this.formatPriceToCOP(PRODUCT.price_usd);
    }
  }

  selectedVariation(variation: any) {
    this.variation_selected = null;
    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  openDetailModal(PRODUCT: any) {
    this.product_selected_modal = null;

    setTimeout(() => {
      this.product_selected_modal = PRODUCT;
    }, 50);
  }
}