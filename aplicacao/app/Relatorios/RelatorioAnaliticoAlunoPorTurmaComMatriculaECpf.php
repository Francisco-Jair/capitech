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

class RelatorioAnaliticoAlunoPorTurmaComMatriculaECpf implements IRelatorio
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
                        [1.5, 7, 3, 2.5, 8.5, 5], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
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
                    $headerPdfTable2[2] = ['TEXT' => 'LOGIN E SENHA INICIAL IGUAL AO CPF'];
                    $headerPdfTable2[3] = ['TEXT' => $this->pdf->decode('MATRÍCULA')];
                    $headerPdfTable2[4] = ['TEXT' => $this->pdf->decode('INSTITUIÇÃO')];
                    $headerPdfTable2[5] = ['TEXT' => $this->pdf->decode('AUTORIZAÇÃO PELA SEMEDUC DE ACORDO COM CONTRATO E PROCESSO Nº 5928/2016 E DATA 25/10/2016')];
                    $pdfTable->addHeader($headerPdfTable2);


                    $alunos = Matricula::where('role_id', '=', $item->id)->where('archetype', '=', 'student')->orderBy('firstname')->groupBy('user_id')->get();

                    if ($alunos->count()) {
                        $ordem = 0;
                        foreach ($alunos as $aluno) {
                            $ordem++;
                            $aRow0 = [];

                            $cpf_list = str_split($aluno->username);
                            $cpf = $cpf_list[0].$cpf_list[1].$cpf_list[2].'.'.$cpf_list[3].$cpf_list[4].$cpf_list[5].'.'.$cpf_list[6].$cpf_list[7].$cpf_list[8].'-'.$cpf_list[9].$cpf_list[10];

                            $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                            $aRow0[1] = ['TEXT' => utf8_decode($aluno->firstname) . ' ' . utf8_decode($aluno->lastname)];
                            $aRow0[2] = ['TEXT' => $cpf, 'TEXT_ALIGN' => 'L'];
                            $aRow0[3] = ['TEXT' =>  $aluno->user_id, 'TEXT_ALIGN' => 'L'];
                            $aRow0[4] = ['TEXT' =>  $this->pdf->decode($aluno->institution), 'TEXT_ALIGN' => 'L'];
                            $aRow0[5] = ['TEXT' =>  '', 'TEXT_ALIGN' => 'L'];

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