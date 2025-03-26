import { afterNextRender, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import { of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { URL_SERVICIOS } from '../../../config/config';
import { after } from 'node:test';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  token: string = '';
  user: any;

  constructor (
    public http: HttpClient,
    public router: Router
  ) {
    afterNextRender (() => {
      this.initAuth();
    })
   }

  initAuth() {
    if (localStorage.getItem('token')) {
      this.user = localStorage.getItem('user') ? JSON.parse(localStorage.getItem('user') ?? '') : null;
      this.token = localStorage.getItem('token') + "";
    }
  }

  login (email:string, password:string){
    let URL = URL_SERVICIOS+"/auth/login_ecommerce";
    return this.http.post(URL, {email, password}).pipe(
      map((resp:any) => {
        console.log(resp);
        const result = this.saveLocalStorage(resp);
        return result;
      }),
      catchError ((err:any) => {
        console.log(err);
        return of(err);
      })
    )
  }

  saveLocalStorage(resp:any){
    if (resp && resp.access_token) {
      localStorage.setItem('token', resp.access_token);
      localStorage.setItem('user', JSON.stringify(resp.user));
      return true;
    }
    return false;
  }

  register (data:any) {
    let URL = URL_SERVICIOS+"/auth/register";
    return this.http.post(URL, data);
  }
  
  verifiedAuth(data:any){
    let URL = URL_SERVICIOS+"/auth/verified_auth";
    return this.http.post(URL,data);
  }

  verifiedMail(data:any){
    let URL = URL_SERVICIOS+"/auth/verified_email";
    return this.http.post(URL,data);
  }

  verifiedCode(data:any){
    let URL = URL_SERVICIOS+"/auth/verified_code";
    return this.http.post(URL,data);
  }

  verifiedNewPassword(data:any){
    let URL = URL_SERVICIOS+"/auth/new_password";
    return this.http.post(URL,data);
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.user = null;
    this.token = '';
     
    setTimeout(() => {
      this.router.navigateByUrl('/login');
    }, 500) 
  }
}
