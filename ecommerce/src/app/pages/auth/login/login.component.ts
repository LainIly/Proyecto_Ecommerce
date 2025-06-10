import { afterNextRender, Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../service/auth.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { RouterModule } from '@angular/router';
import { after } from 'node:test';

declare function password_show_toggle(): any;

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, RouterModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})

export class LoginComponent {

  email: string = '';
  password: string = '';
  code_user: string = '';

  constructor(
    private toastr: ToastrService,
    private authService: AuthService,
    private router: Router,
    public activedRoute: ActivatedRoute,
  ) {
    afterNextRender(() => {
      setTimeout(() => {
        password_show_toggle()
      }, 50);
    })
  }

  ngOnInit(): void {
    if (this.authService.token && this.authService.user) {
      this.router.navigateByUrl('/');
      return;
    }

    this.activedRoute.queryParams.subscribe((resp: any) => {
      this.code_user = resp.code;
    })

    if (this.code_user) {
      let data = {
        code_user: this.code_user,
      }
      this.authService.verifiedAuth(data).subscribe((resp: any) => {
        console.log(resp);

        if (resp.message == 403) {
          this.toastr.error('Validacion', 'El codigo no pertence a ningun usuario.');
        }

        if (resp.message == 200) {
          this.toastr.success('Exito', 'El correo ha sido verificado. Ingresar a la tienda.');
          setTimeout(() => {
            this.router.navigateByUrl('/login')
          }, 500)
        }
      })
    }
  }

  login() {
    if (!this.email || !this.password) {
      this.toastr.error('Validacion', 'Necesitas ingresar todos los campos.');
      return;
    }
    this.authService.login(this.email, this.password).subscribe((resp: any) => {
      // console.log(resp);
      if (resp.error && resp.error.error) {
        this.toastr.error(resp.error.error);
        return;
      }

      if (resp == true) {
        this.toastr.success('Bienvenido', 'Inicio de sesion correcto');
        setTimeout(() => {
          window.location.reload();
        }, 50)
        return;
      }
    }, (error) => {
      console.log(error);
    })
  }
}
