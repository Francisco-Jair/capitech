<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:37
 */

namespace App\Repositories;

use App\Models\RendimentoAluno;
use App\Models\Role;

class RendimentoAlunoRepository
{

	/**
	 * Criar uma nova instância de RendimentoAlunoRepository.
	 * @param RendimentoAluno $rendimentoaluno
	 */
	public function __construct(RendimentoAluno $rendimentoaluno)
	{
		$this->model = $rendimentoaluno;
	}


	/**
	 * Recuperar uma Coleção paginada de RendimentoAluno
	 * @param int $registros
	 * @param array $parametros
	 * @param array $ordenacao
	 * @return Illuminate\Database\Eloquent\Collection
	 */

	public function index($registros, $parametros = [], $ordenacao = [])
	{
		if (!isset($ordenacao['sort']))
			$ordenacao['sort'] = 'id';

		if (!isset($ordenacao['order']))
			$ordenacao['order'] = 'DESC';

		$query = $this->model->orderBy($ordenacao['sort'], $ordenacao['order']);

		if (isset($parametros['id'])) {
			$id = (int)$parametros['id'];

			if ($id > 0) {
				$query = $query->where(function ($q2) use ($id) {
					$q2->whereRaw('id = ?', array($id));
				});
			}

		}

		if (isset($parametros['rendimentoaluno'])) {
			$rendimentoaluno = strtolower($parametros['rendimentoaluno']);

			$query = $query->where(function ($q2) use ($rendimentoaluno) {
				$q2->whereRaw('LOWER(rendimentoaluno) LIKE ?', array("%{$rendimentoaluno}%"));
			});
		}

		/*if (isset($parametros['termo'])) {
			$termo = strtolower(trim($parametros['termo']));

			$query = $query->where(function ($q2) use ($termo) {
				$q2->whereRaw('
					(LOWER(xxx) LIKE ? or LOWER(yyy) LIKE ? or LOWER(zzz) LIKE ?)',
					["%{$termo}%", "%{$termo}%", "%{$termo}%"]
				);
			});
		}*/


		$query = Role::select('id', 'name')->whereIn('id', [9, 10, 16, 17, 18, 19, 20]);

		return $query->paginate($registros);
	}

	/**
	 * Recuperar um ítem do Model RendimentoAluno
	 * @param  int $id
	 * @return RendimentoAluno $rendimentoaluno
	 */
	public function find($id)
	{
		return $item = $this->model->findOrFail($id);
	}

	/**
	 * Criar RendimentoAluno
	 * @param array $dados
	 * @return RendimentoAluno $rendimentoaluno
	 * @throws \Exception
	 */
	public function store(array $dados)
	{
		$rendimentoaluno = new $this->model;
		return $this->saveRendimentoAluno($rendimentoaluno, $dados);
	}

	/**
	 * Atualizar RendimentoAluno.
	 *
	 * @param array $dados
	 * @param  int $id
	 * @return RendimentoAluno $rendimentoaluno
	 * @throws \Exception
	 */
	public function update(array $dados, $id)
	{
		$rendimentoaluno = $this->model->findOrFail($id);
		return $this->saveRendimentoAluno($rendimentoaluno, $dados);
	}

	/**
	 * Salvar RendimentoAluno.
	 * @param RendimentoAluno $rendimentoaluno
	 * @param array $dados
	 * @return RendimentoAluno
	 * @throws \Exception
	 */
	private function saveRendimentoAluno(RendimentoAluno $rendimentoaluno, array $dados)
	{

		\DB::beginTransaction();

		try {

			foreach ($dados['rendimento'] as $aluno_id => $nota) {

				RendimentoAluno::where('user_id', '=', $aluno_id)
					->where('course_id', '=', $dados['course_id'])
					->where('role_id', '=', $dados['role_id'])->delete();

				if ($nota != '' && $nota >= 0) {
					$rendimento = new RendimentoAluno();
					$rendimento->user_id = $aluno_id;
					$rendimento->course_id = $dados['course_id'];
					$rendimento->role_id = $dados['role_id'];
					$rendimento->rendimento = $nota;
					$rendimento->save();
				}

			}


		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return $rendimentoaluno;
	}


	/**
	 * Verifica se o model tem dependência de algum outro model
	 * @param RendimentoAluno $rendimentoaluno
	 * @return bool
	 */

	public function rendimentoalunoTemRegistros(RendimentoAluno $rendimentoaluno)
	{
		// Esse return é apenas para bloquear a exclusão.
		return $rendimentoaluno->get();

		//Se esse model possuir outro model relacionado:
		//return $rendimentoaluno->metodoHasMany();

		//Se esse model não possuir outro model relacionado:
		return $rendimentoaluno->where('id', 0);
	}

	/**
	 * Excluir um registro.
	 * @param RendimentoAluno $rendimentoaluno
	 * @return bool
	 * @throws \Exception
	 */
	public function destroy(RendimentoAluno $rendimentoaluno)
	{
		\DB::beginTransaction();
		try {
			$rendimentoaluno->delete();
		} catch (\Exception $e) {
			\DB::rollback();
			throw new \Exception($e);
		}
		\DB::commit();

		return true;
	}

	/**
	 * Recuperar um array de RendimentoAluno para o listBox
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function listBox()
	{
		return $this->model->select('id', 'id')->orderBy('id', 'asc')->get();
	}

	public function frequenciasPorAluno($course_id, $role_id)
	{
		return $this->model->select('user_id', 'rendimento')
			->where('course_id', '=', $course_id)
			->where('role_id', '=', $role_id)
			->orderBy('id', 'asc')->get();
	}




	## REMOVER SE NÃO USAR ##
	/**
	 * Remover uma imagem do banco de dados
	 * @param RendimentoAluno $rendimentoaluno
	 * @param int $campoRemover
	 * @return bool
	 */
	public function imageDestroy(RendimentoAluno $rendimentoaluno, $campoRemover)
	{
		$rendimentoaluno->$campoRemover = NULL;
		$rendimentoaluno->save();
		return true;
	}
}