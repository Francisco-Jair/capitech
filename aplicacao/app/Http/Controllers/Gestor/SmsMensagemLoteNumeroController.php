<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:29:55
 */

namespace App\Http\Controllers\Gestor;

use Illuminate\Http\Request;
use App\Traits\LogAtividades;
use App\Http\Requests\SmsMensagemLoteNumeroRequest;
use App\Services\SmsMensagemLoteNumeroService;

class SmsMensagemLoteNumeroController extends BaseController
{
    use LogAtividades;
    /**
     * Instância de SmsMensagemLoteNumeroService
     *
     * @var SmsMensagemLoteNumeroService
     */
    protected $smsmensagemlotenumeroService;

    /**
     * Criar uma nova nova instância de SmsMensagemLoteNumeroController
     * @param SmsMensagemLoteNumeroService $smsmensagemlotenumeroService
     */
    public function __construct(SmsMensagemLoteNumeroService $smsmensagemlotenumeroService)
    {
        $this->log('acessou',__CLASS__,'');
        $this->smsmensagemlotenumeroService = $smsmensagemlotenumeroService;
        $this->service = 'smsmensagemlotenumeroService';
        $this->pastaView = 'sms_mensagem_lote_numeros';
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

        $dados = $this->smsmensagemlotenumeroService->index($request, $ordenacao);
        $dados->setPath('./sms_mensagem_lote_numeros');
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
        $item = $this->smsmensagemlotenumeroService->find($id);
        return view('gestor.'.$this->pastaView.'.form', compact('item'));
    }

    /**
     * Exibir o formulário para criar um novo registro.
     *
     * @return Response
     */
    public function create()
    {
        //$options_sms_mensagem_lote_numeros_id = $this->smsmensagemlotenumeroService->listBox();
        return view('gestor.'.$this->pastaView.'.form');
    }

    /**
     * Armazenar o novo registro.
     *
     * @param SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest
     * @return Response
     */
    public function store(SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest)
    {
        $this->smsmensagemlotenumeroService->store($smsmensagemlotenumeroRequest);
        return redirect()->route('gestor.'.$this->pastaView.'.index')
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
        //$options_sms_mensagem_lote_numeros_id = $this->smsmensagemlotenumeroService->listBox();
        $item = $this->smsmensagemlotenumeroService->find($id);
        return view('gestor.'.$this->pastaView.'.form', compact('item'));
    }

    /**
     * Atualizar um registro específico.
     *
     * @param SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest
     * @param int $id
     * @return Response
     */
    public function update(
        SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest,
        $id)
    {
        $this->smsmensagemlotenumeroService->update($smsmensagemlotenumeroRequest, $id);
        return redirect()->route('gestor.'.$this->pastaView.'.index')
            ->with('mensagem', 'Atualizado com sucesso')
            ->with('tipo_mensagem', 'success');
    }
}
