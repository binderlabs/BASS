<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $fillable = ['name', 'stock', 'price'];

    // If you have transactions that relate items to purchases
    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }
    
    // You can add more business logic here related to items
}