<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:29:55
 */

namespace App\Http\Requests;

class SmsMensagemLoteNumeroRequest extends Request
{

    /**
     * Regras de validação que se aplicam a solicitação padrão.
     *
     * @var array
     */
    protected $regras = [
        'user_id' => 'required',
        'numero' => 'required|min:5|max:255',
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
            'sms_mensagem_lote_id' => $this->regras['sms_mensagem_lote_id'],
            'user_id' => $this->regras['user_id'],
            'numero' => $this->regras['numero'],
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