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
use App\Models\Frequencia;
use App\Models\Matricula;
use App\Models\Modalidade;
use App\Models\Processo;
use App\Models\Role;
use App\Models\Solicitante;

class RelatorioAnaliticoFaltosos implements IRelatorio
{
	private $pdf;

	public function __construct()
	{
		$this->pdf = new RelatorioBaseFPDF('L');
	}

	public function processaRelatorio($filtro)
	{

		if (is_array($filtro)) {

            $this->pdf->setTituloDoRelatorio('Relação de faltas por aulas');

            $dados = Frequencia::select("aula_id")->distinct()->get();

            $qtd_faltantes = Frequencia::where('presente_m' , '=', 'N')->where('presente_t' , '=', 'N')
                ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                ->where('mdl_user.deleted', '=', 0)
                ->groupBy('user_id')->get();

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            $qtd_falta = 0;

            if ($dados->count()) {

                 foreach ($dados as $item) {


                    $pdfTable->initialize(
                        [1.5, 7, 5, 3, 4, 7], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
                    );

                    $headerPdfTable1 = [];
                    $headerPdfTable1[0] = ['TEXT' => $this->pdf->decode(mb_strtoupper('FREQUÊNCIA DA  ' . $dados[0]->aula->role->name . ' no ' .$item->aula->course->fullname) . ' - ' .$item->aula->data_aula ), 'COLSPAN' => 8];
                    $pdfTable->addHeader($headerPdfTable1);

                    $headerPdfTable3 = [];
                    $headerPdfTable3[0] = ['TEXT' => 'PROF:'];
                    $headerPdfTable3[1] = ['TEXT' => $this->pdf->decode(mb_strtoupper($item->aula->user->firstname . ' ' .$item->aula->user->lastname )) , 'COLSPAN' => 8];
                    $pdfTable->addHeader($headerPdfTable3);


                    $frequencias = Frequencia::orderBy('aula_id')
                        ->join('mdl_user', 'mdl_user.id', '=', 'frequencias.user_id')
                        ->where('aula_id', '=', $item['aula_id'])
                        ->orderBy('mdl_user.firstname', 'asc')
                        ->where('mdl_user.deleted', '=', '0')
                        ->where('presente_m', '=', 'N')
                        ->where('presente_t', '=', 'N')
                        ->get();


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

            $pdfTable->close();

            $this->pdf->Ln(1);

            $pdfTable = new \PdfTable($this->pdf);
            $pdfTable->initialize(
                array(9.5), $this->pdf->getConfiguracaoPadraoPdfAdvanced()
            );


            $headerPdfTable = array();
            $headerPdfTable[0] = array('TEXT' => utf8_decode('QUANTIDADE DE FALTANTES'));

            $pdfTable->addHeader($headerPdfTable);
            $aRow[0] = array('TEXT' => count($qtd_faltantes) . ' alunos', "TEXT_ALIGN" => "C");

            $pdfTable->addRow($aRow);
            $pdfTable->close();

            $this->pdf->finalizaPdf();


		} else {
			throw new \Exception('ArrayNotFoundInMethod');
		}
	}
}