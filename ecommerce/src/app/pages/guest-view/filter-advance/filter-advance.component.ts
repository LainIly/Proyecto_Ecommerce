import { Component } from '@angular/core';
import { HomeService } from '../../home/service/home.service';
import { CookieService } from 'ngx-cookie-service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-filter-advance',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
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

  constructor(
    public homeService: HomeService,
    public cookieService: CookieService,
  ) {
    this.homeService.getConfigFilter().subscribe((resp: any) => {
      // console.log(resp);

      this.Categories = resp.categories;
      this.Colors = resp.colors;
      this.Brands = resp.brands;
      this.Products_relateds = resp.product_relateds.data;
    })
    this.homeService.filterAdvanceProduct({}).subscribe((resp:any) => {
      // console.log(resp);
    })
  }

  ngOnInit(): void {
    this.currency = this.cookieService.get("currency") ? this.cookieService.get("currency") : 'COP';
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
}