import { afterNextRender, Component } from '@angular/core';
import { HomeService } from './service/home.service';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

declare function SLIDER_PRINCIPAL ([]): any;
declare function DATA_VALUES ([]):any;
declare function PRODUCTS_CAROUSEL_HOME ([]):any;
declare var $: any;

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [FormsModule, RouterModule, CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {

  SLIDERS: any = [];
  CATEGORIES_RANDOMS: any = [];
  TRADING_PRODUCT_NEW: any = [];
  TRADING_PRODUCT_FEATURE: any = [];
  TRADING_PRODUCT_TOP_SELLER: any = [];
  PRODUCTS_ELECTRONICS: any = [];
  PRODUCTS_CAROUSEL: any = [];

  BANNERS_SECUNDARIOS: any = [];


  constructor(
      public homeService: HomeService,
  ) {
    afterNextRender (() => {
      this.homeService.home().subscribe((resp:any) => {
        console.log(resp);
        this.SLIDERS = resp.sliders_principal;
        this.BANNERS_SECUNDARIOS = resp.sliders_secundario;

        this.CATEGORIES_RANDOMS = resp.categories_randoms;
        
        this.TRADING_PRODUCT_NEW = resp.product_tranding_new.data;
        this.TRADING_PRODUCT_FEATURE = resp.product_tranding_featured.data;
        this.TRADING_PRODUCT_TOP_SELLER = resp.product_tranding_top_sellers.data;
        this.PRODUCTS_ELECTRONICS = resp.product_eletronics.data;
        this.PRODUCTS_CAROUSEL = resp.products_carusel.data;
        
        setTimeout(() => {
          SLIDER_PRINCIPAL ($);
          DATA_VALUES ($);
          PRODUCTS_CAROUSEL_HOME ($);
        }, 50)
      })
    })
  }

  ngOnInit(): void {
    
  }

  getLabelSlider(SLIDER:any) {
    var miDiv:any = document.getElementById('label-'+SLIDER.id);
    miDiv.innerHTML = SLIDER.label;
    return '';
  }

  getSubtitleSlider(SLIDER:any) {
    var miDiv:any = document.getElementById('subtitle-'+SLIDER.id);
    miDiv.innerHTML = SLIDER.subtitle;
    return '';
  }

  getTitleBannerSecundario(BANNER:any,ID_BANNER:string) {
    var miDiv:any = document.getElementById(ID_BANNER);
    miDiv.innerHTML = BANNER.title;
    return '';
  }
}
