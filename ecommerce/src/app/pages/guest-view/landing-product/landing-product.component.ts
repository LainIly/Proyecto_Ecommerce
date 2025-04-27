import { afterNextRender, Component } from '@angular/core';
import { HomeService } from '../../home/service/home.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { after } from 'node:test';
import { ModalProductComponent } from '../component/modal-product/modal-product.component';
import { AnyMxRecord } from 'node:dns';

declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;

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

  constructor(
    public homeService: HomeService,
    public activedRouter: ActivatedRoute,
    private toastr: ToastrService,
    private router: Router,
  ) {
    this.activedRouter.params.subscribe((resp: any) => {
      this.PRODUCT_SLUG = resp.slug;
    })
    // afterNextRender(()=> { // Este metodo es para ejecutar del lado del Servidor. 
    // Sin esta, se ve la respuesta solo en HTML
    // Con este, la respuesta llega en formato JSON
    this.homeService.showProduct(this.PRODUCT_SLUG).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
        this.router.navigateByUrl('/');
      } else {
        this.PRODUCT_SELECTED = resp.product;
        this.PRODUCT_RELATEDS = resp.product_relateds.data;
      }
    })
    // })

    afterNextRender(() => {
      setTimeout(() => {
        MODAL_PRODUCT_DETAIL($);
      }, 50);
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
    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  openDetailModal(PRODUCT:any) {
    this.product_selected_modal = null;

    setTimeout(() => {
      this.product_selected_modal = PRODUCT;
    }, 50);
  }
}
