<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:27:51
 */

namespace App\Repositories;

use App\Models\SmsMensagemLote;

class SmsMensagemLoteRepository
{

    /**
     * Criar uma nova instância de SmsMensagemLoteRepository.
     * @param SmsMensagemLote $smsmensagemlote
     */
    public function __construct(SmsMensagemLote $smsmensagemlote)
    {
        $this->model = $smsmensagemlote;
    }


    /**
     * Recuperar uma Coleção paginada de SmsMensagemLote
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

            if($id > 0){
                $query = $query->where(function ($q2) use ($id) {
                    $q2->whereRaw('id = ?', array($id));
                });
            }

        }

        if (isset($parametros['smsmensagemlote'])) {
            $smsmensagemlote = strtolower($parametros['smsmensagemlote']);

            $query = $query->where(function ($q2) use ($smsmensagemlote) {
                $q2->whereRaw('LOWER(smsmensagemlote) LIKE ?', array("%{$smsmensagemlote}%"));
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

        return $query->paginate($registros);
    }

    /**
     * Recuperar um ítem do Model SmsMensagemLote
     * @param  int $id
     * @return SmsMensagemLote $smsmensagemlote
     */
    public function find($id)
    {
        return $item = $this->model->findOrFail($id);
    }

    /**
     * Criar SmsMensagemLote
     * @param array $dados
     * @return SmsMensagemLote $smsmensagemlote
     * @throws \Exception
     */
    public function store(array $dados)
    {
        $smsmensagemlote = new $this->model;
        return $this->saveSmsMensagemLote($smsmensagemlote, $dados);
    }

    /**
     * Atualizar SmsMensagemLote.
     *
     * @param array $dados
     * @param  int $id
     * @return SmsMensagemLote $smsmensagemlote
     * @throws \Exception
     */
    public function update(array $dados, $id)
    {
        $smsmensagemlote = $this->model->findOrFail($id);
        return $this->saveSmsMensagemLote($smsmensagemlote, $dados);
    }

    /**
     * Salvar SmsMensagemLote.
     * @param SmsMensagemLote $smsmensagemlote
     * @param array $dados
     * @return SmsMensagemLote
     * @throws \Exception
     */
    private function saveSmsMensagemLote(SmsMensagemLote $smsmensagemlote, array $dados)
    {
        \DB::beginTransaction();
        try {
                        if(isset($dados['destinatario']))
                $smsmensagemlote->destinatario = trim($dados['destinatario']);
            if(isset($dados['mensagem']))
                $smsmensagemlote->mensagem = trim($dados['mensagem']);

            $smsmensagemlote->save();

        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return $smsmensagemlote;
    }


    /**
     * Verifica se o model tem dependência de algum outro model
     * @param SmsMensagemLote $smsmensagemlote
     * @return bool
     */

    public function smsmensagemloteTemRegistros(SmsMensagemLote $smsmensagemlote)
    {
        // Esse return é apenas para bloquear a exclusão.
        return $smsmensagemlote->get();

        //Se esse model possuir outro model relacionado:
        //return $smsmensagemlote->metodoHasMany();

        //Se esse model não possuir outro model relacionado:
        return $smsmensagemlote->where('id', 0);
    }

    /**
     * Excluir um registro.
     * @param SmsMensagemLote $smsmensagemlote
     * @return bool
     * @throws \Exception
     */
    public function destroy(SmsMensagemLote $smsmensagemlote)
    {
        \DB::beginTransaction();
        try {
            $smsmensagemlote->delete();
        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return true;
    }

    /**
     * Recuperar um array de SmsMensagemLote para o listBox
     * @return Illuminate\Database\Eloquent\Collection
     */
    public function listBox()
    {
        return $this->model->select('id', 'id')->orderBy('id', 'asc')->get();
    }

    ## REMOVER SE NÃO USAR ##
    /**
     * Remover uma imagem do banco de dados
     * @param SmsMensagemLote $smsmensagemlote
     * @param int $campoRemover
     * @return bool
     */
    public function imageDestroy(SmsMensagemLote $smsmensagemlote, $campoRemover)
    {
        $smsmensagemlote->$campoRemover = NULL;
        $smsmensagemlote->save();
        return true;
    }
}