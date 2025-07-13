<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromView;
use Illuminate\Contracts\View\View;

class SaleExport implements FromView 
{

    protected $sales;

    public function __construct($sales) {
        $this->sales = $sales;
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function view(): View 
    {
        return view ('sales.sales_export', [
            'sales' => $this->sales,
        ]);
    }
}
