<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:37
 */

namespace App\Relatorios;


interface IRelatorio
{
    public function processaRelatorio($dados);
}