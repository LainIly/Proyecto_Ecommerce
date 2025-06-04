import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { ProfileClientService } from '../service/profile-client.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-edit-profile-client',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './edit-profile-client.component.html',
  styleUrl: './edit-profile-client.component.css'
})
export class EditProfileClientComponent {

  name: string = '';
  surname: string = '';
  email: string = '';
  phone: string = '';
  bio: string = '';
  fb: string = '';
  tw: string = '';
  sexo: string = '';
  address_city: string = '';
  description: string = '';

  constructor(
    public profileClient: ProfileClientService,
    public toast: ToastrService,
  ) {
    this.profileClient.showUsers().subscribe((resp: any) => {
      // console.log(resp);
      this.name = resp.name;
      this.surname = resp.surname;
      this.email = resp.email;
      this.phone = resp.phone;
      this.bio = resp.bio;
      this.fb = resp.fb;
      this.tw = resp.tw;
      this.sexo = resp.sexo;
      this.address_city = resp.address_city;
    });
  }

  updateUser() {
    if (!this.name || !this.email) {
      this.toast.error('Es necesario ingresar un Nombre y un Correo.');
      return;
    }
    let data = {
      name: this.name,
      surname: this.surname,
      email: this.email,
      phone: this.phone,
      bio: this.bio,
      fb: this.fb,
      tw: this.tw,
      sexo: this.sexo,
      address_city: this.address_city,
    }
    this.profileClient.updateProfile(data).subscribe((resp: any) => {
      console.log(resp);

      if (resp.message == 403) {
        this.toast.error(resp.message_text);
      } else {
        this.toast.success('Usuario actualizado correctamente.');
      }
    });
  }
}
