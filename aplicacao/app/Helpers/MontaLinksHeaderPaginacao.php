<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/11/15
 * Time: 10:37
 */

namespace App\Helpers;

use Illuminate\Support\Facades\Input;

class MontaLinksHeaderPaginacao
{

    protected $query = [];
    protected $pageName = 'page';


    public static function MontaLinksHeaderPaginacao($ordenacao, $header, $label)
    {

        $inputs = Input::all();
        $complemento_paginacao = '?';

        if (!empty($inputs) && is_array($inputs)) {

            foreach ($inputs as $key => $value) {

                $complemento_paginacao .= '&' . $key . '=' . $value;

            }

        }

        $retorno = '
                                <a href="'.$complemento_paginacao.'sort=' . $header . '&amp;order=' . $ordenacao['reverseOrder'] . '">';

        if (\Request::query('sort') == $header and \Request::query('order') == 'ASC')
            $retorno .= '                                        <i class="glyphicon glyphicon-chevron-up fa-xs"></i>';
        elseif (\Request::query('sort') == $header and \Request::query('order') == 'DESC')
            $retorno .= '                                        <i class="glyphicon glyphicon-chevron-down fa-xs"></i>';
        else if ($header == $ordenacao['sort'])
            $retorno .= '                                        <i class="glyphicon glyphicon-chevron-down fa-xs"></i>';
        $retorno .= '                        ' . $label . '
                                </a>
        ';
        return $retorno;

    }


}