import { Component, EventEmitter, Output } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../service/auth.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-code-forgot-password',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './code-forgot-password.component.html',
  styleUrl: './code-forgot-password.component.css'
})
export class CodeForgotPasswordComponent {
  code: string = '';
  isLoadingCode:any = null;

  @Output() LoadingCodeStatus: EventEmitter<any> = new EventEmitter();
  
  constructor (
    public authService: AuthService,
    public toastr: ToastrService,
  ) {

  }

  verifiedCode() {
    if (!this.code) {
      this.toastr.error('Validacion', 'El codigo de verificacion es obligatorio.');
    }
    let data = {
      code: this.code,
    }
    this.authService.verifiedCode(data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 200) {
        this.isLoadingCode = 1;
        this.LoadingCodeStatus.emit(this.isLoadingCode);
        this.toastr.success('Exito', 'Ingresa tu nueva contraseña.');
      }else {
        this.isLoadingCode = null;
        this.LoadingCodeStatus.emit(this.isLoadingCode);
        this.toastr.error('Validacion', 'El codigo de verificacion es incorrecto.');
      }
    });
  }
}