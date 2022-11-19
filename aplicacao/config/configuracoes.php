<?php

return [
    'versaoGenesis' => '3.2',
    'template' => '', # 'monarch' ou ''
    'dataGenesis' => '11.06.2016',
    'cliente' => 'RLustosa',
    'upload' => [
        'paginas' => [
            'caminho' => 'imgs/paginas/',
            'caminhoOriginal' => 'imgs/paginas/original/',

            'tamanhoExibicaoDoCrop' => 570,
            'widthSite' => 570,
            'heightSite' => 380,
            'aspectRatio' => '1.5/1'
        ],
    ],
    'tempoCache' => [
        'paginasDoBanco' => 60 * 24 * 7,
        'configuracoesGerais' => 60 * 24 * 7,
        'configuracoesDeContato' => 60 * 24 * 7,
    ]
];
