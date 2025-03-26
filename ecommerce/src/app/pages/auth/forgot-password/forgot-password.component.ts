import { Component } from '@angular/core';
import { CodeForgotPasswordComponent } from '../code-forgot-password/code-forgot-password.component';
import { NewPasswordComponent } from '../new-password/new-password.component';
import { CommonModule } from '@angular/common';
import { AuthService } from '../service/auth.service';
import { ToastrService } from 'ngx-toastr';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-forgot-password',
  standalone: true,
  imports: [CodeForgotPasswordComponent, RouterModule, NewPasswordComponent, CommonModule, FormsModule],
  templateUrl: './forgot-password.component.html',
  styleUrl: './forgot-password.component.css'
})
export class ForgotPasswordComponent {

  isLoadingMail:any = null;
  isLoadingCode:any = null;

  email: string = '';
  code: string = '';
  new_password: string = '';

  constructor(
    public authService: AuthService,
    public toastr: ToastrService,

  ){

  }

  verifiedMail() {
    if (!this.email) {
      this.toastr.warning('Validacion', 'El campo correo es obligatorio.');
      return;
    }
    let data = {
      email: this.email,
    }
    this.authService.verifiedMail(data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 200) {
        this.isLoadingMail = 1;
        this.toastr.success('Exito', 'Ingresa el codigo que enviamos a tu correo electronico.');
      }else {
        this.isLoadingMail = null;
        this.toastr.error('Validacion', 'El correo eletronico no pertenece a ningun usuario.');
      }
     });
  }

  LoadingCode($event:any)  {
    this.isLoadingCode = $event;
  }

  CodeValue($event:any) {
    this.code = $event;
  }
}
