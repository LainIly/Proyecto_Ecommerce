<table style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
    <tr>
        <td colspan="7" style="font-size: 20px; font-weight: bold; text-align: center; padding: 10px; background-color: #f4f4f4; border: 1px solid #ddd;">
            Ventas realizadas
        </td>
    </tr>

    <thead>
        <tr style="background-color: #007bff; color: white;">
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">#</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Cliente</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Método de Pago</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Total</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">No. Transacción</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Fecha de Registro</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Región/Ciudad/País</th>
        </tr>
    </thead>

    <tbody>
        @foreach ($sales as $key => $sale)
            <tr style="background-color: {{ $key % 2 == 0 ? '#f9f9f9' : '#ffffff' }};">
                <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $key + 1 }}</td>
                <td style="border: 1px solid #ddd; padding: 8px; text-align: left;">{{ $sale->user->name.' '.$sale->user->surname }}</td>
                <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $sale->currency_total }}</td>
                <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $sale->total }} {{ $sale->currency_payment }}</td>
                <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $sale->n_transaccion }}</td>
                <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $sale->created_at->format("Y-m-d h:i:s") }}</th>
                <td style="border: 1px solid #ddd; padding: 8px; text-align: left;">
                    {{ $sale->sale_addres?->country_region." ".
                    $sale->sale_addres?->city." ".
                    $sale->sale_addres?->company ?? 'Sin información' }}
</td>
            </tr>
        @endforeach
    </tbody>
</table>