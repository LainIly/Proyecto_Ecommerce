import { Component, Input } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../service/auth.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-new-password',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './new-password.component.html',
  styleUrl: './new-password.component.css'
})
export class NewPasswordComponent {

  new_password: string = '';
  isLoadingCode: any = null;
  @Input() code: any = '';

  constructor(
    public authService: AuthService,
    public toastr: ToastrService,
    private router: Router
  ){

  }

  VerifiedNewPassword() {
    if (!this.new_password) {
      this.toastr.error('Validacion', 'La nueva contraseña es obligatoria.');
      return;
    }
    let data = {
      new_password: this.new_password,
      code: this.code
    }
    this.authService.verifiedNewPassword(data).subscribe((resp:any) => {
      console.log(resp);
      this.toastr.success('Exito', 'Contraseña actualizada correctamente.');
      this.router.navigateByUrl('/login');
    });
  }
}
