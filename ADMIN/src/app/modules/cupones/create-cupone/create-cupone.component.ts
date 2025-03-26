import { Component } from '@angular/core';
import { CuponesService } from '../service/cupones.service';

@Component({
  selector: 'app-create-cupone',
  templateUrl: './create-cupone.component.html',
  styleUrls: ['./create-cupone.component.scss']
})
export class CreateCuponeComponent {

  code:any;
  type_discount:number = 1;
  discount:number = 0;
  type_count:number = 1;
  num_use:number = 0;
  type_cupone:number = 1;

  product_id:any;
  categorie_id:any;
  brand_id:any;

  isLoading$:any;
  
  categories_first:any = [];
  products:any = [];
  brands:any = [];

  categories_add:any = [];
  products_add:any = [];
  brands_add:any = [];

  constructor (
    public cuponesService: CuponesService,
  ) {

  }

  ngOnInit() : void {
    this.isLoading$ = this.cuponesService.isLoading$;

    this.cuponesService.configCupones().subscribe((resp:any) => {
      this.categories_first = resp.categories;
      console.log(this.categories_first);
      this.products = resp.products;
      console.log(this.products);
      this.brands = resp.brands;
      console.log(this.brands);
    })
  }

  save () {

  }

  changeTypeDiscount (value:number) {
    this.type_discount = value;
  }

  changeTypeCount (value:number) {
    this.type_count = value;
  }

  changeTypeCupone (value:number) {
    this.type_cupone = value
  }

  removeProduct(product:any) {

  }

  removeCategorie(categorie:any) {

  }

  removeBrand(brand:any) {

  }
}
