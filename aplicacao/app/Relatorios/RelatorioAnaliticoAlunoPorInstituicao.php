<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:54
 */

namespace App\Relatorios;

use App\Models\Matricula;
use App\Models\Aluno;

class RelatorioAnaliticoAlunoPorInstituicao implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('P');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $dados = Aluno::select('firstname', 'lastname', 'email', 'username', 'institution')
                    ->distinct()
                    ->orderBy('institution', 'asc')
                    ->orderBy('nome', 'asc');

            if(isset($filtro['instituicao'])) {
                if(empty($filtro['instituicao'])){
                    $dados->where('institution', '=', '');
                } else {
                    $dados->where('institution', '=', $filtro['instituicao']);
                }
            }
            $dados = $dados->get();

            $resultado = array();
            foreach($dados as $aluno)
            {
                $resultado[$aluno->institution][] = $aluno;
            }

            $dados = $resultado;

            $this->pdf->setTituloDoRelatorio('Relação de alunos por instituição');

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            if (!empty($dados)) {
                $quantidadeTotalDeAlunos = 0;
                foreach ($dados as $key => $item) {

                          /*
                     * 210 × 297
                     * Para o Formato "P" a soma deve ser de 19 cm
                     * Para o Formato "L" a soma deve ser de 27.5 cm
                     * */
                    $pdfTable->initialize(
                        [1.5, 7, 6, 3.8], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $headerPdfTable1 = [];
                    $local = !empty($key) ? $key : 'NÃO LOCALIZADOS';
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper($local)), 'COLSPAN' => 8];

                    $pdfTable->addHeader($headerPdfTable1);

                    $headerPdfTable2 = [];
                    $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                    $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                    $headerPdfTable2[2] = ['TEXT' => 'EMAIL'];
                    $headerPdfTable2[3] = ['TEXT' => 'LOGIN'];
                    $pdfTable->addHeader($headerPdfTable2);

                    if (!empty($item)) {
                        $ordem = 0;
                        foreach ($item as $aluno) {
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
                        $aRow2[0] = ['TEXT' => $this->pdf->decode('Sem alunos nessa instituição'), 'COLSPAN' => 8, 'TEXT_ALIGN' => 'C'];
                        $pdfTable->addRow($aRow2);
                    }

                    $pdfTable->close();

                    $this->pdf->Ln(1.2);

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