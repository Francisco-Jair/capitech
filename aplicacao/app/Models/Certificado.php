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
use Illuminate\Database\Eloquent\SoftDeletes;

class Certificado extends Model
{
	use TimestampsPresenter;
	use SoftDeletes;

	/**
	 * Tabela usada pelo Model.
	 *
	 * @var string
	 */
	protected $table = 'certificados';

	/**
	 * Os atributos que são permitidos na inserção em massa.
	 *
	 * @var array
	 */
	protected $fillable = ['id', 'user_id', 'certificado_tipo', 'versao', 'codigo'];

	/**
	 * Os atributos excluídos da inserção em massa.
	 *
	 * @var array
	 */
	protected $hidden = [];
}
