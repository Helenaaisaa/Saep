<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Agendamento extends Model
{
    protected $table = 'agendamentos';

    protected $fillable = [
        'data',
        'hora',
        'descricao',
        'cliente_id',
        'veiculo_id',
    ];

    public $timestamps = true;

    public function veiculo()
    {
        return $this->belongsTo(Veiculo::class);
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class);
    }
}