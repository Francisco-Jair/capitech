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
use App\Models\Role;
use App\Models\Solicitante;

class RelatorioAnaliticoAluno implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('L');
    }

    public function processaRelatorio($filtro)
    {


        if (is_array($filtro)) {



            $dados = Matricula::orderBy('firstname', 'asc')
                ->orderBy('firstname', 'asc')
                ->where('archetype', '=', 'student')
                ->groupBy('user_id');

            $complemento = null;

            if (isset($filtro['turma']) && !empty($filtro['turma'])) {


                $dados->where('role_id', '=', $filtro['turma']);
                $turma = Role::where('id', '=', $filtro['turma'])->first();
                $complemento = ' - ' . $turma->name;

                if (!isset($filtro['aula']) && empty($filtro['aula'])) {
                    $this->pdf->setTituloDoRelatorio('Relação de Alunos' . $complemento);
                }


            }


            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            $dados = $dados->get();

            if (isset($filtro['aula']) && !empty($filtro['aula'])) {
                $this->pdf->setTituloDoRelatorio('');
                $aula = Aula::find($filtro['aula']);

                $pdfTable->initialize(
                    [27], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );
                $aRow0[0] = ['TEXT' => utf8_decode("CURSO: EDUCAÇÃO INFANTIL: Desafios Curriculares e Uso de Tecnologias"), 'TEXT_ALIGN' => 'L', 'TEXT_SIZE' => 11,
                    'BORDER_TYPE' => 0];
                $pdfTable->addRow($aRow0);

                $aRow0[0] = ['TEXT' => utf8_decode("FOLHA DE FREQUÊNCIA: " . $aula->role->name . " - DIA: " . $aula->data_aula . " - TURNO: ( ) MATUTINO ( ) VESPERTINO"), 'TEXT_ALIGN' => 'L', 'TEXT_SIZE' => 11,
                    'BORDER_TYPE' => 0];
                $pdfTable->addRow($aRow0);

                $aRow0[0] = ['TEXT' => utf8_decode("PROFESSORA: " . $aula->user->firstname . ' ' . $aula->user->lastname), 'TEXT_ALIGN' => 'L', 'TEXT_SIZE' => 11,
                    'BORDER_TYPE' => 0];
                $pdfTable->addRow($aRow0);
                $aRow0[0] = ['TEXT' => utf8_decode("Relação de Alunos: " . $aula->role->name), 'TEXT_ALIGN' => 'C', 'TEXT_SIZE' => 14,
                    'BORDER_TYPE' => 0];

                $pdfTable->addRow($aRow0);

                $pdfTable->close();

                $this->pdf->Ln(1);

            }



            if ($dados->count()) {

                $pdfTable->initialize(
                    [1.5, 6, 7, 3, 10], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                );

                //$this->pdf->Cell(0,0.4,$this->pdf->decode(mb_strtoupper($item->nome . $item->nome_fantasia)),0,1);

                $headerPdfTable2 = [];
                $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
                $headerPdfTable2[1] = ['TEXT' => 'NOME'];
                $headerPdfTable2[2] = ['TEXT' => 'EMAIL'];
                $headerPdfTable2[3] = ['TEXT' => 'LOGIN'];
                $headerPdfTable2[4] = ['TEXT' => 'ASSINATURA'];
                $pdfTable->addHeader($headerPdfTable2);

                $ordem = 0;
                foreach ($dados as $item) {
                    $ordem++;

                    $aRow0 = [];
                    $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                    $aRow0[1] = ['TEXT' => utf8_decode($item->firstname) . ' ' . utf8_decode($item->lastname)];
                    $aRow0[2] = ['TEXT' => $item->email];
                    $aRow0[3] = ['TEXT' => $item->username, 'TEXT_ALIGN' => 'l'];
                    $aRow0[4] = ['TEXT' => "", 'TEXT_ALIGN' => 'C'];

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