import { Component, EventEmitter, Input, Output } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { BrandService } from '../service/brand.service';

@Component({
  selector: 'app-edit-brand',
  templateUrl: './edit-brand.component.html',
  styleUrls: ['./edit-brand.component.scss']
})
export class EditBrandComponent {
  @Output() BrandE: EventEmitter<any> = new EventEmitter();
  @Input () brand: any;

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
    this.name = this.brand.name;
    this.state = this.brand.state;
  }

  store() {

    if (!this.name) {
      this.toastr.error('Validacion', 'Todos los campos son requeridos');
      return;
    }

    let data = {
      name: this.name,
      state: this.state
    }

    this.brandService.updateBrands(this.brand.id, data).subscribe((resp: any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', 'La Marca ya existe');
        return;
      } else {
        this.BrandE.emit(resp.brand);
        this.toastr.success('Validacion', 'Marca editada con exito');
        this.modal.close();
      }
    })
  }
}
