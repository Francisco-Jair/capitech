<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:54
 */

namespace App\Relatorios;

use App\Models\Aluno;
use App\Models\Matricula;
use App\Models\Role;
use App\Models\SmsMensagemLote;
use App\Models\SmsMensagemLoteNumero;

class RelatorioAnaliticoSmsEnviado implements IRelatorio
{
    private $pdf;

    public function __construct()
    {
        $this->pdf = new RelatorioBaseFPDF('P');
    }

    public function processaRelatorio($filtro)
    {

        if (is_array($filtro)) {
            $smsEnviado = SmsMensagemLote::where('id', $filtro['id'])->get();

            $destinatarios = SmsMensagemLoteNumero::select('mdl_user.firstname', 'mdl_user.lastname', 'sms_mensagem_lote_numeros.numero', 'mdl_user.username')
                ->join('mdl_user', 'mdl_user.id', '=', 'sms_mensagem_lote_numeros.user_id')
                ->where('sms_mensagem_lote_numeros.sms_mensagem_lote_id', '=', $filtro['id'])
                ->orderBy('mdl_user.firstname')
                ->get();

            $this->pdf->setTituloDoRelatorio('Relação de destinatários');

            $this->pdf->iniciaPdf();

            $pdfTable = new \PdfTable($this->pdf);

            $pdfTable->initialize(
                [18.5], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
            );
            $headerPdfTable1 = [];
            $headerPdfTable1[0] = ['TEXT' => 'MENSAGEM'];
            $pdfTable->addHeader($headerPdfTable1);
            $aRow0 = [];
            $aRow0[0] = ['TEXT' => $smsEnviado[0]['mensagem'], 'TEXT_ALIGN' => 'C'];
            $pdfTable->addRow($aRow0);

            $pdfTable->close();

            $this->pdf->Ln(2);



            $pdfTable->initialize(
                [1.5, 7, 6, 3.8], $this->pdf->getConfiguracaoPadraoPdfAdvanced()
            );

            $headerPdfTable2 = [];
            $headerPdfTable2[0] = ['TEXT' => 'ORDEM'];
            $headerPdfTable2[1] = ['TEXT' => 'NOME'];
            $headerPdfTable2[2] = ['TEXT' => 'USERNAME'];
            $headerPdfTable2[3] = ['TEXT' => 'TELEFONE'];
            $pdfTable->addHeader($headerPdfTable2);

            $ordem = 0;

            if ($destinatarios->count()) {
                foreach ($destinatarios as $item) {

                    $ordem++;
                    $aRow0 = [];

                    $aRow0[0] = ['TEXT' => $ordem, 'TEXT_ALIGN' => 'C'];
                    $aRow0[1] = ['TEXT' => utf8_decode($item->firstname) . ' ' . utf8_decode($item->lastname)];
                    $aRow0[2] = ['TEXT' => $item->username, 'TEXT_ALIGN' => 'L'];
                    $aRow0[3] = ['TEXT' => $item->numero, 'TEXT_ALIGN' => 'L'];

                    $pdfTable->addRow($aRow0);

                    $pdfTable->close();

                    $this->pdf->Ln(2);
                }
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