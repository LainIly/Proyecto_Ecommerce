<?php

namespace App\Http\Controllers\Ecommerce;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Sale\Cart;
use App\Models\Sale\Sale;
use App\Models\Sale\SaleAddres;
use App\Models\Sale\SaleDetail;
use App\Mail\SaleMail;
use Illuminate\Support\Facades\Mail;
use App\Http\Resources\Ecommerce\Sale\SaleResource;
use MercadoPago\SDK;
use MercadoPago\PreferenceClient;
use MercadoPago\Configuration\MercadoPagoConfig;

class SaleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }
 
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->request->add(['user_id' => auth('api')->user()->id]);
        $sale = Sale::create($request->all());

        $carts = Cart::where('user_id', auth('api')->user()->id)->get();

        foreach ($carts as $key => $cart) {
            
            $new_detail = [];
            $new_detail = $cart->toArray();
            $new_detail['sale_id'] = $sale->id;
            SaleDetail::create($new_detail);
        }
        $sale_addres = $request->sale_address;
        $sale_addres ['sale_id'] = $sale->id;
        $sale_address = SaleAddres::create($sale_addres);

        $sale_new = Sale::findOrFail($sale->id);
        Mail::to(auth('api')->user()->email)->send(new SaleMail(auth('api')->user(), $sale_new));

        return response ()->json([
            'message' => 200,
        ]);
    }

    public function mercadopago (Request $request) {

        MercadoPagoConfig::setAccessToken(env('MERCADOPAGO_KEY'));

        $client = new PreferenceClient();
        $client->auto_return = "approved";

        $carts = Cart::where('user_id', auth('api')->user()->id)->get();

        $array_carts = [];

        foreach ($carts as $key => $cart) {
            array_push($array_carts, [
                "title" => $cart->product->title,
                "quantity" => $cart->quantity,
                "currency_id" => $cart->currency,
                "unit_price" => $cart->total,
            ]);
        }

        $datos = array(
            "items"=> $array_carts,
            "back_urls" =>array(
                "success" => env('URL_TIENDA').'mercado-pago-success',
                "failure" => env('URL_TIENDA').'mercado-pago-failure',
                "pending" => env('URL_TIENDA').'mercado-pago-pending'
            ),
            "redirect_urls" =>array(
                "success" => env('URL_TIENDA').'mercado-pago-success',
                "failure" => env('URL_TIENDA').'mercado-pago-failure',
                "pending" => env('URL_TIENDA').'mercado-pago-pending'
            ),
            "auto_return" => "approved",
            "external_reference" => uniqid(),
        );
            $preference = $client->create($datos);
            return response ()->json([
                'preference' => $preference,
            ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $sale = Sale::where('n_transaccion', $id)->first();

        return response ()->json([
            'sale' => SaleResource::make($sale),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
