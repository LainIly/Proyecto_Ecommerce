import { Injectable } from '@angular/core';
import { URL_SERVICIOS } from '../../../config/config';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../auth/service/auth.service';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  constructor(
    public http: HttpClient,
    public authService: AuthService,
  ) { }

  home() {
    let URL = URL_SERVICIOS + '/ecommerce/home';
    return this.http.get(URL);
  }

  menus() {
    let URL = URL_SERVICIOS + '/ecommerce/menus';
    return this.http.get(URL);
  }

  showProduct(slug: string, code_discount: string) {
    let URL = URL_SERVICIOS + '/ecommerce/product/' + slug + '?campaing_discount=' + code_discount;
    return this.http.get(URL);
  }
  
  getConfigFilter() {
    let URL = URL_SERVICIOS + '/ecommerce/config-filter-advance';
    return this.http.get(URL);
  }

  filterAdvanceProduct(data: any) {
    let URL = URL_SERVICIOS + '/ecommerce/filter-advance-product';
    return this.http.post(URL, data);
  }
}
