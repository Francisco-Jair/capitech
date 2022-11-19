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
use App\Models\Role;
use App\Models\Solicitante;
use Carbon;

class RelatorioAnaliticoAlunoPresentePorDia implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {

        if (!empty($_GET)) {

            $dataInicial = $_GET['data_inicio'];
            $dataFinal = $_GET['data_termino'];
            $tipoPresente = $_GET['tipo_presenca'];

            $dia = substr($dataInicial, 0, 2);
            $mes = substr($dataInicial, 3, 2);
            $ano = substr($dataInicial, 6, 4);
            $dataInicial = $ano . '-' . $mes . '-' . $dia;

            $dia = substr($dataFinal, 0, 2);
            $mes = substr($dataFinal, 3, 2);
            $ano = substr($dataFinal, 6, 4);
            $dataFinal = $ano . '-' . $mes . '-' . $dia;

            $dados = Aula::whereRaw("aulas.data_aula >='" . $dataInicial . "'")
                ->whereRaw("aulas.data_aula <='" . $dataFinal . "'")->orderBy('id', 'asc')->get();

            if ($tipoPresente != 'presenca_completa') {

                $qtd_faltantes = Frequencia::where(function ($query) {
                    $query->where('presente_m', '=', 'S')
                        ->orWhere('presente_t', '=', 'S');
                });

            } else {

                $qtd_faltantes = Frequencia::where('presente_m', '=', 'S')
                    ->where('presente_t', '=', 'S');

            }

            $qtd_faltantes = $qtd_faltantes->join('aulas', 'aulas.id', '=', 'frequencias.aula_id')
                ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                ->where('mdl_user.deleted', '=', '0')
                ->whereRaw("aulas.data_aula >='" . $dataInicial . "'")
                ->whereRaw("aulas.data_aula <='" . $dataFinal . "'")
                ->groupBy('mdl_user.id')
                ->withTrashed()
                ->get();

            $this->pdf->setTituloDoRelatorio(mb_strtoupper('Relação de presenças entre ' . $_GET['data_inicio'] . ' e ' . $_GET['data_termino'] . ' ordenado por aulas'));

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            $manha = 0;
            $tarde = 0;

            if ($dados->count()) {
                $order = 0;
                foreach ($dados as $item) {
                    $pdfTable->initialize(
                        [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $headerPdfTable1 = [];
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper( 'FREQUÊNCIA DA  ' . $item->role->name . ' no ' . $item->course->fullname) . ' - ' . $item->data_aula), 'COLSPAN' => 8];
                    $pdfTable->addHeader($headerPdfTable1);

                    $headerPdfTable3 = [];
                    $headerPdfTable3[0] = ['TEXT' => 'PROF:'];
                    $headerPdfTable3[1] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->user->firstname . ' ' . $item->user->lastname)), 'COLSPAN' => 8];
                    $pdfTable->addHeader($headerPdfTable3);

                    if ($tipoPresente != 'presenca_completa') {

                        $frequencias = Frequencia::where(function ($query) {
                            $query->where('presente_m', '=', 'S')
                                ->orWhere('presente_t', '=', 'S');
                        });

                    } else {

                        $frequencias = Frequencia::where('presente_m', '=', 'S')
                            ->where('presente_t', '=', 'S');
                    }

                    $frequencias = $frequencias->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                        ->where('mdl_user.deleted', '=', '0')
                        ->where('frequencias.aula_id', '=', $item->id)
                        ->orderBy('mdl_user.firstname', 'asc')->get();

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => utf8_decode('MANHÂ')];
                    $headerPdfTable2[3] = ['TEXT' => 'TARDE'];
                    $headerPdfTable2[4] = ['TEXT' => 'TELEFONE'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    if ($frequencias->count()) {

                        $ordem = 0;

                        foreach ($frequencias as $frequencia) {

                            if ($frequencia->presente_m == 'S')
                                $manha++;

                            if ($frequencia->presente_t == 'S')
                                $tarde++;

                            $ordem++;

                            $aRow0 = [];
                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                            $aRow0[1] = ['TEXT' => utf8_decode($frequencia->usuario->firstname) . ' ' . utf8_decode($frequencia->usuario->lastname), 'TEXT_ALIGN' => 'L'];
                            $aRow0[2] = ['TEXT' => $frequencia->presente_m == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                            $aRow0[3] = ['TEXT' => $frequencia->presente_t == 'S' ? 'FREQUENTE' : 'AUSENTE', 'TEXT_ALIGN' => 'L'];
                            $aRow0[4] = ['TEXT' => $frequencia->phone1 . ' ' . $frequencia->phone1, 'TEXT_ALIGN' => 'L'];
                            $aRow0[5] = ['TEXT' => $frequencia->usuario->institution ? utf8_decode($frequencia->usuario->institution) : '', 'TEXT_ALIGN' => 'L'];
                            $pdfTable->addRow($aRow0);
                        }
                    } else {
                        $aRow2 = [];
                        $aRow2[0] = ['TEXT' => $this->pdf->decode('Sem faltantes nessa aula'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                        $pdfTable->addRow($aRow2);
                    }

                    $pdfTable->close();
                    $this->pdf->Ln(2);
                }

                $this->pdf->Ln(1);

                $pdfTable->initialize(
                    array(6.5, 6.5, 3), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();
                $headerPdfTable[0] = array('TEXT' => utf8_decode('QUANTIDADE DE PRESENÇAS PELA MANHÃ'));
                $headerPdfTable[1] = array('TEXT' => utf8_decode('QUANTIDADE DE PRESENÇAS PELA TARDE'));
                $headerPdfTable[2] = array('TEXT' => utf8_decode('TOTAL PRESENÇAS'));

                $pdfTable->addHeader($headerPdfTable);
                $aRow[0] = array('TEXT' => utf8_decode($manha . ' presenças'), "TEXT_ALIGN" => "C");
                $aRow[1] = array('TEXT' => utf8_decode($tarde . ' presenças'), "TEXT_ALIGN" => "C");
                $aRow[2] = array('TEXT' => utf8_decode($manha + $tarde . ' presenças'), "TEXT_ALIGN" => "C");

                $pdfTable->addRow($aRow);
                $pdfTable->close();

                $this->pdf->Ln(1);

                $pdfTable->initialize(
                    array(16), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                $headerPdfTable = array();

                if ($tipoPresente != 'presenca_completa') {

                    $headerPdfTable[0] = array('TEXT' => utf8_decode('QUANTIDADE DE PRESENTES ( frequentaram pelo menos uma vez )'));

                } else {

                    $headerPdfTable[0] = array('TEXT' => utf8_decode('QUANTIDADE DE PRESENTES ( frequentaram os dois horários )'));
                }

                $pdfTable->addHeader($headerPdfTable);
                $aRow[0] = array('TEXT' => count($qtd_faltantes) . ' alunos', "TEXT_ALIGN" => "C");

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

        } else {
            throw new \Exception('ArrayNotFoundInMethod');
        }
    }
}