<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:54
 */

namespace App\Relatorios;

use App\Models\Aula;
use App\Models\Course;
use App\Models\Departamento;
use App\Models\Frequencia;
use App\Models\Matricula;
use App\Models\Modalidade;
use App\Models\Processo;
use App\Models\Solicitante;

class RelatorioAnaliticoAulaPorTurmaTurnoModulo implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            if ($filtro['tipo'] == 'completo') {

                $dados = Frequencia::orderBy('aula_id')
                    ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                    ->where('mdl_user.deleted', '=', '0')
                    ->where('aula_id', '=', $filtro['aula_id'])
                    ->orderBy('mdl_user.firstname', 'asc')
                    ->get();
                $this->pdf->setTituloDoRelatorio(strtoupper('FREQUÊNCIA ELETRÔNICA DA ' . $dados[0]->aula->role->name
                    . ' NO ' . $dados[0]->aula->course->fullname . ' em ' . $dados[0]->aula->data_aula));
                $this->pdf->iniciaPdf();

                $professor = Aula::join('mdl_user', 'mdl_user.id', '=', 'aulas.user_id')
                    ->where('aulas.id', '=', $filtro['aula_id'])
                    ->first();


                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    array(3, 8), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();
                $headerPdfTable[0] = array('TEXT' => 'FILTROS', 'COLSPAN' => 2);
                $pdfTable->addHeader($headerPdfTable);

                $aRow[0] = array('TEXT' => 'TIPO');
                $aRow[1] = array('TEXT' => utf8_decode('RELATÓRIO DE PRESENÇAS E FALTAS'));
                $pdfTable->addRow($aRow);
                $aRow[0] = array('TEXT' => 'PROFESSOR');
                $aRow[1] = array('TEXT' => $this->pdf->decode(mb_strtoupper($professor->firstname . ' ' . $professor->lastname)));
                $pdfTable->addRow($aRow);

                $pdfTable->close();
                $this->pdf->Ln(1);



                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );



                $manha = 0;
                $tarde = 0;
                if ($dados->count()) {

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => utf8_decode('MANHÂ')];
                    $headerPdfTable2[3] = ['TEXT' => 'TARDE'];
                    $headerPdfTable2[4] = ['TEXT' => 'TELEFONE'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    $ordem = 0;
                    foreach ($dados as $item) {

                        if ($item->presente_m == 'S')
                            $manha++;

                        if ($item->presente_t == 'S')
                            $tarde++;

                        $ordem++;

                        $aRow0 = [];
                        $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                        $aRow0[1] = ['TEXT' => utf8_decode($item->usuario->firstname) . ' ' . utf8_decode($item->usuario->lastname), 'TEXT_ALIGN' => 'L'];
                        $aRow0[2] = ['TEXT' => $item->presente_m == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[3] = ['TEXT' => $item->presente_t == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[4] = ['TEXT' => $item->phone1 . ' ' . $item->phone1, 'TEXT_ALIGN' => 'L'];
                        $aRow0[5] = ['TEXT' => $item->institution ? utf8_decode($item->institution) : '', 'TEXT_ALIGN' => 'L'];
                        $pdfTable->addRow($aRow0);

                    }

                    $pdfTable->close();

                    $this->pdf->Ln(1);

                    $pdfTable = new \PdfTable($this->pdf);
                    $pdfTable->initialize(
                        array(9.5, 9.5, 8.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $ausentes_pela_manha = $ordem - $manha;
                    $ausentes_pela_tarde = $ordem - $tarde;

                    $headerPdfTable = array();
                    $headerPdfTable[0] = array('TEXT' => utf8_decode('FREQUÊNCIA DA MANHÂ'));
                    $headerPdfTable[1] = array('TEXT' => utf8_decode('FREQUÊNCIA DA TARDE'));
                    $headerPdfTable[2] = array('TEXT' => 'TOTAL');
                    $pdfTable->addHeader($headerPdfTable);
                    $aRow[0] = array('TEXT' => $manha . ' presentes / ' . $ausentes_pela_manha . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[1] = array('TEXT' => $tarde . ' presentes / ' . $ausentes_pela_tarde . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[2] = array('TEXT' => ($manha + $tarde) . ' presentes / ' . ($ausentes_pela_manha + $ausentes_pela_tarde) . ' ausentes', "TEXT_ALIGN" => "C");
                    $pdfTable->addRow($aRow);
                    $pdfTable->close();

                } else {
                    /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        array(27.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $aRow0[0] = array('TEXT' => $this->pdf->decode('NÃO EXISTEM RESULTADOS'),
                        'TEXT_SIZE' => 12,
                        'TEXT_ALIGN' => 'C',
                        'BORDER_TYPE' => 0);
                    $pdfTable->addRow($aRow0);

                    $pdfTable->close();
                }

                $this->pdf->finalizaPdf();


            } else if ($filtro['tipo'] == 'faltas') {


                $dados = Frequencia::orderBy('aula_id')
                    ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                    ->where('mdl_user.deleted', '=', '0')
                    ->where('aula_id', '=', $filtro['aula_id'])
                    ->orderBy('mdl_user.firstname', 'asc')
                    ->where('presente_m', '=', 'N')
                    ->where('presente_t', '=', 'N')
                    ->get();
                $this->pdf->setTituloDoRelatorio(strtoupper('FREQUÊNCIA DA ' . $dados[0]->aula->role->name
                    . ' NO ' . $dados[0]->aula->course->fullname . ' em ' . $dados[0]->aula->data_aula));
                $this->pdf->iniciaPdf();

                $professor = Aula::join('mdl_user', 'mdl_user.id', '=', 'aulas.user_id')
                    ->where('aulas.id', '=', $filtro['aula_id'])
                    ->first();


                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    array(3, 8), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();
                $headerPdfTable[0] = array('TEXT' => 'FILTROS', 'COLSPAN' => 2);
                $pdfTable->addHeader($headerPdfTable);

                $aRow[0] = array('TEXT' => 'TIPO');
                $aRow[1] = array('TEXT' => utf8_decode('RELATÓRIO DE 100% FALTAS'));
                $pdfTable->addRow($aRow);
                $aRow[0] = array('TEXT' => 'PROFESSOR');
                $aRow[1] = array('TEXT' => $this->pdf->decode(mb_strtoupper($professor->firstname . ' ' . $professor->lastname)));
                $pdfTable->addRow($aRow);

                $pdfTable->close();
                $this->pdf->Ln(1);


                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );


                $manha = 0;
                $tarde = 0;
                if ($dados->count()) {

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => utf8_decode('MANHÂ')];
                    $headerPdfTable2[3] = ['TEXT' => 'TARDE'];
                    $headerPdfTable2[4] = ['TEXT' => 'TELEFONE'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    $ordem = 0;
                    foreach ($dados as $item) {

                        if ($item->presente_m == 'S')
                            $manha++;

                        if ($item->presente_t == 'S')
                            $tarde++;

                        $ordem++;

                        $aRow0 = [];
                        $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                        $aRow0[1] = ['TEXT' => utf8_decode($item->usuario->firstname) . ' ' . utf8_decode($item->usuario->lastname), 'TEXT_ALIGN' => 'L'];
                        $aRow0[2] = ['TEXT' => $item->presente_m == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[3] = ['TEXT' => $item->presente_t == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[4] = ['TEXT' => $item->phone1 . ' ' . $item->phone1, 'TEXT_ALIGN' => 'L'];
                        $aRow0[5] = ['TEXT' => $item->institution ? utf8_decode($item->institution) : '', 'TEXT_ALIGN' => 'L'];
                        $pdfTable->addRow($aRow0);

                    }

                    $pdfTable->close();

                    $this->pdf->Ln(1);

                    $pdfTable = new \PdfTable($this->pdf);
                    $pdfTable->initialize(
                        array(9.5, 9.5, 8.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $ausentes_pela_manha = $ordem - $manha;
                    $ausentes_pela_tarde = $ordem - $tarde;

                    $headerPdfTable = array();
                    $headerPdfTable[0] = array('TEXT' => utf8_decode('FREQUÊNCIA DA MANHÂ'));
                    $headerPdfTable[1] = array('TEXT' => utf8_decode('FREQUÊNCIA DA TARDE'));
                    $headerPdfTable[2] = array('TEXT' => 'TOTAL');
                    $pdfTable->addHeader($headerPdfTable);
                    $aRow[0] = array('TEXT' => $ausentes_pela_manha . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[1] = array('TEXT' =>  $ausentes_pela_tarde . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[2] = array('TEXT' =>  ($ausentes_pela_manha + $ausentes_pela_tarde) . ' ausentes', "TEXT_ALIGN" => "C");
                    $pdfTable->addRow($aRow);
                    $pdfTable->close();

                } else {
                    /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        array(27.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $aRow0[0] = array('TEXT' => $this->pdf->decode('NÃO EXISTEM RESULTADOS'),
                        'TEXT_SIZE' => 12,
                        'TEXT_ALIGN' => 'C',
                        'BORDER_TYPE' => 0);
                    $pdfTable->addRow($aRow0);

                    $pdfTable->close();
                }

                $this->pdf->finalizaPdf();


            } else if ($filtro['tipo'] == 'presenca_completo') {


                $dados = Frequencia::orderBy('aula_id')
                    ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                    ->where('aula_id', '=', $filtro['aula_id'])
                    ->orderBy('mdl_user.firstname', 'asc')
                    ->where('mdl_user.deleted', '=', '0')
                    ->where('presente_m', '=', 'S')
                    ->where('presente_t', '=', 'S')
                    ->get();
                $this->pdf->setTituloDoRelatorio(strtoupper('FREQUÊNCIA DA ' . $dados[0]->aula->role->name
                    . ' NO ' . $dados[0]->aula->course->fullname . ' em ' . $dados[0]->aula->data_aula));
                $this->pdf->iniciaPdf();


                $professor = Aula::join('mdl_user', 'mdl_user.id', '=', 'aulas.user_id')
                    ->where('aulas.id', '=', $filtro['aula_id'])
                    ->first();

                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    array(3, 8), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();
                $headerPdfTable[0] = array('TEXT' => 'FILTROS', 'COLSPAN' => 2);
                $pdfTable->addHeader($headerPdfTable);

                $aRow[0] = array('TEXT' => 'TIPO');
                $aRow[1] = array('TEXT' => utf8_decode('RELATÓRIO DE 100% PRESENÇA'));
                $pdfTable->addRow($aRow);
                $aRow[0] = array('TEXT' => 'PROFESSOR');
                $aRow[1] = array('TEXT' => $this->pdf->decode(mb_strtoupper($professor->firstname . ' ' . $professor->lastname)));
                $pdfTable->addRow($aRow);

                $pdfTable->close();
                $this->pdf->Ln(1);

                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );



                $manha = 0;
                $tarde = 0;
                if ($dados->count()) {

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => utf8_decode('MANHÂ')];
                    $headerPdfTable2[3] = ['TEXT' => 'TARDE'];
                    $headerPdfTable2[4] = ['TEXT' => 'TELEFONE'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    $ordem = 0;
                    foreach ($dados as $item) {

                        if ($item->presente_m == 'S')
                            $manha++;

                        if ($item->presente_t == 'S')
                            $tarde++;

                        $ordem++;

                        $aRow0 = [];
                        $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                        $aRow0[1] = ['TEXT' => utf8_decode($item->usuario->firstname) . ' ' . utf8_decode($item->usuario->lastname), 'TEXT_ALIGN' => 'L'];
                        $aRow0[2] = ['TEXT' => $item->presente_m == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[3] = ['TEXT' => $item->presente_t == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[4] = ['TEXT' => $item->phone1 . ' ' . $item->phone1, 'TEXT_ALIGN' => 'L'];
                        $aRow0[5] = ['TEXT' => $item->institution ? utf8_decode($item->institution) : '', 'TEXT_ALIGN' => 'L'];
                        $pdfTable->addRow($aRow0);

                    }

                    $pdfTable->close();

                    $this->pdf->Ln(1);

                    $pdfTable = new \PdfTable($this->pdf);
                    $pdfTable->initialize(
                        array(9.5, 9.5, 8.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $ausentes_pela_manha = $ordem - $manha;
                    $ausentes_pela_tarde = $ordem - $tarde;

                    $headerPdfTable = array();
                    $headerPdfTable[0] = array('TEXT' => utf8_decode('FREQUÊNCIA DA MANHÂ'));
                    $headerPdfTable[1] = array('TEXT' => utf8_decode('FREQUÊNCIA DA TARDE'));
                    $headerPdfTable[2] = array('TEXT' => 'TOTAL');
                    $pdfTable->addHeader($headerPdfTable);
                    $aRow[0] = array('TEXT' => $manha . ' presentes', "TEXT_ALIGN" => "C");
                    $aRow[1] = array('TEXT' => $tarde . ' presentes', "TEXT_ALIGN" => "C");
                    $aRow[2] = array('TEXT' => ($manha + $tarde) . ' presentes', "TEXT_ALIGN" => "C");
                    $pdfTable->addRow($aRow);
                    $pdfTable->close();

                } else {
                    /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        array(27.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $aRow0[0] = array('TEXT' => $this->pdf->decode('NÃO EXISTEM RESULTADOS'),
                        'TEXT_SIZE' => 12,
                        'TEXT_ALIGN' => 'C',
                        'BORDER_TYPE' => 0);
                    $pdfTable->addRow($aRow0);

                    $pdfTable->close();
                }

                $this->pdf->finalizaPdf();


            } else if ($filtro['tipo'] == 'presenca_meia') {


                $dados = Frequencia::orderBy('aula_id')
                    ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                    ->where('mdl_user.deleted', '=', '0')
                    ->where('aula_id', '=', $filtro['aula_id'])
                    ->orderBy('mdl_user.firstname', 'asc')
                    ->where(function($query)
                    {
                        $query->where('presente_m', '=', 'S')
                            ->orWhere('presente_t', '=', 'S');
                    })
                    ->get();
                $this->pdf->setTituloDoRelatorio(strtoupper('FREQUÊNCIA DA ' . $dados[0]->aula->role->name
                    . ' NO ' . $dados[0]->aula->course->fullname . ' em ' . $dados[0]->aula->data_aula));
                $this->pdf->iniciaPdf();

                $professor = Aula::join('mdl_user', 'mdl_user.id', '=', 'aulas.user_id')
                    ->where('aulas.id', '=', $filtro['aula_id'])
                    ->first();


                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    array(3, 8), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();
                $headerPdfTable[0] = array('TEXT' => 'FILTROS', 'COLSPAN' => 2);
                $pdfTable->addHeader($headerPdfTable);

                $aRow[0] = array('TEXT' => 'TIPO');
                $aRow[1] = array('TEXT' => utf8_decode('RELATÓRIO DE 50% PRESENÇA'));
                $pdfTable->addRow($aRow);
                $aRow[0] = array('TEXT' => 'PROFESSOR');
                $aRow[1] = array('TEXT' => $this->pdf->decode(mb_strtoupper($professor->firstname . ' ' . $professor->lastname)));
                $pdfTable->addRow($aRow);

                $pdfTable->close();
                $this->pdf->Ln(1);

                $pdfTable = new \PdfTable($this->pdf);

                $pdfTable->initialize(
                    [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );


                $manha = 0;
                $tarde = 0;
                if ($dados->count()) {

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => utf8_decode('MANHÂ')];
                    $headerPdfTable2[3] = ['TEXT' => 'TARDE'];
                    $headerPdfTable2[4] = ['TEXT' => 'TELEFONE'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    $ordem = 0;
                    foreach ($dados as $item) {

                        if ($item->presente_m == 'S')
                            $manha++;

                        if ($item->presente_t == 'S')
                            $tarde++;

                        $ordem++;

                        $aRow0 = [];
                        $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                        $aRow0[1] = ['TEXT' => utf8_decode($item->usuario->firstname) . ' ' . utf8_decode($item->usuario->lastname), 'TEXT_ALIGN' => 'L'];
                        $aRow0[2] = ['TEXT' => $item->presente_m == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[3] = ['TEXT' => $item->presente_t == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                        $aRow0[4] = ['TEXT' => $item->phone1 . ' ' . $item->phone1, 'TEXT_ALIGN' => 'L'];
                        $aRow0[5] = ['TEXT' => $item->institution ? utf8_decode($item->institution) : '', 'TEXT_ALIGN' => 'L'];
                        $pdfTable->addRow($aRow0);

                    }

                    $pdfTable->close();

                    $this->pdf->Ln(1);

                    $pdfTable = new \PdfTable($this->pdf);
                    $pdfTable->initialize(
                        array(9.5, 9.5, 8.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $ausentes_pela_manha = $ordem - $manha;
                    $ausentes_pela_tarde = $ordem - $tarde;

                    $headerPdfTable = array();
                    $headerPdfTable[0] = array('TEXT' => utf8_decode('FREQUÊNCIA DA MANHÂ'));
                    $headerPdfTable[1] = array('TEXT' => utf8_decode('FREQUÊNCIA DA TARDE'));
                    $headerPdfTable[2] = array('TEXT' => 'TOTAL');
                    $pdfTable->addHeader($headerPdfTable);
                    $aRow[0] = array('TEXT' => $manha . ' presentes / ' . $ausentes_pela_manha . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[1] = array('TEXT' => $tarde . ' presentes / ' . $ausentes_pela_tarde . ' ausentes', "TEXT_ALIGN" => "C");
                    $aRow[2] = array('TEXT' => ($manha + $tarde) . ' presentes / ' . ($ausentes_pela_manha + $ausentes_pela_tarde) . ' ausentes', "TEXT_ALIGN" => "C");
                    $pdfTable->addRow($aRow);
                    $pdfTable->close();

                } else {
                    /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        array(27.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $aRow0[0] = array('TEXT' => $this->pdf->decode('NÃO EXISTEM RESULTADOS'),
                        'TEXT_SIZE' => 12,
                        'TEXT_ALIGN' => 'C',
                        'BORDER_TYPE' => 0);
                    $pdfTable->addRow($aRow0);

                    $pdfTable->close();
                }

                $this->pdf->finalizaPdf();


            }


        } else {
            throw new \Exception('ArrayNotFoundInMethod');
        }
    }
}