<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

namespace App\Http\Requests;

class AulaRequest extends Request
{

    /**
     * Regras de validação que se aplicam a solicitação padrão.
     *
     * @var array
     */
    protected $regras = [
        'role_id' => 'required',
        'user_id' => 'required',
        'course_id' => 'required',
        'data_aula' => 'required|date_format:d/m/Y',
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
            'role_id' => $this->regras['role_id'],
            'user_id' => $this->regras['user_id'],
            'course_id' => $this->regras['course_id'],
            'data_aula' => $this->regras['data_aula'],
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