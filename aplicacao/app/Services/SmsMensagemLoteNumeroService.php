<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:29:55
 */

namespace App\Services;

//use App\ImagemUpload;
use Illuminate\Http\Request;
use App\Http\Requests\SmsMensagemLoteNumeroRequest;
use App\Repositories\SmsMensagemLoteNumeroRepository;
//use App\Traits\ImagemUploadTraitService;

class SmsMensagemLoteNumeroService
{
    //use ImagemUploadTraitService;
    /**
     * Instância de SmsMensagemLoteNumeroRepository
     * @var SmsMensagemLoteNumeroRepository
     */
    protected $smsmensagemlotenumeroRepository;

    /**
     * Criar uma nova nova instância de SmsMensagemLoteNumeroService
     * @param SmsMensagemLoteNumeroRepository $smsmensagemlotenumeroRepository
     */
    public function __construct(SmsMensagemLoteNumeroRepository $smsmensagemlotenumeroRepository)
    {
        $this->smsmensagemlotenumeroRepository = $smsmensagemlotenumeroRepository;
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

        //if ($request->query('smsmensagemlotenumero'))
        //    $parametros['smsmensagemlotenumero'] = $request->get('smsmensagemlotenumero');

        return $this->smsmensagemlotenumeroRepository->index(20, $parametros, $ordenacao);
    }

    /**
     * Retornar um registro
     * @param int $id
     * @return \App\Models\SmsMensagemLoteNumero
     */
    public function find($id)
    {
        return $this->smsmensagemlotenumeroRepository->find($id);
    }
    
    /**
     * Armazenar o novo registro no repositório de dados.
     * @param SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest
     * @return \App\Models\SmsMensagemLoteNumero
     */
    public function store(SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest)
    {
        $dados = $smsmensagemlotenumeroRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($smsmensagemlotenumeroRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($smsmensagemlotenumeroRequest['imagem'])
                ->caminho('sms_mensagem_lote_numeros')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->smsmensagemlotenumeroRepository->store($dados);
    }

    /**
     * Atualizar o registro especificado.
     * @param SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest
     * @param int $id
     * @return \App\Models\SmsMensagemLoteNumero
     */
    public function update(
        SmsMensagemLoteNumeroRequest $smsmensagemlotenumeroRequest,
        $id)
    {
        $dados = $smsmensagemlotenumeroRequest->all();

        /*
        ## REMOVER SE NÃO USAR ##
        if($smsmensagemlotenumeroRequest->hasFile('imagem')){
            $imagem = (new ImagemUpload())
                ->campo($smsmensagemlotenumeroRequest['imagem'])
                ->caminho('sms_mensagem_lote_numeros')
                ->build();
            $nome_imagem = $this->enviaImagem($imagem);
            $dados = array_merge($dados, ['imagem' => $nome_imagem]);
        }*/
        return $this->smsmensagemlotenumeroRepository->update($dados, $id);
    }

    /**
     * Exibir um formulário de confirmação de exclusão de um registro específico.
     * @param int $id
     * @return array
     */
    public function confirmDestroy($id)
    {
        $verificacao = [];
        $smsmensagemlotenumero = $this->smsmensagemlotenumeroRepository->find($id);

        $smsmensagemlotenumeroTemRegistros = $this->smsmensagemlotenumeroRepository->smsmensagemlotenumeroTemRegistros($smsmensagemlotenumero);

        if ($smsmensagemlotenumeroTemRegistros->count()) {
            $verificacao['smsmensagemlotenumero'] = ['mensagem' => 'Existem registros relacionados a esse ítem!', 'registros' => $smsmensagemlotenumeroTemRegistros];
        }

        return ['item' => $smsmensagemlotenumero, 'verificacao' => $verificacao];
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
            if ($this->smsmensagemlotenumeroRepository->destroy($item))
                $mensagem = 'Registro "' . $item->id . '" removido com sucesso';
            else $mensagem = 'Ocorreu um erro ao remover esse registro "' . $item->id . '", tente novamente';
        } else {
            $mensagem = 'Esse ítem possui registros relacionados!';
        }
        return $mensagem;
    }

    /**
     * Recuperar uma coleção de SmsMensagemLoteNumero para o listBox
     * @return array
     */
    public function listBox()
    {
        $list[''] = '';

        foreach ($this->smsmensagemlotenumeroRepository->listBox() as $item) {
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
        $smsmensagemlotenumero = $this->smsmensagemlotenumeroRepository->find($id);

        $campoRemover = 'imagem' . $ordemImagem;
        $imagem = $smsmensagemlotenumero->$campoRemover;

        if ($imagem) {
            $pasta = config('configuracoes.upload.sms_mensagem_lote_numeros.caminho');
            $pastaOriginal = config('configuracoes.upload.sms_mensagem_lote_numeros.caminhoOriginal');

            $caminho_imagem_original = $pastaOriginal . $imagem;
            $caminho_imagem = $pasta . $imagem;

            if (\Storage::exists($caminho_imagem_original))
                \Storage::delete($caminho_imagem_original);

            if (\Storage::exists($caminho_imagem))
                \Storage::delete($caminho_imagem);

            return $this->smsmensagemlotenumeroRepository->imageDestroy($smsmensagemlotenumero, $campoRemover);
        }
        return false;
    }
}