import { Component } from '@angular/core';
import { SalesService } from '../service/sales.service';
import { ToastrService } from 'ngx-toastr';
import { URL_SERVICIOS } from 'src/app/config/config';

@Component({
  selector: 'app-sale-list',
  templateUrl: './sale-list.component.html',
  styleUrls: ['./sale-list.component.scss']
})
export class SaleListComponent {
  sales: any = [];
  search: string = '';
  totalPages: number = 0;
  currentPage: number = 1;

  isLoading$: any;

  marcas: any = [];
  marca_id: string = '';

  categorie_first_id: string = '';
  categorie_second_id: string = '';
  categorie_third_id: string = '';
  categories_first: any = [];
  categories_seconds: any = [];
  categories_seconds_backups: any = [];
  categories_thirds: any = [];
  categories_thirds_backups: any = [];

  start_date: any;
  end_date: any;
  method_payment: any;
  URL_SERVICIOST:any = URL_SERVICIOS;

  constructor(
    private salesService: SalesService,
    private toastr: ToastrService
  ) {

  }

  ngOnInit(): void {
    this.listSales();
    this.isLoading$ = this.salesService.isLoading$;
    this.configAll();
  }

  configAll() {
    this.salesService.configAll().subscribe((resp: any) => {
      // console.log(resp);

      this.marcas = resp.brands;
      this.categories_first = resp.categories_first;
      this.categories_seconds = resp.categories_seconds;
      this.categories_thirds = resp.categories_thirds;
    })
  }

  listSales(page = 1) {
    let data = {
      search: this.search,
      brand_id: this.marca_id,
      categorie_first_id: this.categorie_first_id,
      categorie_second_id: this.categorie_second_id,
      categorie_third_id: this.categorie_third_id,
      start_date: this.start_date,
      end_date: this.end_date,
      method_payment: this.method_payment
    }

    this.salesService.listSales(page, data).subscribe((resp: any) => {
      // console.log(resp);
      this.sales = resp.sales.data;
      this.totalPages = resp.total;
      this.currentPage = page;
    })
  }

  changeDepartamento() {
    this.categories_seconds_backups = this.categories_seconds.filter((item: any) =>
      item.categorie_second_id == this.categorie_first_id
    )
  }

  changeCategorie() {
    this.categories_thirds_backups = this.categories_thirds.filter((item: any) =>
      item.categorie_second_id == this.categorie_second_id
    )
  }

  searchTo() {
    this.listSales();
  }

  loadPage($event: any) {
    // console.log($event);
    this.listSales($event);
  }

  reset() {
    this.search = '';
    this.marca_id = '';
    this.categorie_first_id = '';
    this.categorie_second_id = '';
    this.categorie_third_id = '';
    this.start_date = '';
    this.end_date = '';
    this.method_payment = '';

    this.listSales();
  }

  exportToExcel() {
    let LINK = '';
    if (this.search) {
      LINK+= '&search=' + this.search;
    }

    if (this.marca_id) {
      LINK += '&brand_id=' + this.search;
    }

    if (this.categorie_first_id) {
      LINK += '&brand_id=' + this.search;
    }

    if (this.categorie_second_id) {
      LINK += '&categorie_second_id=' + this.categorie_second_id;
    }

    if (this.categorie_third_id) {
      LINK += '&categorie_third_id=' + this.categorie_third_id;
    }

    if (this.start_date) {
      LINK += '&start_date=' + this.start_date;
    }

    if (this.end_date) {
      LINK += '&end_date=' + this.end_date;
    }

    if (this.method_payment) {
      LINK += '&method_payment=' + this.method_payment;
    }

    window.open(URL_SERVICIOS + '/sales/list-excel?k=1' + LINK, '_blank');
  }

  formatPriceToCOP(price: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(price);
  }
}
