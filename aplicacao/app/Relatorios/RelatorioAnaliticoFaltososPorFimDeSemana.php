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

class RelatorioAnaliticoFaltososPorFimDeSemana implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $dados = Frequencia::select(\DB::raw('count(frequencias.id) as qtd_frequencia, frequencias.*'))
                ->join('aulas', 'aulas.id', '=', 'frequencias.aula_id')
                ->join('mdl_user', 'frequencias.user_id', '=', 'mdl_user.id')
                ->where('presente_m', '=', 'N')
                ->where('presente_t', '=', 'N')
                ->where('aulas.data_aula', '>=', '2016-11-12')
                ->where('aulas.data_aula', '<=', '2016-11-13')
                ->where('mdl_user.deleted', '=', '0')
                ->groupBy('frequencias.user_id')

                ->orderBy('mdl_user.firstname', 'asc')
                ->get();

            $this->pdf->setTituloDoRelatorio(strtoupper('RELATÓRIO DE QUEM NÃO COMPARECEU NOS DIAS 12/11 E 13/11'));
            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            $pdfTable->initialize(
                [1.5, 11, 5,  10], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
            );

            $manha = 0;
            $tarde = 0;
            if ($dados->count()) {


                //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                $headerPdfTable2 = [];
                $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                $headerPdfTable2[2] = ['TEXT' => 'TELEFONE'];
                $headerPdfTable2[3] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                $pdfTable->addHeader($headerPdfTable2);

                $ordem = 0;
                foreach ($dados as $item) {
                    if($item->qtd_frequencia <= 1 )
                        continue;
                    $ordem++;

                    $aRow0 = [];
                    $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];

                    $aRow0[1] = ['TEXT' => utf8_decode($item->usuario->firstname) . ' ' . utf8_decode($item->usuario->lastname), 'TEXT_ALIGN' => 'L'];

                    $aRow0[2] = ['TEXT' => $item->usuario->phone1 . ' ' . $item->usuario->phone1, 'TEXT_ALIGN' => 'L'];
                    $aRow0[3] = ['TEXT' => $item->usuario->institution ? utf8_decode($item->usuario->institution) : '', 'TEXT_ALIGN' => 'L'];
                    $pdfTable->addRow($aRow0);

                }

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