<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Date extends Model
{
    protected $table = 'date';

    public function photo() {
        return $this->belongsTo(__NAMESPACE__ . "\\Photo", "date_id");
    }
}
