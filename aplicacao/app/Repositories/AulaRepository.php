<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

namespace App\Repositories;

use App\Models\Aula;
use Illuminate\Support\Facades\DB;

class AulaRepository
{

	/**
	 * Criar uma nova instância de AulaRepository.
	 * @param Aula $aula
	 */
	public function __construct(Aula $aula)
	{
		$this->model = $aula;
	}


	/**
	 * Recuperar uma Coleção paginada de Aula
	 * @param int $registros
	 * @param array $parametros
	 * @param array $ordenacao
	 * @return Illuminate\Database\Eloquent\Collection
	 */

	public function index($registros, $parametros = [], $ordenacao = [])
	{
		if (!isset($ordenacao['sort']))
			$ordenacao['sort'] = 'data_aula';

		if (!isset($ordenacao['order']))
			$ordenacao['order'] = 'ASC';

		$query = $this->model
			->select('aulas.*',
				'mdl_course.fullname as curso',
				\DB::raw('CONCAT(mdl_user.firstname," ", mdl_user.lastname) as professor'),
				'mdl_role.name as turma'
			)
			->join('mdl_course', 'mdl_course.id', '=', 'aulas.course_id')
			->join('mdl_user', 'mdl_user.id', '=', 'aulas.user_id')
			->join('mdl_role', 'mdl_role.id', '=', 'aulas.role_id')
			->orderBy($ordenacao['sort'], $ordenacao['order'])
			->orderBy('mdl_course.sortorder', 'ASC');

		if (isset($parametros['id'])) {
			$id = (int)$parametros['id'];

			if ($id > 0) {
				$query = $query->where(function ($q2) use ($id) {
					$q2->whereRaw('id = ?', array($id));
				});
			}
		}

		if (isset($parametros['role_id'])) {
			$role_id = (int)$parametros['role_id'];

			if ($role_id > 0) {
				$query = $query->where(function ($q2) use ($role_id) {
					$q2->whereRaw('role_id = ?', array($role_id));
				});
			}
		}

		if (isset($parametros['course_id'])) {
			$course_id = (int)$parametros['course_id'];

			if ($course_id > 0) {
				$query = $query->where(function ($q2) use ($course_id) {
					$q2->whereRaw('course_id = ?', array($course_id));
				});
			}
		}

		if (isset($parametros['user_id'])) {
			$user_id = (int)$parametros['user_id'];

			if ($user_id > 0) {
				$query = $query->where(function ($q2) use ($user_id) {
					$q2->whereRaw('user_id = ?', array($user_id));
				});
			}
		}
		if (isset($parametros['data_aula'])) {
			$data_aula = (strlen($parametros['data_aula']) == 10) ? $parametros['data_aula'] : '0000-00-00';

			if (strlen($data_aula) == 10) {
				$array = preg_split('/[\/,]+/', $data_aula);
				if (count($array) == 3) {
					$data_aula = $array[2] . '-' . $array[1] . '-' . $array[0];
				}
			}

			$query = $query->where(function ($q2) use ($data_aula) {
				$q2->where('data_aula', $data_aula);
			});
		}


		return $query->paginate($registros);
	}

	/**
	 * Recuperar um ítem do Model Aula
	 * @param  int $id
	 * @return Aula $aula
	 */
	public function find($id)
	{
		return $item = $this->model->findOrFail($id);
	}

	/**
	 * Criar Aula
	 * @param array $dados
	 * @return Aula $aula
	 * @throws \Exception
	 */
	public function store(array $dados)
	{
		$aula = new $this->model;
		return $this->saveAula($aula, $dados);
	}

	/**
	 * Atualizar Aula.
	 *
	 * @param array $dados
	 * @param  int $id
	 * @return Aula $aula
	 * @throws \Exception
	 */
	public function update(array $dados, $id)
	{
		$aula = $this->model->findOrFail($id);
		return $this->saveAula($aula, $dados);
	}

	/**
	 * Salvar Aula.
	 * @param Aula $aula
	 * @param array $dados
	 * @return Aula
	 * @throws \Exception
	 */
	private function saveAula(Aula $aula, array $dados)
	{
		\DB::beginTransaction();
		try {
			if (isset($dados['role_id']))
				$aula->role_id = trim($dados['role_id']);
			if (isset($dados['user_id']))
				$aula->user_id = trim($dados['user_id']);
			if (isset($dados['course_id']))
				$aula->course_id = trim($dados['course_id']);
			if (isset($dados['data_aula']))
				$aula->data_aula = trim($dados['data_aula']);

			$aula->save();

		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return $aula;
	}


	/**
	 * Verifica se o model tem dependência de algum outro model
	 * @param Aula $aula
	 * @return bool
	 */

	public function aulaTemRegistros(Aula $aula)
	{
		return $aula->Frequencias()->get();
	}

	/**
	 * Excluir um registro.
	 * @param Aula $aula
	 * @return bool
	 * @throws \Exception
	 */
	public function destroy(Aula $aula)
	{
		\DB::beginTransaction();
		try {
			$aula->delete();
		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return true;
	}

	/**
	 * Recuperar um array de Aula para o listBox
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function listBox()
	{
		return $this->model->select('id', 'id')->orderBy('id', 'asc')->get();
	}

	## REMOVER SE NÃO USAR ##
	/**
	 * Remover uma imagem do banco de dados
	 * @param Aula $aula
	 * @param int $campoRemover
	 * @return bool
	 */
	public function imageDestroy(Aula $aula, $campoRemover)
	{
		$aula->$campoRemover = NULL;
		$aula->save();
		return true;
	}

	public function listBoxTurmas()
	{
		$idsTurmasConfiguracaoGeral = DB::table('configuracoes')
			->select('valor')
			->where('chave', '=', 'roles_de_turmas')
			->get();

		$condicao = ' id in (' . $idsTurmasConfiguracaoGeral[0]->valor . ')';

		$dados = DB::table('mdl_role')
			->select('id', 'name')
			->whereRaw($condicao)
			->orderBy('name', 'asc')
			->get();
		return $dados;
	}

	public function listBoxProfessor()
	{
		$idsProfessoresConfiguracaoGeral = DB::table('configuracoes')
			->select('valor')
			->where('chave', '=', 'codigo_dos_professores')
			->get();

		$condicao = ' id in (' . $idsProfessoresConfiguracaoGeral[0]->valor . ')';
		return DB::table('mdl_user')->select('id', 'firstname', 'lastname')->whereRaw($condicao)->orderBy('firstname', 'asc')->get();
	}

	public function listBoxCurso()
	{
		$idsCursoConfiguracaoGeral = DB::table('configuracoes')->select('valor')->where('chave', '=', 'codigo_dos_cursos')->get();
		$condicao = ' id in (' . $idsCursoConfiguracaoGeral[0]->valor . ')';
		return DB::table('mdl_course')->select('id', 'fullname')->whereRaw($condicao)->orderBy('fullname', 'asc')->get();
	}
}