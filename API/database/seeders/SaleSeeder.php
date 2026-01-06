<?php

namespace Database\Seeders;

use App\Models\Sale\Sale;
use Illuminate\Support\Str;
use App\Models\Cupone\Cupone;
use App\Models\Product\Product;
use App\Models\Sale\SaleAddres;
use App\Models\Sale\SaleDetail;
use Illuminate\Database\Seeder;
use App\Models\Discount\Discount;

class SaleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Sale::factory()
            ->count(1000)
            ->create([
                'created_at' => function () {
                    return \Faker\Factory::create()->dateTimeBetween(
                        '2026-01-01 00:00:00',
                        '2026-12-31 23:59:59'
                    );
                },
                'updated_at' => function (array $attributes) {
                    return $attributes['created_at'];
                },
            ])
            ->each(function ($p) {

                $faker = \Faker\Factory::create();

                SaleAddres::create([
                    "sale_id" => $p->id,
                    "name" => $faker->name(),
                    "surname" => $faker->lastName(),
                    "company" => $faker->word(),
                    "country_region" => $faker->randomElement([
                        'Perú','Argentina','Bolivia','Brasil','Chile',
                        'Costa Rica','Cuba','Ecuador','El Salvador',
                        'Uruguay','Venezuela','México'
                    ]),
                    "address" => $faker->word(),
                    "street" => $faker->word(),
                    "city" => $faker->word(),
                    "postcode_zip" => Str::random(4),
                    "phone" => $faker->phoneNumber(),
                    "email" => $faker->unique()->safeEmail(),
                    "created_at" => $p->created_at,
                    "updated_at" => $p->updated_at,
                ]);

                $num_items = $faker->randomElement([1, 2, 3, 4, 5]);
                $sum_total_sale = 0;

                for ($i = 0; $i < $num_items; $i++) {

                    $quantity = $faker->numberBetween(1, 10);
                    $product = Product::inRandomOrder()->first();

                    $is_cupon_discount = $faker->randomElement([1, 2, 3]);
                    $discount_cupone = $this->getDiscountCupone($is_cupon_discount);

                    $subtotal = $this->getTotalProduct(
                        $discount_cupone,
                        $product,
                        $p->currency_total
                    );

                    $sale_detail = SaleDetail::create([
                        "sale_id" => $p->id,
                        "product_id" => $product->id,
                        "type_discount" => $discount_cupone?->type_discount,
                        "discount" => $discount_cupone?->discount,
                        "type_campaing" => $is_cupon_discount == 2 ? $discount_cupone?->type_campaing : null,
                        "code_cupon" => $is_cupon_discount == 1 ? $discount_cupone?->code : null,
                        "code_discount" => $is_cupon_discount == 2 ? $discount_cupone?->code : null,
                        "product_variation_id" => null,
                        "quantity" => $quantity,
                        "price_unit" => $p->currency_total === 'COP'
                            ? $product->price_cop
                            : $product->price_usd,
                        "subtotal" => $subtotal,
                        "total" => $subtotal * $quantity,
                        "currency" => $p->currency_total,
                        "created_at" => $p->created_at,
                        "updated_at" => $p->updated_at,
                    ]);

                    $sum_total_sale += $sale_detail->total;
                }

                // Ajuste por diferencia de moneda
                if ($p->currency_total !== $p->currency_payment) {
                    $sum_total_sale = round($sum_total_sale / 3800, 2);
                }

                $p->update([
                    "subtotal" => $sum_total_sale,
                    "total" => $sum_total_sale,
                ]);
            });

        // php artisan db:seed --class=SaleSeeder
    }

    public function getDiscountCupone($is_cupon_discount)
    {
        if ($is_cupon_discount != 3) {
            return $is_cupon_discount == 1
                ? Cupone::inRandomOrder()->first()
                : Discount::inRandomOrder()->first();
        }

        return null;
    }

    public function getTotalProduct($discount_cupone, $product, $currency)
    {
        $price = $currency === "COP"
            ? $product->price_cop
            : $product->price_usd;

        if ($discount_cupone) {
            if ($discount_cupone->type_discount == 1) {
                return $price - ($discount_cupone->discount * 0.01 * $price);
            }

            return $price - $discount_cupone->discount;
        }

        return $price;
    }
}
