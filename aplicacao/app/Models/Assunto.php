<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 16-11-2015
 * Time: 02:39:06
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\TimestampsPresenter;
use Illuminate\Database\Eloquent\SoftDeletes;

class Assunto extends Model
{
    use TimestampsPresenter;
    use SoftDeletes;

    /**
     * Tabela usada pelo Model.
     *
     * @var string
     */
    protected $table = 'assuntos';

    /**
     * Os atributos que são permitidos na inserção em massa.
     *
     * @var array
     */
    protected $fillable = ['id', 'assunto', 'emails'];

    /**
     * Os atributos excluídos da inserção em massa.
     *
     * @var array
     */
    protected $hidden = [];


    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at'];
}