<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class API3Users extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $fillable=['name','username','password','balance'];
    protected $hidden=['password'];
}
