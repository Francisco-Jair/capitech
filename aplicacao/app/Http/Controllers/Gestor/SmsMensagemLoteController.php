<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:27:51
 */

namespace App\Http\Controllers\Gestor;

use App\Models\Matricula;
use App\Models\SmsMensagemLoteNumero;
use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\SmsMensagemLoteRequest;
use App\Services\SmsMensagemLoteService;

class SmsMensagemLoteController extends BaseController
{
	use LogAtividades;
	/**
	 * Instância de SmsMensagemLoteService
	 *
	 * @var SmsMensagemLoteService
	 */
	protected $smsmensagemloteService;

	protected $options_destinatarios;

	/**
	 * Criar uma nova nova instância de SmsMensagemLoteController
	 * @param SmsMensagemLoteService $smsmensagemloteService
	 */
	public function __construct(SmsMensagemLoteService $smsmensagemloteService)
	{
		$this->log('acessou', __CLASS__, '');
		$this->smsmensagemloteService = $smsmensagemloteService;
		$this->service = 'smsmensagemloteService';
		$this->pastaView = 'sms_mensagem_lote';
		$this->options_destinatarios = [
			'Aluno' => 'Todos os Alunos',
			'Professor' => 'Todos os Professores',
			'Todos' => 'Professores e Alunos'
		];
	}


	/**
	 * Exibir uma lista paginada de registros.
	 *
	 * @param Request $request
	 * @return Response
	 */
	public function index(Request $request)
	{
		$camposPermitidosParaOrdenacao = ['id', 'created_at', 'updated_at'];
		$ordenacao['sort'] = 'id';
		$ordenacao['order'] = 'DESC';

		if ($request->query('sort') and in_array($request->query('sort'), $camposPermitidosParaOrdenacao)) {
			$ordenacao['sort'] = $request->query('sort');
		}

		if ($request->query('order')) {
			$ordenacao['order'] = ($request->query('order') == 'ASC' ? 'ASC' : 'DESC');
		}

		$ordenacao['reverseOrder'] = ($ordenacao['order'] == 'ASC' ? 'DESC' : 'ASC');

		$dados = $this->smsmensagemloteService->index($request, $ordenacao);
		$dados->setPath('./sms_mensagem_lote');
		return view('gestor.' . $this->pastaView . '.index', compact('dados', 'ordenacao'));
	}

	/**
	 * Exibir um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function show($id)
	{
		$item = $this->smsmensagemloteService->find($id);
		return view('gestor.' . $this->pastaView . '.form', compact('item'));
	}

	/**
	 * Exibir o formulário para criar um novo registro.
	 *
	 * @return Response
	 */
	public function create()
	{
		$options_destinatarios = $this->options_destinatarios;
		return view('gestor.' . $this->pastaView . '.form', compact('options_destinatarios'));
	}

	/**
	 * Armazenar o novo registro.
	 *
	 * @param SmsMensagemLoteRequest $smsmensagemloteRequest
	 * @return Response
	 */
	public function store(SmsMensagemLoteRequest $smsmensagemloteRequest)
	{
		$this->smsmensagemloteService->store($smsmensagemloteRequest);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Salvo com sucesso')
			->with('tipo_mensagem', 'success');
	}

	/**
	 * Exibir um formulário de edição de um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */
	public function edit($id)
	{
		$options_destinatarios = $this->options_destinatarios;
		$item = $this->smsmensagemloteService->find($id);
		return view('gestor.' . $this->pastaView . '.form', compact('item', 'options_destinatarios'));
	}

	/**
	 * Atualizar um registro específico.
	 *
	 * @param SmsMensagemLoteRequest $smsmensagemloteRequest
	 * @param int $id
	 * @return Response
	 */
	public function update(
		SmsMensagemLoteRequest $smsmensagemloteRequest,
		$id)
	{
		$this->smsmensagemloteService->update($smsmensagemloteRequest, $id);
		return redirect()->route('gestor.' . $this->pastaView . '.index')
			->with('mensagem', 'Atualizado com sucesso')
			->with('tipo_mensagem', 'success');
	}

	private function normalizaTelefone($telefone)
	{
		$inicioNumeroFixo = array(2, 3, 4);
		$telefone = preg_replace("/[^0-9]/", "", $telefone);
		$telefone = preg_replace("/^00(.+)/", "86$1", $telefone);
		if (strlen($telefone) < 10) $telefone = NULL; //8699309719
		elseif (strlen($telefone) == 10 and in_array(substr($telefone, 2, 1), $inicioNumeroFixo)) $telefone = NULL; //99 3521 8705
		elseif (strlen($telefone) == 10) {
			$telefone = substr($telefone, 0, 2) . "9" . substr($telefone, 2);
		}
		return $telefone;
	}

	/**
	 * Exibir um registro específico.
	 *
	 * @param int $id
	 * @return Response
	 */

	public function viewEnviarSms($id)
	{
		$item = $this->smsmensagemloteService->find($id);
		return view('gestor.' . $this->pastaView . '.confirm-envio', compact('item'));

	}

	public function enviarSms(Request $request)
	{

		if (!empty($request->get('id')) && (!empty($request->get('senha') && ($request->get('senha') == 102030)))) {
			$id = $request->get('id');
			$item = $this->smsmensagemloteService->find($id);
			$item->enviado = 1;
			$item->save();

			//editingteacher
			//student
			$lista_alunos = Matricula::where('phone2', '!=', '');
			if ($item->detinatario == "Aluno")
				$lista_alunos = $lista_alunos->where("archetype", "student");
			elseif ($item->detinatario == "Professor")
				$lista_alunos = $lista_alunos->where("archetype", "editingteacher");

			$lista_alunos = $lista_alunos->groupBy('user_id')
				->get();

			$contatos = [];

			foreach ($lista_alunos as &$aluno) {
				$telefoneNormalizado = $this->normalizaTelefone($aluno->phone2);
				if (!$telefoneNormalizado)
					continue;
				$smsEmLote = new SmsMensagemLoteNumero();
				$smsEmLote->sms_mensagem_lote_id = $id;
				$smsEmLote->user_id = $aluno->user_id;
				$smsEmLote->numero = $telefoneNormalizado;
				$smsEmLote->save();

				$aluno = new \stdClass();
				$aluno->telefone = $telefoneNormalizado;

				$contatos[] = $aluno;
			}

			$agamenon = new \stdClass();
			$agamenon->telefone = '86999921992';

			$eduardo = new \stdClass();
			$eduardo->telefone = '86999594721';

			$rupert = new \stdClass();
			$rupert->telefone = '86999309719';

			$gracinha = new \stdClass();
			$gracinha->telefone = '99982344086';

			$neolinia = new \stdClass();
			$neolinia->telefone = '99981234277';

			$contatos[] = $agamenon;
			$contatos[] = $eduardo;
			$contatos[] = $gracinha;
			$contatos[] = $neolinia;

			$dezContatos = array_chunk($contatos, 10);

			foreach ($dezContatos as $dezContato) {
				$rupert = new \App\Helpers\Clickatellxml();
				$rupert->templateMsg = $item->mensagem;
				$rupert->enviaSms($dezContato);
			}

		} else {
			return redirect()->route('gestor.' . $this->pastaView . '.index')
				->with('mensagem', 'Senha incorreta')
				->with('tipo_mensagem', 'danger');
		}

	}
}
