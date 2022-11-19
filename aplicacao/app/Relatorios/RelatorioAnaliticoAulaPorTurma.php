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
use App\Models\Matricula;
use App\Models\Modalidade;
use App\Models\Processo;
use App\Models\Solicitante;

class RelatorioAnaliticoAulaPorTurma implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('P');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $dados = Matricula::orderBy('course', 'asc')
                ->where('archetype', '=', 'editingteacher' )
                ->get();

            $this->pdf->setTituloDoRelatorio('Relação de aulas');

//            else {
//                $dados = Departamento::orderBy('departamento', 'asc')
//                    ->where('id', '=', (int)$filtro['departamento_id'])
//                    ->orderBy('nome_fantasia', 'asc')
//                    ->get();
//
//                $this->pdf->setTituloDoRelatorio('Relação de processos por setor: ' . $dados[0]->departamento);
//            }


            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            if ($dados->count()) {
                foreach ($dados as $item) {


                    /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        [1.5, 9, 7.8], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                    $headerPdfTable1 = [];
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->course)), 'COLSPAN' => 8];

                    $pdfTable->addHeader($headerPdfTable1);

                    $headerPdfTable3 = [];
                    $headerPdfTable3[0] = ['TEXT' => 'PROF:'];
                    $headerPdfTable3[1] = ['TEXT' => utf8_decode($item->firstname . ' ' . $item->lastname) , 'COLSPAN' => 8];
                    $pdfTable->addHeader($headerPdfTable3);



                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'TURMA'];
                    $headerPdfTable2[2] = ['TEXT' => 'DATA DA AULA'];
                    $pdfTable->addHeader($headerPdfTable2);

                    $aulas = Aula::where('course_id', '=', $item->course_id)->get();

                    if ($aulas->count()) {
                        $ordem = 0;
                        foreach ($aulas as $aula) {
                            $ordem++;
                            $aRow0 = [];

                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                            $aRow0[1] = ['TEXT' => utf8_decode($aula->role->name), 'TEXT_ALIGN' => 'L'];

                            $aRow0[2] = ['TEXT' =>  $aula ->data_aula, 'TEXT_ALIGN' => 'L'];

                            $pdfTable->addRow($aRow0);
                        }
                    } else {
                        $aRow2 = [];
                        $aRow2[0] = ['TEXT' => $this->pdf->decode('Sem aulas nessa turma'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                        $pdfTable->addRow($aRow2);
                    }
                    /*$aRow2 = [];
                    $aRow2[0] = ['TEXT' => $this->pdf->decode('Solicitante sem processos lançados'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                    $pdfTable->addRow($aRow2);*/
                    $pdfTable->close();

                    $this->pdf->Ln(2);
                }
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