import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { CategoriesService } from '../service/categories.service';
import { Input, Output, EventEmitter } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-delete-categorie',
  templateUrl: './delete-categorie.component.html',
  styleUrls: ['./delete-categorie.component.scss']
})
export class DeleteCategorieComponent {
  @Input () categorie: any;
  @Output () CategorieD: EventEmitter<any> = new EventEmitter();

  isLoading: any;

  constructor (
    public categorieService: CategoriesService,
    public toastr: ToastrService,
    public modal: NgbActiveModal
  ) {

  }
  
  ngOnInit(): void {
    this.isLoading = this.categorieService.isLoading$;
  }

  delete () {
    this.categorieService.deleteCategorie(this.categorie.id).subscribe((resp:any) => {
      if (resp.message == 403) {
        this.toastr.error('Validacion', resp.message_text);
      } else {
        this.CategorieD.emit({message: 200});
        this.modal.close();
      }
    })
  }
}
