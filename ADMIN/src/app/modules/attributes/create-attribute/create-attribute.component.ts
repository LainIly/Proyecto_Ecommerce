import { Component, Output } from '@angular/core';
import { AttributesService } from '../service/attributes.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { EventEmitter } from '@angular/core';

@Component({
  selector: 'app-create-attribute',
  templateUrl: './create-attribute.component.html',
  styleUrls: ['./create-attribute.component.scss']
})
export class CreateAttributeComponent {

  @Output() AttributeC : EventEmitter<any> = new EventEmitter();

  name: string = '';
  type_attribute: number = 1;
  isLoading$: any;

  constructor (
    public attributeService: AttributesService,
    public modal: NgbActiveModal,
    public toastr: ToastrService,
  ) {

  }

  ngOnInit () : void {
    this.isLoading$ = this.attributeService.isLoading$;
  }

  store () {
    if (!this.name || !this.type_attribute) {
      this.toastr.error ('Validacion', 'Todos los campos son requeridos');
      return;
    }
    let data = {
      name: this.name,
      type_attribute: this.type_attribute,
      state: 1
    }
    this.attributeService.createAttributes(data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', 'El atributo ya existe');
        return;
      } else {
        this.AttributeC.emit(resp.attribute);
        this.toastr.success('Validacion', 'Atributo creado con exito');
        this.modal.close();
      }
    })
  }
}
