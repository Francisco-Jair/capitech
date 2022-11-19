<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:29:55
 */

namespace App\Repositories;

use App\Models\SmsMensagemLoteNumero;

class SmsMensagemLoteNumeroRepository
{

    /**
     * Criar uma nova instância de SmsMensagemLoteNumeroRepository.
     * @param SmsMensagemLoteNumero $smsmensagemlotenumero
     */
    public function __construct(SmsMensagemLoteNumero $smsmensagemlotenumero)
    {
        $this->model = $smsmensagemlotenumero;
    }


    /**
     * Recuperar uma Coleção paginada de SmsMensagemLoteNumero
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

        if (isset($parametros['smsmensagemlotenumero'])) {
            $smsmensagemlotenumero = strtolower($parametros['smsmensagemlotenumero']);

            $query = $query->where(function ($q2) use ($smsmensagemlotenumero) {
                $q2->whereRaw('LOWER(smsmensagemlotenumero) LIKE ?', array("%{$smsmensagemlotenumero}%"));
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
     * Recuperar um ítem do Model SmsMensagemLoteNumero
     * @param  int $id
     * @return SmsMensagemLoteNumero $smsmensagemlotenumero
     */
    public function find($id)
    {
        return $item = $this->model->findOrFail($id);
    }

    /**
     * Criar SmsMensagemLoteNumero
     * @param array $dados
     * @return SmsMensagemLoteNumero $smsmensagemlotenumero
     * @throws \Exception
     */
    public function store(array $dados)
    {
        $smsmensagemlotenumero = new $this->model;
        return $this->saveSmsMensagemLoteNumero($smsmensagemlotenumero, $dados);
    }

    /**
     * Atualizar SmsMensagemLoteNumero.
     *
     * @param array $dados
     * @param  int $id
     * @return SmsMensagemLoteNumero $smsmensagemlotenumero
     * @throws \Exception
     */
    public function update(array $dados, $id)
    {
        $smsmensagemlotenumero = $this->model->findOrFail($id);
        return $this->saveSmsMensagemLoteNumero($smsmensagemlotenumero, $dados);
    }

    /**
     * Salvar SmsMensagemLoteNumero.
     * @param SmsMensagemLoteNumero $smsmensagemlotenumero
     * @param array $dados
     * @return SmsMensagemLoteNumero
     * @throws \Exception
     */
    private function saveSmsMensagemLoteNumero(SmsMensagemLoteNumero $smsmensagemlotenumero, array $dados)
    {
        \DB::beginTransaction();
        try {
                        if(isset($dados['sms_mensagem_lote_id']))
                $smsmensagemlotenumero->sms_mensagem_lote_id = trim($dados['sms_mensagem_lote_id']);
            if(isset($dados['user_id']))
                $smsmensagemlotenumero->user_id = trim($dados['user_id']);
            if(isset($dados['numero']))
                $smsmensagemlotenumero->numero = trim($dados['numero']);

            $smsmensagemlotenumero->save();

        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return $smsmensagemlotenumero;
    }


    /**
     * Verifica se o model tem dependência de algum outro model
     * @param SmsMensagemLoteNumero $smsmensagemlotenumero
     * @return bool
     */

    public function smsmensagemlotenumeroTemRegistros(SmsMensagemLoteNumero $smsmensagemlotenumero)
    {
        // Esse return é apenas para bloquear a exclusão.
        return $smsmensagemlotenumero->get();

        //Se esse model possuir outro model relacionado:
        //return $smsmensagemlotenumero->metodoHasMany();

        //Se esse model não possuir outro model relacionado:
        return $smsmensagemlotenumero->where('id', 0);
    }

    /**
     * Excluir um registro.
     * @param SmsMensagemLoteNumero $smsmensagemlotenumero
     * @return bool
     * @throws \Exception
     */
    public function destroy(SmsMensagemLoteNumero $smsmensagemlotenumero)
    {
        \DB::beginTransaction();
        try {
            $smsmensagemlotenumero->delete();
        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return true;
    }

    /**
     * Recuperar um array de SmsMensagemLoteNumero para o listBox
     * @return Illuminate\Database\Eloquent\Collection
     */
    public function listBox()
    {
        return $this->model->select('id', 'id')->orderBy('id', 'asc')->get();
    }

    ## REMOVER SE NÃO USAR ##
    /**
     * Remover uma imagem do banco de dados
     * @param SmsMensagemLoteNumero $smsmensagemlotenumero
     * @param int $campoRemover
     * @return bool
     */
    public function imageDestroy(SmsMensagemLoteNumero $smsmensagemlotenumero, $campoRemover)
    {
        $smsmensagemlotenumero->$campoRemover = NULL;
        $smsmensagemlotenumero->save();
        return true;
    }
}