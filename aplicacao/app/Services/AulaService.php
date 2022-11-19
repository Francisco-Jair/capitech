<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

namespace App\Services;

use Illuminate\Http\Request;
use App\Http\Requests\AulaRequest;
use App\Repositories\AulaRepository;

class AulaService
{
	/**
	 * Instância de AulaRepository
	 * @var AulaRepository
	 */
	protected $aulaRepository;

	/**
	 * Criar uma nova nova instância de AulaService
	 * @param AulaRepository $aulaRepository
	 */
	public function __construct(AulaRepository $aulaRepository)
	{
		$this->aulaRepository = $aulaRepository;
	}

	/**
	 * Exibir uma lista de registros
	 * @param Request $request
	 * @param array $ordenacao
	 * @return array
	 */
	public function index(Request $request, $ordenacao)
	{
		$parametros = [];
		if ($request->query('id'))
			$parametros['id'] = (int)$request->get('id');

		if ($request->query('termo'))
			$parametros['termo'] = trim($request->get('termo'));

		if ($request->query('sort'))
			$parametros['sort'] = $request->get('sort');

		if ($request->query('role_id'))
			$parametros['role_id'] = trim($request->get('role_id'));

		if ($request->query('data_aula'))
			$parametros['data_aula'] = trim($request->get('data_aula'));

		if ($request->query('course_id'))
			$parametros['course_id'] = trim($request->get('course_id'));

		if ($request->query('user_id'))
			$parametros['user_id'] = trim($request->get('user_id'));

		return $this->aulaRepository->index(20, $parametros, $ordenacao);
	}

	/**
	 * Retornar um registro
	 * @param int $id
	 * @return \App\Models\Aula
	 */
	public function find($id)
	{
		return $this->aulaRepository->find($id);
	}

	/**
	 * Armazenar o novo registro no repositório de dados.
	 * @param AulaRequest $aulaRequest
	 * @return \App\Models\Aula
	 */
	public function store(AulaRequest $aulaRequest)
	{
		$dados = $aulaRequest->all();

		return $this->aulaRepository->store($dados);
	}

	/**
	 * Atualizar o registro especificado.
	 * @param AulaRequest $aulaRequest
	 * @param int $id
	 * @return \App\Models\Aula
	 */
	public function update(
		AulaRequest $aulaRequest,
		$id)
	{
		$dados = $aulaRequest->all();

		return $this->aulaRepository->update($dados, $id);
	}

	/**
	 * Exibir um formulário de confirmação de exclusão de um registro específico.
	 * @param int $id
	 * @return array
	 */
	public function confirmDestroy($id)
	{
		$verificacao = [];
		$aula = $this->aulaRepository->find($id);

		$aulaTemRegistros = $this->aulaRepository->aulaTemRegistros($aula);

		if ($aulaTemRegistros->count()) {
			$verificacao['aula'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $aulaTemRegistros];
		}

		return ['item' => $aula, 'verificacao' => $verificacao];
	}

	/**
	 * Excluir um registro.
	 * @param int $id
	 * @return string
	 * @throws \Exception
	 */
	public function destroy($id)
	{
		$response = $this->confirmDestroy($id);
		$item = $response['item'];
		$verificacao = $response['verificacao'];

		if (count($verificacao) == 0) {
			if ($this->aulaRepository->destroy($item))
				$mensagem = 'Registro "' . $item->id . '" removido com sucesso';
			else $mensagem = 'Ocorreu um erro ao remover esse registro "' . $item->id . '", tente novamente';
		} else {
			$mensagem = 'Esse ítem possui registros relacionados!';
		}
		return $mensagem;
	}

	/**
	 * Recuperar uma coleção de Aula para o listBox
	 * @return array
	 */
	public function listBox()
	{
		$list[''] = '';

		foreach ($this->aulaRepository->listBox() as $item) {
			$list[$item->id] = $item->id;
		}

		return $list;
	}

	public function listBoxTurmas()
	{
		$list[''] = '';

		foreach ($this->aulaRepository->listBoxTurmas() as $item) {
			$list[$item->id] = $item->name;
		}

		return $list;
	}

	public function listBoxTurmasParaCadastro()
	{
		$list[''] = 'Enturmação Automática';

		foreach ($this->aulaRepository->listBoxTurmas() as $item) {
			$list[$item->id] = $item->name;
		}
		unset($list[21]);

		return $list;
	}

	public function listBoxTurmasParaEdicao()
	{
		$list[''] = 'Não alterar a turma atual';

		foreach ($this->aulaRepository->listBoxTurmas() as $item) {
			$list[$item->id] = $item->name;
		}
		unset($list[21]);

		return $list;
	}

	public function listBoxProfessor()
	{
		$list[''] = '';

		foreach ($this->aulaRepository->listBoxProfessor() as $item) {
			$list[$item->id] = $item->firstname . ' ' . $item->lastname;
		}

		return $list;
	}

	public function listBoxTurmasParaBusca()
	{
		$list[''] = 'Todas as Turmas';

		foreach ($this->aulaRepository->listBoxTurmas() as $item) {
			$list[$item->id] = $item->name;
		}

		return $list;
	}

	public function listBoxCurso()
	{
		$list[''] = '';

		foreach ($this->aulaRepository->listBoxCurso() as $item) {
			$list[$item->id] = $item->fullname;
		}

		return $list;
	}
}