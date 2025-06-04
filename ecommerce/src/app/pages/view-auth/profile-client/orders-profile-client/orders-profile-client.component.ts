import { Component } from '@angular/core';
import { ProfileClientService } from '../service/profile-client.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-orders-profile-client',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './orders-profile-client.component.html',
  styleUrl: './orders-profile-client.component.css'
})
export class OrdersProfileClientComponent {

  sales: any = [];
  selectedSale: any = null;

  constructor(
    public profileCliente: ProfileClientService,
  ) {
    this.profileCliente.showOrders().subscribe((resp: any) => {
      console.log(resp);
      this.sales = resp.sales.data;
    });
  }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  detailShow(sale: any) {
    sale.sale_detail_show = !sale.sale_detail_show;
  }
}
