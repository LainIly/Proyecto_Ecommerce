import { CommonModule } from '@angular/common';
import { afterNextRender, Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';

declare function MODAL_PRODUCT_DETAIL([]): any;
declare var $: any;

@Component({
  selector: 'app-compare-product',
  standalone: true,
  imports: [FormsModule, CommonModule, RouterModule],
  templateUrl: './compare-product.component.html',
  styleUrl: './compare-product.component.css'
})
export class CompareProductComponent {


  PRODUCTS: any = [];

  currency: string = 'COP';

  constructor(
    public cookieService: CookieService,
    public toastr: ToastrService,
  ) {
    afterNextRender(() => {
      this.PRODUCTS = localStorage.getItem('compares') ? JSON.parse(localStorage.getItem('compares') ?? '') : [];
      this.currency = this.cookieService.get('currency') ? this.cookieService.get('currency') : 'COP';
    })
  }

  ngOnInit(): void {
    setTimeout(() => {
      MODAL_PRODUCT_DETAIL($);
    }, 50);
  }

  removeProduct(PRODUCT:any) {
    let INDEX = this.PRODUCTS.findIndex((item:any) => item.id == PRODUCT.id)
    if (INDEX != -1) {
      this.PRODUCTS.splice(INDEX, 1);
      setTimeout(() => {
        localStorage.setItem('compares', JSON.stringify(this.PRODUCTS));
      }, 50);
      this.toastr.info('Producto eliminado de la comparativa.');
    }
  }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  getTotalCurrency(PRODUCT: any) {
    if (this.currency == 'COP') {
      return PRODUCT.price_cop;
    } else {
      return PRODUCT.price_usd;
    }
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

}
