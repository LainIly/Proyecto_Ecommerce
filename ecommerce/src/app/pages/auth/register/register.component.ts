import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../service/auth.service';
import { ToastrService } from 'ngx-toastr';
import { FormsModule } from '@angular/forms';

declare function password_show_toggle(): any;

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [FormsModule, RouterModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {

  name: string = '';
  surname: string = '';
  email: string = '';
  password: string = '';
  phone: string = '';

  constructor(
    private authService: AuthService,
    private router: Router,
    private toastr: ToastrService
  ) {

  }

  ngOnInit () : void {
    setTimeout(() => {
      password_show_toggle()
    }, 50);
  }

  register () {
    if (!this.name ||
        !this.surname ||
        !this.email ||
        !this.password ||
        !this.phone) {
      this.toastr.error('Validacion', 'Necesitas ingresar todos los campos.');
      return;
    }

    let data = {
      name: this.name,
      surname: this.surname,
      email: this.email,
      password: this.password,
      phone: this.phone
     }
    this.authService.register(data).subscribe((resp:any) => {
      console.log(resp);
      this.toastr.success('Exito', 'Ingresa a tu correo para poder completar tu registro');
      setTimeout (() => {
        this.router.navigateByUrl('/login')
      }, 500)
    });
  }
}
