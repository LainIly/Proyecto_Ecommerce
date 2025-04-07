import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { CuponesService } from '../service/cupones.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-cupone',
  templateUrl: './edit-cupone.component.html',
  styleUrls: ['./edit-cupone.component.scss']
})
export class EditCuponeComponent {

  code:any;
  type_discount:number = 1;
  discount:number = 0;
  type_count:number = 1;
  num_use:number = 0;
  type_cupone:number = 1;
  state:number = 1;

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
 
  CUPONE_ID:any;
  CUPONE_SELECTED:any;

  constructor (
    public cuponesService: CuponesService,
    public toastr: ToastrService,
    public activedRoute: ActivatedRoute,
  ) {

  }

  ngOnInit() : void {
    this.isLoading$ = this.cuponesService.isLoading$;

    this.cuponesService.configCupones().subscribe((resp:any) => {
      this.categories_first = resp.categories;
      this.products = resp.products;
      this.brands = resp.brands;      
    })
    this.activedRoute.params.subscribe((resp:any) => {
      this.CUPONE_ID = resp.id;
    })

    this.cuponesService.showCupone(this.CUPONE_ID).subscribe((resp:any) => {
      console.log(resp);

      this.CUPONE_SELECTED = resp.cupone;

      this.code = resp.cupone.code;
      this.type_discount = resp.cupone.type_discount;
      this.discount = resp.cupone.discount;
      this.type_count = resp.cupone.type_count;
      this.num_use = resp.cupone.num_use;
      this.type_cupone = resp.cupone.type_cupone;

      this.categories_add = resp.cupone.categories;
      this.products_add = resp.cupone.products;
      this.brands_add = resp.cupone.brands;
      this.state = resp.cupone.state;

      if (this.products_add.length > 0) {
        this.product_id = this.products_add[0].id;
      }

      if (this.categories_add.length > 0) {
        this.categorie_id = this.categories_add[0].id;
      }

      if (this.brands_add.length > 0) {
        this.brand_id = this.brands_add[0].id;
      }
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

    if (this.type_cupone == 1 && this.products_add.length > 0) {
      this.product_id = this.products_add[0].id;
    } else {
      this.product_id = null;
    }

    if (this.type_cupone == 2 && this.categories_add.length > 0) {
      this.categorie_id = this.categories_add[0].id;
    } else {
      this.categorie_id = null;
    }

    if (this.type_cupone == 3 && this.brands_add.length > 0) {
      this.brand_id = this.brands_add[0].id;
    } else {
      this.brand_id = null;
    }
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
      brand_selected: this.brands_add,
      state: this.state,
    }
    this.cuponesService.updateCupones(this.CUPONE_ID, data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.toastr.success('Exito', 'Cupon actualizado correctamente');
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
