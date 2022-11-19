<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 12/04/15
 * Time: 21:05
 */

namespace App\Traits;

use App\Models\LogAtividade;

trait LogAtividades
{
    public function log($operacao, $model, $dados)
    {
        if (\Session::get('_devMode_')) {
            return new LogAtividade();
        } else {
            if (\Session::get('_id_')) {
                $usuario_id = \Session::get('_id_');

                $log = new LogAtividade();

                $log->gestor_id = $usuario_id;
                $log->operacao = $operacao;
                $log->modulo = str_replace('App\Http\Controllers\Gestor\\', '', $model);
                $log->pagina = \Request::fullUrl();
                $log->dados = $dados;

                $log->save();

                return $log;
            }
        }

    }
}