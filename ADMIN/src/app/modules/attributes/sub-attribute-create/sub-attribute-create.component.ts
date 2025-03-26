import { Component, Input } from '@angular/core';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { AttributesService } from '../service/attributes.service';
import { SubAttributeDeleteComponent } from '../sub-attribute-delete/sub-attribute-delete.component';

@Component({
  selector: 'app-sub-attribute-create',
  templateUrl: './sub-attribute-create.component.html',
  styleUrls: ['./sub-attribute-create.component.scss']
})
export class SubAttributeCreateComponent {

  // @Output() AttributeC : EventEmitter<any> = new EventEmitter();
  @Input () properties:any = [];
  @Input () attribute:any;

  name: string = '';
  isLoading$: any;
  color:any;
  type_action: number = 1;

  constructor (
    public attributeService: AttributesService,
    public modal: NgbActiveModal,
    public toastr: ToastrService,
    public modalService: NgbModal
  ) {

  }

  ngOnInit () : void {
    this.isLoading$ = this.attributeService.isLoading$;
    this.properties = this.attribute.properties;
  }

  store () {

    if (!this.name) {
      this.toastr.error ('Validacion', 'Todos los campos son requeridos');
      return;
    }
    if (this.type_action == 2 && !this.color) {
      this.toastr.error ('Validacion', 'Necesitas seleccionar un color');
    }

    let data = {
      name: this.name,
      code: this.color,
      state: 1,
      attribute_id: this.attribute.id
    }

    this.attributeService.createProperties(data).subscribe((resp:any) => {
      console.log(resp);
      if (resp.message == 403) {
        this.toastr.error('Validacion', 'La propiedad ya existe');
        return;
      } else {
        this.properties.unshift(resp.propertie);
        // this.AttributeC.emit(resp.attribute);
        this.toastr.success('Validacion', 'Propiedad creada con exito');
        // this.modal.close();
      }
    })
  }

  delete (propertie:any) {
    const modalRef = this.modalService.open(SubAttributeDeleteComponent, { centered: true, size: 'md' });
    modalRef.componentInstance.propertie = propertie;

    modalRef.componentInstance.PropertieD.subscribe((resp: any) => {
      let INDEX = this.properties.findIndex((item: any) => item.id == propertie.id);
      if (INDEX != -1) {
        this.properties.splice(INDEX, 1)
      }
    })
  }
}
