import { EditProfileClientComponent } from './edit-profile-client/edit-profile-client.component';
import { AddressProfileClientComponent } from './address-profile-client/address-profile-client.component';
import { OrdersProfileClientComponent } from './orders-profile-client/orders-profile-client.component';
import { PasswordProfileClientComponent } from './password-profile-client/password-profile-client.component';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../auth/service/auth.service';
import { Component } from '@angular/core';
import { ProfileClientService } from './service/profile-client.service';

@Component({
  selector: 'app-profile-client',
  standalone: true,
  imports: [EditProfileClientComponent, AddressProfileClientComponent, OrdersProfileClientComponent, PasswordProfileClientComponent, CommonModule, FormsModule, RouterModule],
  templateUrl: './profile-client.component.html',
  styleUrl: './profile-client.component.css'
})
export class ProfileClientComponent {

  selected_tab: number = 0;
  imagen_previsualiza: any;
  name: string = '';
  surname: string = '';

  constructor(
    public authservice: AuthService,
    public profileClient: ProfileClientService
  ) {
    this.authservice.logout
    this.profileClient.showUsers().subscribe((resp: any) => {
      this.imagen_previsualiza = resp.avatar;
      this.name = resp.name;
      this.surname = resp.surname;
    })
  }

  selectTab(val: number) {
    this.selected_tab = val;
  }

  logout() {
    this.authservice.logout();
  
    setTimeout(() => {
      window.location.reload();
    },50)
  }

  onImagenPrevisualizaChange(imagen: any) {
    this.imagen_previsualiza = imagen;
    console.log(this.imagen_previsualiza);
  }
}