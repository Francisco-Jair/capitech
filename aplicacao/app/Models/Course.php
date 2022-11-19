<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{

    protected $visible = ["shortname", "id", "fullname"];

    protected $table = "mdl_course";

    public function turmas() {
        $configuracao = Configuracao::where('chave','roles_de_turmas')->first()->valor;
        return Role::all();
    }

    public function aulas()
    {
        return $this->hasMany('\App\Models\Aula', 'course_id');
    }

    public function matriculas()
    {
        return $this->hasMany('\App\Models\Matricula', 'course_id');
    }
}
