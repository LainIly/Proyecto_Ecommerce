import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CuponesService } from '../service/cupones.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-delete-cupone',
  templateUrl: './delete-cupone.component.html',
  styleUrls: ['./delete-cupone.component.scss']
})
export class DeleteCuponeComponent {

  @Input () cupone: any;
  @Output () CuponD: EventEmitter<any> = new EventEmitter();

  isLoading: any;

  constructor (
    public cuponeService: CuponesService,
    public toastr: ToastrService,
    public modal: NgbActiveModal
  ) {

  }
  
  ngOnInit(): void {
    this.isLoading = this.cuponeService.isLoading$;
  }

  delete () {
    this.cuponeService.deleteCupone(this.cupone.id).subscribe((resp:any) => {
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.CuponD.emit({message: 200});
        this.modal.close();
      }
    })
  }
}
