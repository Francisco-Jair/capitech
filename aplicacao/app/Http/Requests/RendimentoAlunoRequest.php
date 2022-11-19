<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 19-12-2016
 * Time: 09:40:37
 */

namespace App\Http\Requests;

class RendimentoAlunoRequest extends Request
{

    /**
     * Regras de validação que se aplicam a solicitação padrão.
     *
     * @var array
     */
    protected $regras = [
        'rendimento' => 'required',
        'role_id' => 'required',
        'course_id' => 'required',
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
            'rendimento' => $this->regras['rendimento'],
            'role_id' => $this->regras['role_id'],
            'course_id' => $this->regras['course_id'],
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