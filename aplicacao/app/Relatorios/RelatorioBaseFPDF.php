<?php
/**
 * Created by PhpStorm.
 * User: rupertlustosa
 * Date: 15/04/15
 * Time: 22:36
 */

namespace App\Relatorios;

define('FPDF_FONTPATH', __DIR__ . '/FpdfFont/');
use fpdf\FPDF;

class RelatorioBaseFPDF extends FPDF
{

    /**
     * @var string
     */
    private $orientacao;
    private $tituloDoRelatorio;

    function __construct($orientation = 'P', $size = 'A4')
    {
        parent::__construct($orientation, 'cm', $size);
        $this->orientacao = $orientation;
    }

    /*public function __construct($orientacao = 'P'){
        $this->orientacao = $orientacao;
        $this->pdf = new FPDF($this->orientacao, 'mm', 'A4');
    }*/

    public function iniciaPdf()
    {
        $this->SetAutoPageBreak(true, 2);
        $this->SetMargins(1.1, 0);
        $this->SetCompression('gzcompress');
        #$this->SetDisplayMode('real', 'two');
        $this->SetAuthor('Sistema de Controle de Processos');
        $this->SetCreator('Infatec Soluções Tecnológicas');
        //dd($this->pdf);

        $this->AliasNbPages();
        $this->AddPage();
        $this->SetFont('Helvetica');
        $this->SetFontSize(8);

        $this->setConfiguracaoPadraoPdfAdvanced();
    }

    private function setConfiguracaoPadraoPdfAdvanced()
    {
        //CONFIGURAÇÃO GERAIS DA TABELA
        $this->configuracaoPadraoPdfAdvanced = array(

            'TABLE' => array(
                'TABLE_ALIGN' => 'L',                 //table align on page
                'TABLE_LEFT_MARGIN' => 0,                   //space to the left margin
                'BORDER_COLOR' => array(16, 143, 213),        //border color
                'BORDER_SIZE' => '0.01',               //border size
                'BORDER_TYPE' => '0',                 //border type, can be: 0, 1
            ),

            'HEADER' => array(
                'TEXT_COLOR' => array(0, 0, 0),  //text color
                'TEXT_SIZE' => 9,                   //font size
                'TEXT_FONT' => 'Arial',             //font family
                'TEXT_ALIGN' => 'C',                 //horizontal alignment, possible values: LRC (left, right, center)
                'VERTICAL_ALIGN' => 'M',                 //vertical alignment, possible values: TMB(top, middle, bottom)
                'TEXT_TYPE' => 'B',                 //font type
                'LINE_SIZE' => 0.5,                   //line size for one row
                'BACKGROUND_COLOR' => array(214, 228, 240),  //background color
                'BORDER_COLOR' => array(177, 173, 160),     //border color
                'BORDER_SIZE' => 0.01,                 //border size
                'BORDER_TYPE' => '1',                 //border type, can be: 0, 1 or a combination of: "LRTB"
                'TEXT' => ' ',                 //default text
                //padding
                'PADDING_TOP' => 0.1,
                'PADDING_RIGHT' => 0.1,
                'PADDING_LEFT' => 0.1,
                'PADDING_BOTTOM' => 0.1,
            ),

            'ROW' => array(
                'TEXT_COLOR' => array(0, 0, 0),        //text color
                'TEXT_SIZE' => 9,                   //font size
                'TEXT_FONT' => 'Arial',             //font family
                'TEXT_ALIGN' => 'L',                 //horizontal alignment, possible values: LRC (left, right, center)
                'VERTICAL_ALIGN' => 'M',                 //vertical alignment, possible values: TMB(top, middle, bottom)
                'TEXT_TYPE' => '',                  //font type
                'LINE_SIZE' => 0.4,                   //line size for one row
                'BACKGROUND_COLOR' => array(255, 255, 255),  //background color
                'BORDER_COLOR' => array(177, 173, 160),     //border color
                'BORDER_SIZE' => 0.01,                 //border size
                'BORDER_TYPE' => '1',                 //border type, can be: 0, 1 or a combination of: "LRTB"
                'TEXT' => ' ',                 //default text
                //padding
                'PADDING_TOP' => 0.1,
                'PADDING_RIGHT' => 0.1,
                'PADDING_LEFT' => 0.1,
                'PADDING_BOTTOM' => 0.1,
            ),
        );
    }

    public function finalizaPdf()
    {
        $this->Output();
        exit;
    }

    /**
     * @return mixed
     */
    public function getConfiguracaoPadraoPdfAdvanced()
    {
        return $this->configuracaoPadraoPdfAdvanced;
    }


    /**
     * @return mixed
     */
    public function getTituloDoRelatorio()
    {
        return $this->tituloDoRelatorio;
    }

    /**
     * @param mixed $tituloDoRelatorio
     */
    public function setTituloDoRelatorio($tituloDoRelatorio)
    {
        $this->tituloDoRelatorio = $this->decode($tituloDoRelatorio);
    }

    public function decode($str)
    {
        $str = utf8_decode($str);
        return $str;
    }

    function Header()
    {
        $this->SetTextColor(0, 0, 0);
        if ($this->orientacao == 'P') {
            $largura_celula_titulo = 17;
            $largura_maxima_linha = 19;
        } else {
            $largura_celula_titulo = 25.4;
            $largura_maxima_linha = 27.5;
        }
        $this->SetTopMargin(3.5);



        $this->SetFont('Helvetica');
        $this->SetFontSize(10);
        $this->Image(__DIR__ . "/../../public/admin/imagens/logo_captec.png", 1.2, 1, 1.5);

        $this->SetXY(3, 1.3);

        $this->Cell($largura_celula_titulo, 0.5, utf8_decode("INFATEC SOLUÇÕES TECNOLÓGICAS"), 0, 1);
        $this->SetX(3);
        $this->Cell($largura_celula_titulo, 0.5, utf8_decode("CAPTEC - CAPACITAÇÕES E TREINAMENTOS"), 0, 1);


        #$this->SetX(3);
        #$this->Cell($largura_celula_titulo, 0.4, trim(""), 0, 1);

        $this->SetXY(1.1, 2.6);

        if ($this->orientacao == 'P')
            $this->Cell($largura_celula_titulo, 0.4, "_____________________________________________________________________________________________", 0, 1);
        else
            $this->Cell($largura_maxima_linha, 0.4, "____________________________________________________________________________________________________________________________________________", 0, 1);

        $this->SetX(1.1);
        $this->SetFont('Helvetica', 'B', 11);
        $this->Cell($largura_maxima_linha, 1.5, $this->getTituloDoRelatorio(), 0, 1, "C");

        $this->SetFontSize(9);
    }

    function Footer()
    {
        $this->SetTextColor(0, 0, 0);
        $this->SetFont('Helvetica', '', 7);

        if ($this->orientacao == 'P')
            $largura = ($this->w / 3) - 0.75;
        else
            $largura = ($this->w / 3) - 0.75;

        $this->SetXY(1.1, -0.9);
        $this->Cell($largura, 0.4, url("/"), 0, 0, 'L');
        $this->Cell($largura, 0.4, 'Expedido em: ' . date('d-m-Y H:i:s'), 0, 0, 'C');
        $this->Cell($largura, 0.4, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'R');
    }
}