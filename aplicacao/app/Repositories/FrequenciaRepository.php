<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:44
 */

namespace App\Repositories;

use App\Models\Frequencia;

class FrequenciaRepository
{

    /**
     * Criar uma nova instância de FrequenciaRepository.
     * @param Frequencia $frequencia
     */
    public function __construct(Frequencia $frequencia)
    {
        $this->model = $frequencia;
    }


    /**
     * Recuperar uma Coleção paginada de Frequencia
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

        if (isset($parametros['frequencia'])) {
            $frequencia = strtolower($parametros['frequencia']);

            $query = $query->where(function ($q2) use ($frequencia) {
                $q2->whereRaw('LOWER(frequencia) LIKE ?', array("%{$frequencia}%"));
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
     * Recuperar um ítem do Model Frequencia
     * @param  int $id
     * @return Frequencia $frequencia
     */
    public function find($id)
    {
        return $item = $this->model->findOrFail($id);
    }

    /**
     * Criar Frequencia
     * @param array $dados
     * @return Frequencia $frequencia
     * @throws \Exception
     */
    public function store(array $dados)
    {
        $frequencia = new $this->model;
        return $this->saveFrequencia($frequencia, $dados);
    }

    /**
     * Atualizar Frequencia.
     *
     * @param array $dados
     * @param  int $id
     * @return Frequencia $frequencia
     * @throws \Exception
     */
    public function update(array $dados, $id)
    {
        $frequencia = $this->model->findOrFail($id);
        return $this->saveFrequencia($frequencia, $dados);
    }

    /**
     * Salvar Frequencia.
     * @param Frequencia $frequencia
     * @param array $dados
     * @return Frequencia
     * @throws \Exception
     */
    private function saveFrequencia(Frequencia $frequencia, array $dados)
    {
        \DB::beginTransaction();
        try {
                        if(isset($dados['aula_id']))
                $frequencia->aula_id = trim($dados['aula_id']);
            if(isset($dados['user_id']))
                $frequencia->user_id = trim($dados['user_id']);
            if(isset($dados['presente']))
                $frequencia->presente = trim($dados['presente']);

            $frequencia->save();

        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return $frequencia;
    }


    /**
     * Verifica se o model tem dependência de algum outro model
     * @param Frequencia $frequencia
     * @return bool
     */

    public function frequenciaTemRegistros(Frequencia $frequencia)
    {
        // Esse return é apenas para bloquear a exclusão.
        return $frequencia->get();

        //Se esse model possuir outro model relacionado:
        //return $frequencia->metodoHasMany();

        //Se esse model não possuir outro model relacionado:
        return $frequencia->where('id', 0);
    }

    /**
     * Excluir um registro.
     * @param Frequencia $frequencia
     * @return bool
     * @throws \Exception
     */
    public function destroy(Frequencia $frequencia)
    {
        \DB::beginTransaction();
        try {
            $frequencia->delete();
        } catch (\Exception $e) {
            \DB::rollback();
            throw new \Exception($e);
        }
        \DB::commit();

        return true;
    }

    /**
     * Recuperar um array de Frequencia para o listBox
     * @return Illuminate\Database\Eloquent\Collection
     */
    public function listBox()
    {
        return $this->model->select('id', 'id')->orderBy('id', 'asc')->get();
    }

    ## REMOVER SE NÃO USAR ##
    /**
     * Remover uma imagem do banco de dados
     * @param Frequencia $frequencia
     * @param int $campoRemover
     * @return bool
     */
    public function imageDestroy(Frequencia $frequencia, $campoRemover)
    {
        $frequencia->$campoRemover = NULL;
        $frequencia->save();
        return true;
    }
}