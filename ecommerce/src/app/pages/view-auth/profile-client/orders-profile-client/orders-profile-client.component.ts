import { Component } from '@angular/core';
import { ProfileClientService } from '../service/profile-client.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

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
  sale_detail_review: any;
  rating: number = 0;
  message: string = '';

  constructor(
    public profileCliente: ProfileClientService,
    public toastr: ToastrService,
  ) {
    this.profileCliente.showOrders().subscribe((resp: any) => {
      // console.log(resp);
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

  reviewShow(sale_detail: any) {
    this.sale_detail_review = sale_detail;

    if (this.sale_detail_review.review) {
      this.rating = this.sale_detail_review.review.rating;
      this.message = this.sale_detail_review.review.message;
    }
  }

  selectedRating(val: number) {
    this.rating = val;
  }

  backList() {
    this.sale_detail_review = null;
    this.rating = 0;
    this.message = '';
  }

  saveReview() {

    if (!this.message || !this.rating) {
      this.toastr.error('Necesitas completar todos los campos.');
      return;
    }

    let data = {
      product_id: this.sale_detail_review.product_id,
      sale_detail_id: this.sale_detail_review.id,
      message: this.message,
      rating: this.rating
    }

    if (this.sale_detail_review.review) {
      this.profileCliente.updateReview(this.sale_detail_review.review.id, data).subscribe((resp: any) => {
        // console.log(resp);
        this.toastr.success('Reseña editada correctamente.');
        this.sale_detail_review.review = resp.review;
      });
    } else {
      this.profileCliente.registerReview(data).subscribe((resp: any) => {
        // console.log(resp);
        this.toastr.success('Reseña registrada correctamente.');
        this.sale_detail_review.review = resp.review;
      });
    }
  }
}
