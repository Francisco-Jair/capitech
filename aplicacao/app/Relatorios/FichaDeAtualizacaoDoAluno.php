<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:54
 */

namespace App\Relatorios;

define('FPDF_FONTPATH', __DIR__ . '/FpdfFont/');
use fpdf\FPDF;

class FichaDeAtualizacaoDoAluno extends FPDF
{
    private $orientacao;

    function __construct($orientation = 'P', $size = 'A4')
    {
        parent::__construct($orientation, 'cm', $size);
        $this->orientacao = $orientation;
    }

    public function processaRelatorio()
    {
        $this->iniciaPdf();
        $this->Image(__DIR__ . "/../../public/admin/imagens/ficha_atualizacao.jpg", 0, 0, 21);

        $pdfTable = new \PdfTable($this);
        $pdfTable->initialize([19]);

        $this->finalizaPdf();
        exit;
    }

    public function iniciaPdf()
    {
        $this->SetAutoPageBreak(true, 2);
        $this->SetMargins(0, 0);
        $this->SetCompression('gzcompress');

        $this->AliasNbPages();
        $this->AddPage();
        $this->SetFont('Helvetica');
        $this->SetFontSize(8);

    }

    public function finalizaPdf()
    {
        $this->Output();
        exit;
    }
}