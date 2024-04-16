<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = ['item_id', 'quantity'];

    // Relationship back to the item
    public function item()
    {
        return $this->belongsTo(Item::class);
    }

    // Additional business logic for transactions can go here
}