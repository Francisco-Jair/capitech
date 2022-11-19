<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

namespace App\Http\Controllers\Gestor;

use App\Http\Requests\AlunoRequestUpdate;
use App\Models\Aluno;
use App\Models\Frequencia;
use App\Services\AulaService;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\AlunoRequest;
use App\Services\AlunoService;

class AlunoController extends BaseController
{
	use LogAtividades;
	/**
	 * Instância de AlunoService
	 *
	 * @var AlunoService
	 */
	protected $alunoService;
	/**
	 * @var AulaService
	 */
	private $aulaService;

	/**
	 * Criar uma nova nova instância de AlunoController
	 * @param AlunoService $alunoService
	 * @param AulaService $aulaService
	 */
	public function __construct(AlunoService $alunoService, AulaService $aulaService)
	{
		$this->log('acessou', __CLASS__, '');
		$this->alunoService = $alunoService;
		$this->service = 'alunoService';
		$this->pastaView = 'alunos';
		$this->aulaService = $aulaService;
	}


	/**
	 * Exibir uma lista paginada de registros.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function index(Request $request)
	{
		$camposPermitidosParaOrdenacao = ['nome', 'id', 'created_at', 'updated_at'];
		$ordenacao['sort'] = 'id';
		$ordenacao['order'] = 'DESC';
		$options_role_id = $this->aulaService->listBoxTurmasParaBusca();

		if ($request->query('sort') and in_array($request->query('sort'), $camposPermitidosParaOrdenacao)) {
			$ordenacao['sort'] = $request->query('sort');
		}

		if ($request->query('order')) {
			$ordenacao['order'] = ($request->query('order') == 'ASC' ? 'ASC' : 'DESC');
		}

		$ordenacao['reverseOrder'] = ($ordenacao['order'] == 'ASC' ? 'DESC' : 'ASC');

		$dados = $this->alunoService->index($request, $ordenacao);
		$dados->setPath('./alunos');
		return view('gestor.' . $this->pastaView . '.index', compact('dados', 'ordenacao', 'options_role_id'));
	}

	/**
	 * Exibir um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function show($id)
	{
		$item = $this->alunoService->find($id);
		$options_role_id = $this->aulaService->listBoxTurmas();
		return view('gestor.' . $this->pastaView . '.form', compact('item', 'options_role_id'));
	}

	/**
	 * Exibir o formulário para criar um novo registro.
	 *
	 * @return Response
	 */
	public function create()
	{
		$options_role_id = $this->aulaService->listBoxTurmasParaCadastro();
		return view('gestor.' . $this->pastaView . '.form', compact('options_role_id'));
	}

	/**
	 * Armazenar o novo registro.
	 *
	 * @param AlunoRequest $alunoRequest
	 * @return Response
	 */
	public function store(AlunoRequest $alunoRequest)
	{
		$retorno = $this->alunoService->store($alunoRequest);

		if (isset($retorno->exception)) {
			return redirect()->route('gestor.' . $this->pastaView . '.create')
				->withInput()
				->with('mensagem', $retorno->message . (isset($retorno->debuginfo) ? ' (' . $retorno->debuginfo . ')' : null))
				->with('tipo_mensagem', 'warning');

		} else {
			return redirect()->route('gestor.' . $this->pastaView . '.index')
				->with('mensagem', 'Salvo com sucesso')
				->with('tipo_mensagem', 'success');
		}
	}

	/**
	 * Exibir um formulário de edição de um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function edit($id)
	{
		$options_role_id = $this->aulaService->listBoxTurmasParaEdicao();
		$item = $this->alunoService->find($id);
		$turmasDoAluno = $this->alunoService->retornaTurmasDoAluno($id);

		if ($turmasDoAluno->count() == 1)
			$options_role_id[''] = 'Manter na turma ' . $turmasDoAluno[0]->role_name;

		unset($item->role_id);
		$item->password = '';
		return view('gestor.' . $this->pastaView . '.form', compact('item', 'options_role_id'));
	}

	/**
	 * Atualizar um registro específico.
	 *
	 * @param AlunoRequestUpdate $alunoRequest
	 * @param int $id
	 * @return Response
	 */
	public function update(
		AlunoRequestUpdate $alunoRequest,
		$id)
	{
		$this->alunoService->update($alunoRequest, $id);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Atualizado com sucesso')
			->with('tipo_mensagem', 'success');
	}

	public function unenrolUsers($id)
	{
		$this->alunoService->unenrolUsers($id);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Matrículas removidas com sucesso')
			->with('tipo_mensagem', 'success');
	}

	public function confirmDestroy($id)
	{
		$this->alunoService->destroy($id);

		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Removido com sucesso')
			->with('tipo_mensagem', 'success');

	}

	public function importar()
	{
		$this->alunoService->importar();
	}

	public function atualizarInstituicao()
	{
		//$this->alunoService->atualizarInstituicao();
		$this->alunoService->atualizarInstituicaoCsv();
	}
}