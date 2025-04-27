import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';

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

  ngOnInit(): void {
    setTimeout(() => {
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  selectedVariation(variation:any) {
    this.variation_selected = null;
    setTimeout(() => {
      this.variation_selected = variation;
      MODAL_PRODUCT_DETAIL($);
    }, 50)
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
}
