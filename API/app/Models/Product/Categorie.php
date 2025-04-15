<?php

namespace App\Models\Product;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Categorie extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'icon',
        'imagen',
        'categorie_second_id',
        'categorie_third_id',
        'position',
        'type_categorie',
        'state'
    ];

    public function setCreateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['created_at'] = Carbon::now();
    }

    public function setUpdateAtAttribute ($value) {
        date_default_timezone_set('America/Bogota');
        $this->attributes['updated_at'] = Carbon::now();
    }

    public function categorie_second () {
        return $this->belongsTo(Categorie::class, 'categorie_second_id');
    }

    public function categorie_third () {
        return $this->belongsTo(Categorie::class, 'categorie_third_id');
    }

    public function categorie_seconds () {
        return $this->hasMany(Categorie::class, 'categorie_second_id');
    }
    
    public function product_categorie_firsts () {
        return $this->hasMany(Product::class, 'categorie_first_id');
    }

    public function product_categorie_seconds () {
        return $this->hasMany(Product::class, 'categorie_second_id');
    }

    public function product_categorie_thirds () {
        return $this->hasMany(Product::class, 'categorie_third_id');
    }
}
