import { afterNextRender, Component, ElementRef, ViewChild } from '@angular/core';
import { CartService } from '../../home/service/cart.service';
import { CookieService } from 'ngx-cookie-service';
import { UserAddressService } from '../service/user-address.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

declare var paypal: any;
declare var MercadoPago: any;

@Component({
  selector: 'app-checkout',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './checkout.component.html',
  styleUrl: './checkout.component.css'
})
export class CheckoutComponent {

  listCarts: any = [];
  totalCarts: number = 0;
  currency: string = 'COP';
  address_list: any = [];

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

  address_selected: any;
  description: string = '';

  @ViewChild('paypal', { static: true }) paypalElement?: ElementRef;

  price_dolar: number = 4;

  PREFERENCE_ID: string = '';

  constructor(
    public cartService: CartService,
    public cookieService: CookieService,
    public addressService: UserAddressService,
    private toastr: ToastrService,
    public router: Router,
    public http: HttpClient
  ) {
    afterNextRender(() => {
      this.addressService.listAddress().subscribe((resp: any) => {
        console.log(resp);

        this.address_list = resp.address;
      })
    })
  }

  ngOnInit(): void {
    this.currency = this.cookieService.get("currency") ? this.cookieService.get("currency") : 'COP';

    this.cartService.currentDataCart$.subscribe((resp: any) => {
      this.listCarts = resp;
      this.totalCarts = this.listCarts.reduce((sum: number, item: any) => sum + item.total, 0);
    });


    //Consultar el precio del dolar al iniciar con API
    this.http.get('https://open.er-api.com/v6/latest/USD').subscribe((resp:any) => {
      this.price_dolar = resp.rates.COP;
    });

    paypal.Buttons({
      // optional styling for buttons
      // https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
      style: {
        color: "gold",
        shape: "rect",
        layout: "vertical"
      },

      // set up the transaction
      createOrder: (data: any, actions: any) => { //Implentacion de PayPal
        // pass in any options from the v2 orders create call:
        // https://developer.paypal.com/api/orders/v2/#orders-create-request-body

        if (this.totalCarts == 0) {
          this.toastr.error('Error', 'No se puede procesar el pago con un monto de $ 0.');
          return;
        }

        if (this.listCarts.length == 0) {
          this.toastr.error('Error', 'No hay productos en el carrito.');
          return;
        }

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
          this.toastr.error('Error', 'Los campos de la dirección son requeridos.');

          return;
        }

        const createOrderPayload = {
          purchase_units: [
            {
              amount: {
                description: "COMPRAR POR EL ECOMMERCE",
                value: this.totalPayPal(),
              }
            }
          ]
        };

        return actions.order.create(createOrderPayload);
      },

      // finalize the transaction
      onApprove: async (data: any, actions: any) => {

        let Order = await actions.order.capture();
        // Order.purchase_units[0].payments.captures[0].id

        let dataSale = {
          method_payment: 'PAYPAL',
          currency_total: this.currency,
          currency_payment: 'USD',
          discount: 0,
          subtotal: this.totalPayPal(),
          total: this.totalPayPal(),
          price_dolar: 0,
          n_transaccion: Order.purchase_units[0].payments.captures[0].id,
          description: this.description,
          sale_address: {
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
        }

        this.cartService.checkout(dataSale).subscribe((resp: any) => {
          console.log(resp);
          this.toastr.success('Exito', 'Pago realizado correctamente.');
          this.cartService.resetCart();
          setTimeout(() => {
            this.router.navigateByUrl('gracias-por-tu-compra/' + Order.purchase_units[0].payments.captures[0].id);
          }, 50)
        });
        // return actions.order.capture().then(captureOrderHandler);
      },

      // handle unrecoverable errors
      onError: (err: any) => {
        console.error('An error prevented the buyer from checking out with PayPal');
      }
    }).render(this.paypalElement?.nativeElement);


  } //Falta implementar el metodo de pago con MercadoPago

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }

  totalPayPal() {
    if (this.currency == 'USD') {
      return this.totalCarts;
    } else {
      return (this.totalCarts / this.price_dolar).toFixed(2);
    }
  }

  openMercadoPago() {

    if (this.totalCarts == 0) {
      this.toastr.error('Error', 'No se puede procesar el pago con un monto de $ 0.');
      return;
    }

    if (this.listCarts.length == 0) {
      this.toastr.error('Error', 'No hay productos en el carrito.');
      return;
    }

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
      this.toastr.error('Error', 'Los campos de la dirección son requeridos.');

      return;
    }

    this.cartService.mercadopago(this.totalCarts).subscribe((resp: any) => {
      console.log(resp);

      this.PREFERENCE_ID = resp.preference.id;

      let data = {
        description: this.description,
        sale_address: {
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
      }

      this.cartService.storeTemp(data).subscribe((resp: any) => {
        console.log(resp);

        const mp = new MercadoPago('TEST-0dfa0e67-2116-46d0-9709-ebf95db9db3f');
        const bricksBuilder = mp.bricks();

        mp.bricks().create("wallet", "wallet_container", {
          initialization: {
            preferenceId: this.PREFERENCE_ID,
          },
        });

        // mp.checkout({ //FORMA DE PAGO CON VENTANA MODAL
        //   preference: {
        //     id: this.PREFERENCE_ID, // ID de la preferencia
        //   },
        //   render: {
        //     container: "#wallet_container",
        //     label: "Pagar",
        //   },
        //   callback: (response: any) => {
        //     console.log(response);
        //     if (response.status === 'approved') {
        //       console.log('Pago aprobado. Detalles:', response);
        //     } else {
        //       console.log('Pago no aprobado o cancelado. Detalles:', response);
        //     }
        //   },
        // });
      })
    })
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
}
