import { Component } from '@angular/core';
import { CuponesService } from '../service/cupones.service';
import { ToastrService } from 'ngx-toastr';

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
    public toastr: ToastrService,
  ) {

  }

  ngOnInit() : void {
    this.isLoading$ = this.cuponesService.isLoading$;

    this.cuponesService.configCupones().subscribe((resp:any) => {
      this.categories_first = resp.categories;
      this.products = resp.products;
      this.brands = resp.brands;      
    })
  }

  changeTypeDiscount (value:number) {
    this.type_discount = value;
  }

  changeTypeCount (value:number) {
    this.type_count = value;
  }

  changeTypeCupone (value:number) {
    this.type_cupone = value;
    this.products_add = [];
    this.categories_add = [];
    this.brands_add = [];

    this.product_id = null;
    this.categorie_id = null;
    this.brand_id = null;
  }

  save () {
    if (!this.code || !this.discount) {
      this.toastr.error('Validacion', 'Complete todos los campos');
      return;
    }

    if (this.type_count == 2 && this.num_use == 0) {
      this.toastr.error('Validacion', 'Es necesitario ingresar el numero de usos al Cupon');
      return;
    }

    if (this.type_cupone == 1 && this.products_add.length == 0) {
      this.toastr.error('Validacion', 'Es necesitario agregar al menos un producto');
      return;
    } 

    if (this.type_cupone == 2 && this.categories_add.length == 0) {
      this.toastr.error('Validacion', 'Es necesitario agregar al menos una categoria');
      return;
    }

    if (this.type_cupone == 3 && this.brands_add.length == 0) {
      this.toastr.error('Validacion', 'Es necesitario agregar al menos una marca');
      return;
    }

    let data = {
      type_discount: this.type_discount,
      type_count: this.type_count,
      type_cupone: this.type_cupone,
      num_use: this.num_use,
      discount: this.discount,
      code: this.code,
      product_selected: this.products_add,
      categorie_selected: this.categories_add,
      brand_selected: this.brands_add
    }
    this.cuponesService.createCupones(data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.toastr.success('Exito', 'Cupon creado correctamente');
        this.type_discount = 1;
        this.type_count = 1;
        this.num_use = 0;
        this.discount = 0;
        this.code = '';
        this.products_add = [];
        this.categories_add = [];
        this.brands_add = [];
        this.product_id = null;
        this.categorie_id = null;
        this.brand_id = null;
      }
    })
  }

  addProduct() {
    if (!this.product_id) {
      this.toastr.error('Validacion', 'Seleccione un producto');
      return;
    }

    let INDEX = this.products_add.findIndex((prod:any) => prod.id == this.product_id);
    if (INDEX != -1) {
      this.toastr.error('Validacion', 'El producto ya fue agregado');
      return;
    }

    let DATA = this.products.find((product:any) => product.id == this.product_id);
    if (DATA) {
      this.products_add.push(DATA);
    }
  }

  addCategorie() {
    if (!this.categorie_id) {
      this.toastr.error('Validacion', 'Seleccione una categoria');
      return;
    }

    let INDEX = this.categories_add.findIndex((cat:any) => cat.id == this.categorie_id);
    if (INDEX != -1) {
      this.toastr.error('Validacion', 'La categoria ya fue agregada');
      return;
    }

    let DATA = this.categories_first.find((categorie:any) => categorie.id == this.categorie_id);
    if (DATA) {
      this.categories_add.push(DATA);
    }
  }
  
  addBrand () {
    if (!this.brand_id) {
      this.toastr.error('Validacion', 'Seleccione una marca');
      return;
    }

    let INDEX = this.brands_add.findIndex((brad:any) => brad.id == this.brand_id);
    if (INDEX != -1) {
      this.toastr.error('Validacion', 'La marca ya fue agregada');
      return;
    }

    let DATA = this.brands.find((brand:any) => brand.id == this.brand_id);
    if (DATA) {
      this.brands_add.push(DATA);
    }
  }

  removeProduct(product:any) {
    let index = this.products_add.findIndex((prod:any) => prod.id == product.id);
    if (index != -1) {
      this.products_add.splice(index, 1);
    }
  }

  removeCategorie(categorie:any) {
    let index = this.categories_add.findIndex((cat:any) => cat.id == categorie.id);
    if (index != -1) {
      this.categories_add.splice(index, 1);
    }
  }

  removeBrand(brand:any) {
    let index = this.brands_add.findIndex((brand:any) => brand.id == brand.id);
    if (index != -1) {
      this.brands_add.splice(index, 1);
    }
  }
}