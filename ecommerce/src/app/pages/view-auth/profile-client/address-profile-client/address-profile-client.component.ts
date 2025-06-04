import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { UserAddressService } from '../../service/user-address.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-address-profile-client',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './address-profile-client.component.html',
  styleUrl: './address-profile-client.component.css'
})
export class AddressProfileClientComponent {

  name: string = '';
  surname: string = '';
  company: string = '';
  country_region: string = '';
  city: string = '';
  address: string = '';
  street: string = '';
  postcode_zip: string = '';
  phone: string = '';
  email: string = '';

  address_list: any = [];
  address_selected: any;

  constructor(
    public addressService: UserAddressService,
    private toastr: ToastrService,
  ) {
    this.addressService.listAddress().subscribe((resp: any) => {
      // console.log(resp);
      this.address_list = resp.address;
    })
  }

  resetAddress() {
    this.address_selected = null;
    this.name = '';
    this.surname = '';
    this.company = '';
    this.country_region = '';
    this.city = '';
    this.address = '';
    this.street = '';
    this.postcode_zip = '';
    this.phone = '';
    this.email = '';
  }

  selectedAddress(addres: any) {

    this.address_selected = addres;

    this.name = this.address_selected.name;
    this.surname = this.address_selected.surname;
    this.company = this.address_selected.company;
    this.country_region = this.address_selected.country_region;
    this.city = this.address_selected.city;
    this.address = this.address_selected.address;
    this.street = this.address_selected.street;
    this.postcode_zip = this.address_selected.postcode_zip;
    this.phone = this.address_selected.phone;
    this.email = this.address_selected.email;
  }

  registerAddress() {

    if (!this.name ||
      !this.surname ||
      !this.company ||
      !this.country_region ||
      !this.city ||
      !this.address ||
      !this.street ||
      !this.postcode_zip ||
      !this.phone ||
      !this.email) {
      this.toastr.error('Error', 'Por favor complete todos los campos requeridos.');

      return;
    }

    let data = {
      name: this.name,
      surname: this.surname,
      company: this.company,
      country_region: this.country_region,
      city: this.city,
      address: this.address,
      street: this.street,
      postcode_zip: this.postcode_zip,
      phone: this.phone,
      email: this.email
    }
    this.addressService.registerAddress(data).subscribe((resp: any) => {
      console.log(resp);
      this.toastr.success('Exito', 'Dirección registrada correctamente.');
      this.address_list.unshift(resp.addres);
      this.resetAddress();
    });
  }

  editAddress() {

    if (!this.name ||
      !this.surname ||
      !this.company ||
      !this.country_region ||
      !this.city ||
      !this.address ||
      !this.street ||
      !this.postcode_zip ||
      !this.phone ||
      !this.email) {
      this.toastr.error('Error', 'Por favor complete todos los campos requeridos.');

      return;
    }

    let data = {
      name: this.name,
      surname: this.surname,
      company: this.company,
      country_region: this.country_region,
      city: this.city,
      address: this.address,
      street: this.street,
      postcode_zip: this.postcode_zip,
      phone: this.phone,
      email: this.email
    }
    this.addressService.updateAddress(this.address_selected.id, data).subscribe((resp: any) => {
      console.log(resp);
      this.toastr.success('Exito', 'Dirección actualizada correctamente.');
      let INDEX = this.address_list.findIndex((item: any) => item.id == resp.addres.id);

      if (INDEX != -1) {
        this.address_list[INDEX] = resp.addres;
      }
    });
  }
}