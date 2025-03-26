<?php

namespace App\Http\Controllers\Admin\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product\ProductVariation;
use App\Models\Product\Attribute;

class ProductVariationsAnidadoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $product_id =  $request->product_id;
        $product_variation_id =  $request->product_variation_id;

        $variations = ProductVariation::where('product_id', $product_id)->where('product_variation_id', $product_variation_id)->orderBy('id', 'desc')->get();

        return response ()-> json([
            'variations' => $variations->map(function($variation) {
                return [
                    'id' => $variation->id,
                    'product_id' => $variation->product_id,
                    'attribute_id' => $variation->attribute_id,
                    'attribute' => $variation->attribute ? [
                        'name' => $variation->attribute->name, 
                        'type_attribute' => $variation->attribute->type_attribute,
                    ]: NULL,
                    'propertie_id' => $variation->propertie_id,
                    'propertie' => $variation->propertie ? [
                        'name' => $variation->propertie->name,
                        'code' => $variation->propertie->code,
                    ]: NULL,
                    'value_add' => $variation->value_add,
                    'add_price' => $variation->add_price,
                    'stock' => $variation->stock,
                    'product_variation_id' => $variation->product_variation_id,
                ];
            })
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $product_variation_id = $request->product_variation_id;
        $variation_exits = ProductVariation::where('product_id', $request->product_id)->where('product_variation_id', $product_variation_id)->count();
        if ($variation_exits > 0) {
            $variation_attribute_exits = ProductVariation::where('product_id', $request->product_id)
                                                            ->where('product_variation_id', $product_variation_id)
                                                            ->where('attribute_id', $request->attribute_id)
                                                            ->count();
            if ($variation_attribute_exits == 0) {
                return response()->json([
                    'message' => 403, 'message_text' => 'No se puede agregar un atributo diferente del que ya hay en la lista.',
                ]);
            }
        }

        $is_valid_variation = null;

        if ($request->propertie_id) {
            $is_valid_variation = ProductVariation::where('product_id', $request->product_id)
                                                ->where('product_variation_id', $product_variation_id)
                                                ->where('attribute_id', $request->attribute_id)
                                                ->where('propertie_id', $request->propertie_id)
                                                ->first();
        } else {
            $is_valid_variation = ProductVariation::where('product_id', $request->product_id)
                                                ->where('product_variation_id', $product_variation_id)
                                                ->where('attribute_id', $request->attribute_id)
                                                ->where('value_add', $request->value_add)
                                                ->first();
            }
        if ($is_valid_variation) {
            return response()->json([
                'message' => 403,
                'message_text' => 'Ya existe una variación con esta propiedad',
            ]);
        }


        $product_var = ProductVariation::findOrFail($product_variation_id);
        $TOTAL_STOCK_VARIATION_CENTRAL = $product_var ? $product_var->stock : 0;

        $SUM_TOTAL_STOCK_ANIDADOS = ProductVariation::where('product_id', $request->product_id)
                                                    ->where('product_variation_id', $product_variation_id)
                                                    ->sum('stock');

        $SUM_TOTAL_STOCK_ANIDADOS = $SUM_TOTAL_STOCK_ANIDADOS + $request->stock;

        if ($SUM_TOTAL_STOCK_ANIDADOS > $TOTAL_STOCK_VARIATION_CENTRAL) {
            return response()->json([
                'message' => 403,
                'message_text' => 'La cantidad de stock de las variaciones anidadas no puede ser mayor al stock de la variación central',
            ]);
        }

        $product_variation = ProductVariation::create($request->all());

        return response() -> json ([
            'message' => 200,
            'variation' => [
                'id' => $product_variation->id,
                'product_id' => $product_variation->product_id,
                'attribute_id' => $product_variation->attribute_id,
                'attribute' => $product_variation->attribute ? [
                    'name' => $product_variation->attribute->name,
                    'type_attribute' => $product_variation->attribute->type_attribute,
                ]: NULL,
                'propertie_id' => $product_variation->propertie_id,
                'propertie' => $product_variation->propertie ? [
                    'name' => $product_variation->propertie->name,
                    'code' => $product_variation->propertie->code,
                ]: NULL,
                'value_add' => $product_variation->value_add,
                'add_price' => $product_variation->add_price,
                'stock' => $product_variation->stock,
                'product_variation_id' => $product_variation->product_variation_id,
            ]
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $product_variation_id = $request->product_variation_id;
        $variation_exits = ProductVariation::where('product_id', $request->product_id)->where('product_variation_id', $product_variation_id)->count();
        if ($variation_exits > 0) {
            $variation_attribute_exits = ProductVariation::where('product_id', $request->product_id)
                                                            ->where('product_variation_id', $product_variation_id)
                                                            ->where('attribute_id', $request->attribute_id)
                                                            ->count();
            if ($variation_attribute_exits == 0) {
                return response()->json([
                    'message' => 403, 'message_text' => 'No se puede agregar un atributo diferente del que ya hay en la lista.',
                ]);
            }
        }
        $is_valid_variation = null;

        if ($request->propertie_id) {
            $is_valid_variation = ProductVariation::where('product_id', $request->product_id)
                                                ->where('id', '<>', $id)
                                                ->where('product_variation_id', $product_variation_id)
                                                ->where('attribute_id', $request->attribute_id)
                                                ->where('propertie_id', $request->propertie_id)
                                                ->first();
        } else {
            $is_valid_variation = ProductVariation::where('product_id', $request->product_id)
                                                ->where('id', '<>', $id)
                                                ->where('product_variation_id', $product_variation_id)
                                                ->where('attribute_id', $request->attribute_id)
                                                ->where('value_add', $request->value_add)
                                                ->first();
            }
        if ($is_valid_variation) {
            return response()->json([
                'message' => 403,
                'message_text' => 'Ya existe una variación con esta propiedad',
            ]);
        }

        $product_var = ProductVariation::findOrFail($product_variation_id);
        $TOTAL_STOCK_VARIATION_CENTRAL = $product_var ? $product_var->stock : 0;

        $SUM_TOTAL_STOCK_ANIDADOS = ProductVariation::where('product_id', $request->product_id)
                                                    ->where('id', '<>', $id)
                                                    ->where('product_variation_id', $product_variation_id)
                                                    ->sum('stock');

        $SUM_TOTAL_STOCK_ANIDADOS = $SUM_TOTAL_STOCK_ANIDADOS + $request->stock;

        if ($SUM_TOTAL_STOCK_ANIDADOS > $TOTAL_STOCK_VARIATION_CENTRAL) {
            return response()->json([
                'message' => 403,
                'message_text' => 'La cantidad de stock de las variaciones anidadas no puede ser mayor al stock de la variación central',
            ]);
        }

        $product_variation = ProductVariation::findOrFail($id);
        $product_variation -> update($request -> all());

        return response() -> json ([
            'message' => 200,
            'variation' => [
                'id' => $product_variation->id,
                'product_id' => $product_variation->product_id,
                'attribute_id' => $product_variation->attribute_id,
                'attribute' => $product_variation->attribute ? [
                    'name' => $product_variation->attribute->name,
                    'type_attribute' => $product_variation->attribute->type_attribute,
                ]: NULL,
                'propertie_id' => $product_variation->propertie_id,
                'propertie' => $product_variation->propertie ? [
                    'name' => $product_variation->propertie->name,
                    'code' => $product_variation->propertie->code,
                ]: NULL,
                'value_add' => $product_variation->value_add,
                'add_price' => $product_variation->add_price,
                'stock' => $product_variation->stock,
                'product_variation_id' => $product_variation->product_variation_id,
            ]
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product_variation = ProductVariation::findOrFail($id);
        $product_variation -> delete();
        //VALIDACION PARA QUE NO SE PUEDA ELIMINAR UNA VARIACION QUE YA ESTE ASOCIADA A UNA ORDEN
        return response() -> json ([
            'message' => 200,
        ]);
    }
}
