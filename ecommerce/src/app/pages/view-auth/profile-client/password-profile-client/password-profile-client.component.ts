import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ProfileClientService } from '../service/profile-client.service';

@Component({
  selector: 'app-password-profile-client',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './password-profile-client.component.html',
  styleUrl: './password-profile-client.component.css'
})
export class PasswordProfileClientComponent {

  password: string = '';
  confirmed_password: string = '';

  constructor(
    public toastr: ToastrService,
    public profileClient: ProfileClientService
  ) {

  }

  updateUser() {
    if (!this.password || !this.confirmed_password) {
      this.toastr.error('Es necesario ingresar una contraseña y su confirmación.');
      return;
    }

    if (this.password != this.confirmed_password) {
      this.toastr.error('Las contraseñas no coinciden.');
      return;
    }

    let data = {
      password: this.password,
    }

    this.profileClient.updateProfile(data).subscribe((resp: any) => {
      console.log(resp);

      if (resp.message == 403) {
        this.toastr.error(resp.message_text);
      } else {
        this.toastr.success('Contraseña actualizada correctamente.');
      }
    });
  }
}
