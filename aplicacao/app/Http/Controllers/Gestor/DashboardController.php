<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 01-11-2015
 * Time: 00:05:20
 */

namespace App\Http\Controllers\Gestor;

use App\Http\Controllers\Controller;
use App\Models\Frequencia;
use App\Models\Matricula;

class DashboardController extends Controller
{
	/**
	 * Criar uma nova nova instância de MenuController
	 *
	 * @param \App\Services\ProcessoService
	 */
	public function __construct()
	{
	}

	public function dashboard()
	{
		$ultimos_alunos_cadastrados = Matricula::where('archetype', '=', 'student')
			->take(10)
			->groupBy('user_id')
			->orderBy('created_at')->get();

		$professores = Matricula::where('archetype', '=', 'editingteacher')
			->take(7)
			->groupBy('user_id')
			->orderBy('course')->get();

		$faltas = Frequencia::where('presente_m', '=', 'N')
			->whereOr('presente_t', '=', 'N')
			->groupBy('user_id')
			->take(10)
			->orderBy('created_at')->get();

		return view('gestor.dashboard.index', compact('ultimos_alunos_cadastrados', 'professores', 'faltas'));
	}

} 