<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:27:51
 */

namespace App\Services;

//use App\ImagemUpload;
use Illuminate\Http\Request;
use App\Http\Requests\SmsMensagemLoteRequest;
use App\Repositories\SmsMensagemLoteRepository;
//use App\Traits\ImagemUploadTraitService;

class SmsMensagemLoteService
{
    //use ImagemUploadTraitService;
    /**
     * Instância de SmsMensagemLoteRepository
     * @var SmsMensagemLoteRepository
     */
    protected $smsmensagemloteRepository;

    /**
     * Criar uma nova nova instância de SmsMensagemLoteService
     * @param SmsMensagemLoteRepository $smsmensagemloteRepository
     */
    public function __construct(SmsMensagemLoteRepository $smsmensagemloteRepository)
    {
        $this->smsmensagemloteRepository = $smsmensagemloteRepository;
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

        //if ($request->query('smsmensagemlote'))
        //    $parametros['smsmensagemlote'] = $request->get('smsmensagemlote');

        return $this->smsmensagemloteRepository->index(20, $parametros, $ordenacao);
    }

    /**
     * Retornar um registro
     * @param int $id
     * @return \App\Models\SmsMensagemLote
     */
    public function find($id)
    {
        return $this->smsmensagemloteRepository->find($id);
    }
    
    /**
     * Armazenar o novo registro no repositório de dados.
     * @param SmsMensagemLoteRequest $smsmensagemloteRequest
     * @return \App\Models\SmsMensagemLote
     */
    public function store(SmsMensagemLoteRequest $smsmensagemloteRequest)
    {
        $dados = $smsmensagemloteRequest->all();

        return $this->smsmensagemloteRepository->store($dados);
    }

    /**
     * Atualizar o registro especificado.
     * @param SmsMensagemLoteRequest $smsmensagemloteRequest
     * @param int $id
     * @return \App\Models\SmsMensagemLote
     */
    public function update(
        SmsMensagemLoteRequest $smsmensagemloteRequest,
        $id)
    {
        $dados = $smsmensagemloteRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($smsmensagemloteRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($smsmensagemloteRequest['imagem'])
                ->caminho('sms_mensagem_lote')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->smsmensagemloteRepository->update($dados, $id);
    }

    /**
     * Exibir um formulário de confirmação de exclusão de um registro específico.
     * @param int $id
     * @return array
     */
    public function confirmDestroy($id)
    {
        $verificacao = [];
        $smsmensagemlote = $this->smsmensagemloteRepository->find($id);

        $smsmensagemloteTemRegistros = $this->smsmensagemloteRepository->smsmensagemloteTemRegistros($smsmensagemlote);

        if ($smsmensagemloteTemRegistros->count()) {
            $verificacao['smsmensagemlote'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $smsmensagemloteTemRegistros];
        }

        return ['item' => $smsmensagemlote, 'verificacao' => $verificacao];
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
            if ($this->smsmensagemloteRepository->destroy($item))
                $mensagem = 'Registro "' . $item->id . '" removido com sucesso';
            else $mensagem = 'Ocorreu um erro ao remover esse registro "' . $item->id . '", tente novamente';
        } else {
            $mensagem = 'Esse ítem possui registros relacionados!';
        }
        return $mensagem;
    }

    /**
     * Recuperar uma coleção de SmsMensagemLote para o listBox
     * @return array
     */
    public function listBox()
    {
        $list[''] = '';

        foreach ($this->smsmensagemloteRepository->listBox() as $item) {
            $list[$item->id] = $item->id;
        }

        return $list;
    }

    ## REMOVER SE NÃO USAR ##
    /**
     * Remover fisicamente uma imagem
     * @param int $id
     * @param int $ordemImagem
     * @return bool
     */
    public function imageDestroy($id, $ordemImagem)
    {
        $smsmensagemlote = $this->smsmensagemloteRepository->find($id);

        $campoRemover = 'imagem' . $ordemImagem;
        $imagem = $smsmensagemlote->$campoRemover;

        if ($imagem) {
            $pasta = config('configuracoes.upload.sms_mensagem_lote.caminho');
            $pastaOriginal = config('configuracoes.upload.sms_mensagem_lote.caminhoOriginal');

            $caminho_imagem_original = $pastaOriginal . $imagem;
            $caminho_imagem = $pasta . $imagem;

            if (\Storage::exists($caminho_imagem_original))
                \Storage::delete($caminho_imagem_original);

            if (\Storage::exists($caminho_imagem))
                \Storage::delete($caminho_imagem);

            return $this->smsmensagemloteRepository->imageDestroy($smsmensagemlote, $campoRemover);
        }
        return false;
    }
}