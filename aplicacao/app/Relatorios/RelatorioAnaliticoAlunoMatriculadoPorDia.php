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
use App\Models\Role;
use App\Models\Solicitante;
use Carbon;

class RelatorioAnaliticoAlunoMatriculadoPorDia implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {
        if (is_array($filtro)) {

            $dados = Role::where('archetype','=','student')
                ->where('name', 'like', '%Turma%');

            $dataInicial = $_GET['data_inicio'];
            $dataFinal = $_GET['data_termino'];

            $dados = $dados->get();
            $this->pdf->setTituloDoRelatorio('Relação de matriculados entre ' . $dataInicial. ' - ' . $dataFinal);

            $dia = substr($dataInicial, 0, 2);
            $mes = substr($dataInicial, 3, 2);
            $ano = substr($dataInicial, 6, 4);
            $dataInicial = $ano.'-'.$mes.'-'.$dia;


            $dia = substr($dataFinal, 0, 2);
            $mes = substr($dataFinal, 3, 2);
            $ano = substr($dataFinal, 6, 4);
            $dataFinal = $ano.'-'.$mes.'-'.$dia;

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            if ($dados->count()) {
                $quantidadeTotalDeAlunos = 0;
                foreach ($dados as $item) {

                          /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        [1.5, 7, 6, 3, 2.5, 7.5], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);



                    $headerPdfTable1 = [];
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->name)), 'COLSPAN' => 8];

                    $pdfTable->addHeader($headerPdfTable1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => 'EMAIL'];
                    $headerPdfTable2[3] = ['TEXT' => 'CELULAR'];
                    $headerPdfTable2[4] = ['TEXT' => 'LOGIN'];
                    $headerPdfTable2[5] = ['TEXT' => utf8_decode('INSTITUIÇÃO')];
                    $pdfTable->addHeader($headerPdfTable2);

                    $alunos = Matricula::whereRaw("created_at >='".$dataInicial."'")
                        ->whereRaw("created_at <='".$dataFinal."'")
                        ->where('role_id', '=', $item->id)
                        ->orderBy('firstname')
                        ->groupBy('user_id')
                        ->get();

                    if ($alunos->count()) {
                        $ordem = 0;
                        foreach ($alunos as $aluno) {
                            $ordem++;
                            $aRow0 = [];

                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                            $aRow0[1] = ['TEXT' => utf8_decode($aluno->firstname) . ' ' . utf8_decode($aluno->lastname)];
                            $aRow0[2] = ['TEXT' => $aluno->email, 'TEXT_ALIGN' => 'L'];
                            $aRow0[3] = ['TEXT' =>  $aluno->phone2, 'TEXT_ALIGN' => 'L'];
                            $aRow0[4] = ['TEXT' =>  $aluno->username, 'TEXT_ALIGN' => 'L'];
                            $aRow0[5] = ['TEXT' =>  utf8_decode($aluno->institution), 'TEXT_ALIGN' => 'L'];

                            $pdfTable->addRow($aRow0);
                        }
                    } else {
                        $ordem = 0;
                        $aRow2 = [];
                        $aRow2[0] = ['TEXT' => $this->pdf->decode('Sem alunos nessa turma'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                        $pdfTable->addRow($aRow2);
                    }

                    $pdfTable->close();

                    $this->pdf->Ln(2);

                    $quantidadeTotalDeAlunos += $ordem;
                }

                $pdfTable->initialize(
                    array(8.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );
                $headerPdfTable1 = [];
                $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode('Quantidade total de alunos'), 'COLSPAN' => 1];
                $pdfTable->addHeader($headerPdfTable1);
                $aRow0 = [];

                $aRow0[0] = ['TEXT' => $quantidadeTotalDeAlunos, 'TEXT_ALIGN' => 'C'];
                $pdfTable->addRow($aRow0);

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