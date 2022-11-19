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

class RelatorioAnaliticoCalendarioProfessor implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('P');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {

            $data = $_GET['data'];
            $dia = substr($data, 0, 2);
            $mes = substr($data, 3, 2);
            $ano = substr($data, 6, 4);
            $data = $ano . '-' . $mes . '-' . $dia;

            $dados = Aula::select('user_id', 'role_id')->whereRaw("aulas.data_aula = '" . $data . "'")->orderBy('id', 'asc')->get();

            $this->pdf->setTituloDoRelatorio('Calendário da aula do dia ' . $_GET['data']);

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);


            $pdfTable->initialize(
                [1.5, 6.8, 10], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
            );

            $headerPdfTable2 = [];
            $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
            $headerPdfTable2[1] = ['TEXT' => 'PROFESSOR'];
            $headerPdfTable2[2] = ['TEXT' => 'TURMA'];
            $pdfTable->addHeader($headerPdfTable2);


            if ($dados->count()) {

                $ordem = 0;

                foreach ($dados as $res) {

                    $ordem++;
                    $aRow0 = [];

                    $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                    $aRow0[1] = ['TEXT' => utf8_decode($res->user->firstname . ' ' .$res->user->firstname)];
                    $aRow0[2] = ['TEXT' => utf8_decode($res->role->name), 'TEXT_ALIGN' => 'L'];

                    $pdfTable->addRow($aRow0);
                }

            }

            $pdfTable->close();

            $this->pdf->finalizaPdf();
        } else {
            throw new \Exception('ArrayNotFoundInMethod');
        }
    }
}