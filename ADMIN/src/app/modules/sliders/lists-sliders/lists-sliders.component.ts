import { Component } from '@angular/core';
import { SlidersService } from '../service/sliders.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DeleteSlidersComponent } from '../delete-sliders/delete-sliders.component';

@Component({
  selector: 'app-lists-sliders',
  templateUrl: './lists-sliders.component.html',
  styleUrls: ['./lists-sliders.component.scss']
})
export class ListsSlidersComponent {

  sliders: any = [];
  search: string = '';
  totalPages: number = 0;
  currentPage: number = 1; 

  isLoading$:any;

  constructor(
    private sliderService: SlidersService,
    private modalService: NgbModal,
  ) { 

  }

  ngOnInit(): void{
    this.listSliders();
    this.isLoading$ = this.sliderService.isLoading$;
  } 

  listSliders(page = 1) {
    this.sliderService.listSliders(page, this.search).subscribe((resp:any) => {
      console.log(resp);
      this.sliders = resp.sliders;
      this.totalPages = resp.total;
      this.currentPage = page;
    })
  }

  searchTo() {
    this.listSliders();
  }

  loadPage($event:any) {
    console.log ($event);
    this.listSliders($event);
  }

  deleteSlider(slider:any) {
    const modalRef = this.modalService.open(DeleteSlidersComponent, {centered: true, size: 'md'});
    modalRef.componentInstance.slider = slider;

    modalRef.componentInstance.SliderD.subscribe((resp:any) => {
      let INDEX = this.sliders.findIndex((item:any) => item.id == slider.id);
      if (INDEX != -1) {
        this.sliders.splice(INDEX, 1)
      }
    })
  }
}
