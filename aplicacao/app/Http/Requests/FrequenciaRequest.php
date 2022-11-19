<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:16:44
 */

namespace App\Http\Requests;

class FrequenciaRequest extends Request
{

    /**
     * Regras de validação que se aplicam a solicitação padrão.
     *
     * @var array
     */
    protected $regras = [
        'user_id' => 'required',
        'presente' => 'required|in:S,N',
    ];

    /**
     * Retorna as regras de validação que se aplicam a solicitação padrão.
     *
     * @return array
     */
    public function rules()
    {
        $id = Request::segment(3) ? ',' . Request::segment(3) : '';
        $rules = [
            'aula_id' => $this->regras['aula_id'],
            'user_id' => $this->regras['user_id'],
            'presente' => $this->regras['presente'],
        ];

        if (!$id)
            $rules = array_merge($rules, []);
        else if ($id)
            $rules = array_merge($rules, []);
        return $rules;
    }

    /**
     * Determine se o usuário está autorizado a fazer este pedido.
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}