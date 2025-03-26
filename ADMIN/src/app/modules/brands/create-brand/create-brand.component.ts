import { Component, EventEmitter, Output } from '@angular/core';
import { BrandService } from '../service/brand.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-create-brand',
  templateUrl: './create-brand.component.html',
  styleUrls: ['./create-brand.component.scss']
})
export class CreateBrandComponent {
  @Output() BrandC: EventEmitter<any> = new EventEmitter();

  name: string = '';
  state: number = 1;
  isLoading$: any;

  constructor(
    public brandService: BrandService,
    public modal: NgbActiveModal,
    public toastr: ToastrService,
  ) {

  }

  ngOnInit(): void {
    this.isLoading$ = this.brandService.isLoading$;
  }

  store() {

    if (!this.name) {
      this.toastr.error('Validacion', 'Todos los campos son requeridos');
      return;
    }

    let data = {
      name: this.name,
      state: 1
    }

    this.brandService.createBrands(data).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', 'La Marca ya existe');
        return;
      } else {
        this.BrandC.emit(resp.brand);
        this.toastr.success('Validacion', 'Marca creada con exito');
        this.modal.close();
      }
    })
  }
}
