import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { URL_SERVICIOS } from '../../../config/config';
import { AuthService } from '../../auth/service/auth.service';

@Injectable({
  providedIn: 'root'
})
export class UserAddressService {

  constructor(
    public authService: AuthService,
    public http: HttpClient,
  ) { }

  listAddress () {
      let headers = new HttpHeaders({'Authorization': 'Bearer' + this.authService.token});
      let URL = URL_SERVICIOS + '/ecommerce/user_address/';
      return this.http.get(URL, {headers : headers});
    }
  
    registerAddress (data:any) {
      let headers = new HttpHeaders({'Authorization': 'Bearer' + this.authService.token});
      let URL = URL_SERVICIOS + '/ecommerce/user_address'
      return this.http.post(URL, data, {headers : headers});
    }
  
    updateAddress (addres_id: string, data:any) {
      let headers = new HttpHeaders({'Authorization': 'Bearer' + this.authService.token});
      let URL = URL_SERVICIOS + '/ecommerce/user_address/' + addres_id;
      return this.http.put(URL, data, {headers : headers});
    }
  
    deleteAddress (addres_id: string) {
      let headers = new HttpHeaders({'Authorization': 'Bearer' + this.authService.token});
      let URL = URL_SERVICIOS + '/ecommerce/user_address/' + addres_id;
      return this.http.delete(URL, {headers : headers});
    }
}
