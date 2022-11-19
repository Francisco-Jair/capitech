<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'mdl_role';

    public function aulas()
    {
        return $this->hasMany('\App\Models\Aula', 'role_id');
    }
}
