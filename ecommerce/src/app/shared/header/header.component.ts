import { afterNextRender, afterRender, Component } from '@angular/core';
import { HomeService } from '../../pages/home/service/home.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { CartService } from '../../pages/home/service/cart.service';
import { ToastrService } from 'ngx-toastr';
import { ProfileClientService } from '../../pages/view-auth/profile-client/service/profile-client.service';

declare function CurrecyChange([]): any;
declare var $: any;

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

  imagen_previsualiza: any;

  user: any;
  listCarts: any = [];
  totalCarts: number = 0;
  isLoading: boolean = false;

  search: string = '';

  constructor(
    public homeService: HomeService,
    public cookieService: CookieService,
    public cartService: CartService,
    private toastr: ToastrService,
    public profileClient: ProfileClientService
  ) {
    afterNextRender(() => {
      this.homeService.menus().subscribe((resp: any) => {
        // console.log(resp);
        this.categories_menus = resp.categories_menus;
      })
      this.currency = this.cookieService.get('currency') ? this.currency = this.cookieService.get('currency') : 'COP';
      this.user = this.cartService.authService.user;
      
      this.profileClient.showUsers().subscribe((resp:any) => {
        this.imagen_previsualiza = resp.avatar;
      })
      

      if (this.user) {
        this.cartService.listCart().subscribe((resp: any) => {
          resp.carts.data.forEach((cart: any) => {
            if (cart.currency != this.currency) {
              this.cookieService.set('currency', cart.currency);
              setTimeout(() => {
                window.location.reload();
              }, 25)
            }
            this.cartService.changeCart(cart);
          });
        })
      }
    })

    afterRender(() => {
      setTimeout(() => {
        this.isLoading = true;
        setTimeout(() => {
          CurrecyChange($);
        }, 50);
      }, 50);
    })
  }

  ngOnInit(): void {
    this.cartService.currentDataCart$.subscribe((resp: any) => {
      // console.log(resp);
      this.listCarts = resp;
      this.totalCarts = this.listCarts.reduce((sum: number, item: any) => sum + item.total, 0);
    })
  }

  logout() {
    this.cartService.authService.logout();

    setTimeout(() => {
      window.location.reload();
    }, 50)
  }

  deleteCart(CART: any) {
    this.cartService.deleteCart(CART.id).subscribe((resp: any) => {
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
    if (this.user) {
      this.cartService.deleteCartsAll().subscribe((resp: any) => {
        this.cookieService.set('currency', val);
        window.location.reload();
      })
    } else {
      this.cookieService.set('currency', val);
      setTimeout(() => {
        window.location.reload();
      }, 25);
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

  searchProduct() {
    window.location.href = '/productos-busqueda?search=' + this.search;
  }
}