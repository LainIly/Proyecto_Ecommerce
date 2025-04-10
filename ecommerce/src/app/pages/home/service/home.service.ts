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

  home () {
    let URL = URL_SERVICIOS+'/ecommerce/home';
    return this.http.get(URL);
  }
}
