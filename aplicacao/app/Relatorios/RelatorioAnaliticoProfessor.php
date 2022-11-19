<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:54
 */

namespace App\Relatorios;

use App\Models\Course;
use App\Models\Departamento;
use App\Models\Matricula;
use App\Models\Modalidade;
use App\Models\Processo;
use App\Models\Solicitante;

class RelatorioAnaliticoProfessor implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $dados = Matricula::
                where('archetype', '=', 'editingteacher')
                ->orderBy('course', 'asc')
                ->get();

            $this->pdf->setTituloDoRelatorio('Relação de Professores');



            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            if ($dados->count()) {


                $pdfTable->initialize(
                    [1.5, 9, 7, 7, 3], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);



                $headerPdfTable2 = [];
                $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                $headerPdfTable2[1] = ['TEXT' => 'CURSO'];
                $headerPdfTable2[2] = ['TEXT' => 'NOME'];
                $headerPdfTable2[3] = ['TEXT' => 'EMAIL'];
                $headerPdfTable2[4] = ['TEXT' => 'LOGIN'];
                $pdfTable->addHeader($headerPdfTable2);


                $ordem = 0;
                foreach ($dados as $item) {
                    $ordem++;

                            $aRow0 = [];

                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                            $aRow0[1] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->course))];
                            $aRow0[2] = ['TEXT' => utf8_decode($item->firstname) . ' ' . utf8_decode($item->lastname)];
                            $aRow0[3] = ['TEXT' => $item->email, 'TEXT_ALIGN' => 'L'];
                            $aRow0[4] = ['TEXT' => $item->username, 'TEXT_ALIGN' => 'L'];


                            $pdfTable->addRow($aRow0);

                }


                $pdfTable->close();

                $this->pdf->Ln(2);


                $ordem = 0;
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