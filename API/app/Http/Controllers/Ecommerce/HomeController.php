<?php

namespace App\Http\Controllers\Ecommerce;

use App\Models\Slider;
use App\Models\Product\Categorie;
use App\Models\Product\Product;
use App\Http\Controllers\Controller;
use App\Http\Resources\Ecommerce\Product\ProductEcommerceCollection;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home (Request $request) {
        $sliders_principal = Slider::where('state', 1)->where('type_slider', 1)->orderBy('id', 'desc')->get();

        $categories_randoms = Categorie::withCount(['product_categorie_firsts'])
                                        ->where('categorie_second_id', NULL)
                                        ->where('categorie_third_id', NULL)
                                        ->inRandomOrder()->limit(5)->get();

        $product_tranding_new = Product::where('state', 2)->inRandomOrder()->limit(8)->get();
        $product_tranding_featured = Product::where('state', 2)->inRandomOrder()->limit(8)->get();
        $product_tranding_top_sellers = Product::where('state', 2)->inRandomOrder()->limit(8)->get();

        $sliders_secundario = Slider::where('state', 1)->where('type_slider', 2)->orderBy('id', 'asc')->get();

        $product_eletronics = Product::where('state', 2)->where('categorie_third_id', 57)->inRandomOrder()->limit(6)->get();

        $products_carusel = Product::where('state', 2)->whereIn('categorie_first_id', $categories_randoms->pluck('id'))->inRandomOrder()->get();

        return response ()->json([
            'sliders_principal' => $sliders_principal->map(function ($slider) {
                return [
                    'id' => $slider->id,
                    'title' => $slider->title,
                    'subtitle' => $slider->subtitle,
                    'label' => $slider->label,
                    'imagen' => $slider->imagen ? env('APP_URL').'storage/'.$slider->imagen : NULL,
                    'link' => $slider->link,
                    'state' => $slider->state,
                    'color' => $slider->color,
                    'type_slider' => $slider->type_slider,
                    'price_original' => $slider->price_original,
                    'price_campaing' => $slider->price_campaing,
                ];
            }),
            'categories_randoms' => $categories_randoms->map(function ($categorie) {
                return [
                    'id' => $categorie->id,
                    'name' => $categorie->name,
                    'products_count' => $categorie->product_categorie_firsts_count,
                    'imagen' => env('APP_URL').'storage/'.$categorie->imagen,
                ];
            }),
            'product_tranding_new' => ProductEcommerceCollection::make($product_tranding_new),
            'product_tranding_featured' => ProductEcommerceCollection::make($product_tranding_featured),
            'product_tranding_top_sellers' => ProductEcommerceCollection::make($product_tranding_top_sellers),
            'sliders_secundario' => $sliders_secundario->map(function ($slider) {
                return [
                    'id' => $slider->id,
                    'title' => $slider->title,
                    'subtitle' => $slider->subtitle,
                    'label' => $slider->label,
                    'imagen' => $slider->imagen ? env('APP_URL').'storage/'.$slider->imagen : NULL,
                    'link' => $slider->link,
                    'state' => $slider->state,
                    'color' => $slider->color,
                    'type_slider' => $slider->type_slider,
                    'price_original' => $slider->price_original,
                    'price_campaing' => $slider->price_campaing,
                ];
            }),
            'product_eletronics' => ProductEcommerceCollection::make($product_eletronics),
            'products_carusel' => ProductEcommerceCollection::make($products_carusel),
        ]);
    }

    public function menus () {
        $categories_menus = Categorie::where('categorie_second_id', NULL)
                                        ->where('categorie_third_id', NULL)
                                        ->orderBy('position', 'desc')
                                        ->get();

        return response ()->json([
            'categories_menus' => $categories_menus->map(function($departament) {
                return [
                    'id' => $departament->id,
                    'name' => $departament->name,
                    'icon' => $departament->icon,
                    'categories' => $departament->categorie_seconds->map(function($categorie) {
                       return [
                            'id' => $categorie->id,
                            'name' => $categorie->name,
                            'imagen' => $categorie->imagen ? env('APP_URL').'storage/'.$categorie->imagen : NULL,
                            'subcategories' => $categorie->categorie_seconds->map(function($subcategorie) {
                                return [
                                    'id' => $subcategorie->id,
                                    'name' => $subcategorie->name,
                                    'imagen' => $subcategorie->imagen ? env('APP_URL').'storage/'.$subcategorie->imagen : NULL,
                                ];
                            })
                       ]; 
                    })
                ];
            }),
        ]);
    }
}