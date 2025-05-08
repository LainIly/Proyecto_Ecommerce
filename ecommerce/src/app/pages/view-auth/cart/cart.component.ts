import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CartService } from '../../home/service/cart.service';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [FormsModule, RouterModule, CommonModule],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.css'
})
export class CartComponent {

  currency: string = 'COP';
  listCarts: any = [];
  totalCarts: number = 0;

  code_cupon: string = '';

  constructor(
    public cartService: CartService,
    public cookieService: CookieService,
    private toastr: ToastrService,
  ) {

  }

  ngOnInit(): void {
    this.currency = this.cookieService.get('currency') ? this.currency = this.cookieService.get('currency') : 'COP';
    this.cartService.currentDataCart$.subscribe((resp: any) => {
      // console.log(resp);
      this.listCarts = resp;
      this.totalCarts = this.listCarts.reduce((sum: number, item: any) => sum + item.total, 0);
    })
  }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  deleteCart(CART: any) {
    this.cartService.deleteCart(CART.id).subscribe((resp: any) => {
      this.toastr.info('Se eliminó el producto.')
      this.cartService.removeCart(CART);
    })
  }

  minusQuantity(cart: any) {
    if (cart.quantity == 1) {
      this.toastr.error('Validacion', 'No se puede eliminar el producto.')
      return;
    }
    cart.quantity = cart.quantity - 1;
    cart.total = cart.subtotal * cart.quantity;

    this.cartService.updateCart(cart.id, cart).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);

      } else {
        this.cartService.changeCart(resp.cart);
        this.toastr.info('Se actualizó el producto.');
      }
    });
  }

  plusQuantity(cart: any) {

    let quantity_old = cart.quantity;

    cart.quantity = cart.quantity + 1;
    cart.total = cart.subtotal * cart.quantity;

    this.cartService.updateCart(cart.id, cart).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        cart.quantity = quantity_old;
        cart.total = cart.subtotal * cart.quantity;
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.cartService.changeCart(resp.cart);
        this.toastr.info('Se actualizó el producto.');
      }
    });
  }

  applyCupon() {
    if (!this.code_cupon) {
      this.toastr.error('Validacion', 'Se necesita ingresar un Codigo de Cupon.');
      return;
    }

    let data = {
      code_cupon: this.code_cupon,
    }

    this.cartService.applyCupon(data).subscribe((resp: any) => {
      console.log(resp);
    })
  }
}