<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Matricula extends Model
{
    protected $table = 'matriculas';

    public function course()
    {
        return $this->belongsTo('App\Models\Course', 'course_id');
    }
}