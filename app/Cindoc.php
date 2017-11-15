<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cindoc extends Model
{
    protected $table = 'cindoc';
    public function photo() {
        return $this->belongsTo(__NAMESPACE__ . '\Photo');
    }
}
