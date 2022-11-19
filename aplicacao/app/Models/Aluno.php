<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\TimestampsPresenter;

class Aluno extends Model
{
	use TimestampsPresenter;

	/**
	 * Tabela usada pelo Model.
	 *
	 * @var string
	 */
	protected $table = 'alunos';

	/**
	 * Os atributos que são permitidos na inserção em massa.
	 *
	 * @var array
	 */
	protected $fillable = ['id', 'username', 'password', 'firstname', 'lastname', 'email'];

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


	# Relações desse model
	public function a()
	{
		return $this->hasOne('App\Models\X', 'foreign_key');
	}

	public function b()
	{
		return $this->belongsTo('App\Models\X', 'foreign_key');
	}

	public function c()
	{
		return $this->hasMany('App\Models\X', 'foreign_key');
	}

	public function d()
	{
		return $this->belongsToMany('App\Role');
	}
}
