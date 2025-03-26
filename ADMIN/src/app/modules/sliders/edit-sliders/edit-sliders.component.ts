import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { SlidersService } from '../service/sliders.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-sliders',
  templateUrl: './edit-sliders.component.html',
  styleUrls: ['./edit-sliders.component.scss']
})
export class EditSlidersComponent {
  
  title: string = '';
  label: string = '';
  subtitle: string = '';
  link: string = '';
  color: string = '';
  state: number = 1;
  slider_id: string = '';

  imagen_previsualiza: any = 'https://preview.keenthemes.com/metronic8/demo1/assets/media/svg/illustrations/easy/2.svg';
  file_imagen: any = null;

  isLoading$: any;

  constructor (
    public sliderService: SlidersService,
    public toastr: ToastrService,
    public activedRoute: ActivatedRoute,
  ) {

  }

  ngOnInit(): void {
    this.isLoading$ = this.sliderService.isLoading$;
    this.activedRoute.params.subscribe((resp:any) => {
      this.slider_id = resp.id;
    });
    this.sliderService.showSlider(this.slider_id).subscribe((resp:any) => {
      console.log(resp);
      this.title  = resp.slider.title;
      this.label = resp.slider.label;
      this.subtitle = resp.slider.subtitle;
      this.link = resp.slider.link;
      this.color = resp.slider.color;
      this.state = resp.slider.state;
      this.imagen_previsualiza = resp.slider.imagen;
    })
  }

  processFile($event:any) {

    if ($event.target.files[0].type.indexOf('image') < 0) {
      this.toastr.error('Validacion', 'El archivo seleccionado no es una imagen');
      return;
    }

    this.file_imagen = $event.target.files[0];
    let reader = new FileReader();
    reader.readAsDataURL(this.file_imagen);
    reader.onloadend = () => this.imagen_previsualiza = reader.result;
    this.isLoadingView();
  }

  isLoadingView () {
    this.sliderService.isLoadingSubject.next(true);
    setTimeout(() => { 
      this.sliderService.isLoadingSubject.next(false);
    }, 50);
  }

  save() {

    if (!this.title || !this.subtitle) {
      this.toastr.error('Validacion', 'Todos los campos con * son requeridos.');
      return;
    }

    let formData = new FormData();

    formData.append('title', this.title);

    if (this.label) {
      formData.append('label', this.label);
    }

    if (this.file_imagen) {
      formData.append('imagen', this.file_imagen);
    }

    if (this.link) {
      formData.append('link', this.link + '');
    }

    if (this.color) {
      formData.append('color', this.color + '');
    }

    formData.append('subtitle', this.subtitle + '');
    formData.append('image', this.file_imagen);

    this.sliderService.updateSliders(this.slider_id, formData).subscribe((resp:any) => { 
      console.log(resp)
      this.title = '';
      this.label = '';
      this.subtitle = '';
      this.link = '';
      this.color = '';
      this.file_imagen = null;
      this.imagen_previsualiza = 'https://preview.keenthemes.com/metronic8/demo1/assets/media/svg/illustrations/easy/2.svg';
      this.toastr.success('Slider editado con exito.');
    });
  }
}
