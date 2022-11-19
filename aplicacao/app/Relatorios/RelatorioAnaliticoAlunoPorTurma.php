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

class RelatorioAnaliticoAlunoPorTurma implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('P');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $dados = Role::where('archetype','=','student')
                ->where('name', 'like', '%Turma%');

            if(isset($filtro['turma']) && !empty($filtro['turma'])){
                $dados->where('id', '=', $filtro['turma']);
            }
            $dados = $dados->get();

            $this->pdf->setTituloDoRelatorio('Relação de alunos por turma');

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
                $quantidadeTotalDeAlunos = 0;
                foreach ($dados as $item) {

                          /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        [1.5, 7, 6, 3.8], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);



                    $headerPdfTable1 = [];
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->name)), 'COLSPAN' => 8];

                    $pdfTable->addHeader($headerPdfTable1);

//                    $headerPdfTable3 = [];
//                    $headerPdfTable3[0] = ['TEXT' => 'PROF:'];
//                    $headerPdfTable3[1] = ['TEXT' => utf8_decode($item->firstname) . ' ' . utf8_decode($item->lastname), 'COLSPAN' => 8];
//                    $pdfTable->addHeader($headerPdfTable3);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => 'EMAIL'];
                    $headerPdfTable2[3] = ['TEXT' => 'LOGIN'];
                    $pdfTable->addHeader($headerPdfTable2);


                    $alunos = Matricula::where('role_id', '=', $item->id)->where('archetype', '=', 'student')->orderBy('firstname')->groupBy('user_id')->get();

                    if ($alunos->count()) {
                        $ordem = 0;
                        foreach ($alunos as $aluno) {
                            $ordem++;
                            $aRow0 = [];

                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                            $aRow0[1] = ['TEXT' => utf8_decode($aluno->firstname) . ' ' . utf8_decode($aluno->lastname)];
                            $aRow0[2] = ['TEXT' => $aluno->email, 'TEXT_ALIGN' => 'L'];
                            $aRow0[3] = ['TEXT' =>  $aluno->username, 'TEXT_ALIGN' => 'L'];

                            $pdfTable->addRow($aRow0);
                        }
                    } else {
                        $aRow2 = [];
                        $aRow2[0] = ['TEXT' => $this->pdf->decode('Sem alunos nessa turma'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                        $pdfTable->addRow($aRow2);
                    }
                    /*$aRow2 = [];
                    $aRow2[0] = ['TEXT' => $this->pdf->decode('Solicitante sem processos lançados'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                    $pdfTable->addRow($aRow2);*/
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