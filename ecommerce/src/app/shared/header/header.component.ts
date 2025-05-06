import { afterNextRender, Component } from '@angular/core';
import { HomeService } from '../../pages/home/service/home.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { CartService } from '../../pages/home/service/cart.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [FormsModule, RouterModule, CommonModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {

  categories_menus: any = [];
  currency: string = 'COP';

  user: any;
  listCarts: any = [];
  totalCarts: number = 0;

  constructor(
    public homeService: HomeService,
    public cookieService: CookieService,
    public cartService: CartService,
    private toastr: ToastrService,
  ) {
    afterNextRender(() => {
      this.homeService.menus().subscribe((resp: any) => {
        // console.log(resp);
        this.categories_menus = resp.categories_menus;
      })
      this.currency = this.cookieService.get('currency') ? this.currency = this.cookieService.get('currency') : 'COP';
      this.user = this.cartService.authService.user;

      if (this.user) {
        this.cartService.listCart().subscribe((resp: any) => {
          // console.log(resp);
          resp.carts.data.forEach((cart: any) => {
            this.cartService.changeCart(cart);
          });
        })
      }
    })
  }

  ngOnInit(): void {
    this.cartService.currentDataCart$.subscribe((resp: any) => {
      // console.log(resp);
      this.listCarts = resp;
      this.totalCarts = this.listCarts.reduce((sum: number, item: any) => sum + item.total, 0);
    })
  }

  deleteCart(CART: any) {
    this.cartService.deleteCart(CART.id).subscribe((resp:any) => {
      this.toastr.info('Se eliminó el producto.')
      this.cartService.removeCart(CART);
    })
  }

  getIconMenu(menu: any) {
    var miDiv: any = document.getElementById('icon-' + menu.id);
    miDiv.innerHTML = menu.icon;
    return '';
  }

  changeCurrency(val: string) {
    this.cookieService.set('currency', val);
    setTimeout(() => {
      window.location.reload();
    }, 50);
  }

  formatPriceToCOP(price: number) { // F
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  } 
}