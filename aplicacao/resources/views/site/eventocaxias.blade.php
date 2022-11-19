@extends('site._layouts.master')
@section('content')



    <section class="header-course">
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li><a href="{{ url('/eventos') }}">Eventos</a></li>
                <li class="active">Educação Infantil: Desafios Curriculares e Uso de Tecnologias</li>
            </ol>

            <div class="row">
                <div class="col-sm-12">
                    <h1><strong style="font-size: 50px;">Educação Infantil:</strong><br>Desafios Curriculares e Uso de Tecnologias</h1>
                </div>
            </div>

        </div>
    </section>

    <section class="content">
        <div class="container">

            <div class="panel panel-default">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-sm-4"><img src="{{ asset('site/img/child-education-course.png') }}" style="width: 100%;"></div>
                        <div class="col-sm-8">
                            <p>A Prefeitura Municipal de Caxias por meio da Secretaria Municipal de Educação - SEMEDUC apresenta a Formação em Educação Infantil - CAPTEC, com temática nos desafios curriculares e uso de tecnologias, objetivando o aprimoramento das práticas pedagógicas de leitura e escrita de forma lúdica, explorando as múltiplas linguagens da Educação Infantil.</p>
                        </div>
                    </div>

                    <hr>

                    <div id="event-carousel">
                        <a href="{{ asset('site/photos/educacao-infantil-1.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-1-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-2.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-2-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-3.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-3-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-4.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-4-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-5.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-5-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-6.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-6-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-7.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-7-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-8.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-8-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-9.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-9-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-10.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-10-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-11.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-11-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-12.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-12-thumb.jpg') }}"></a>
                        <a href="{{ asset('site/photos/educacao-infantil-13.jpg') }}" class="img-popup"><img src="{{ asset('site/photos/educacao-infantil-13-thumb.jpg') }}"></a>
                    </div>

                    <hr>

                    <div class="row">

                        <div class="col-sm-6 box-course timeline">
                            <h2 class="box-title-course">Programação</h2>

                            <h3><strong>Dia 03/11</strong> - Palestras</h3>
                            <ul>
                                <li>
                                    <p><strong>Apresentação do Sistema CAPTEC</strong></p>
                                    <span>Palestrante Agamenon Santa Cruz</span>
                                </li>
                                <li>
                                    <p><strong>Desafios Curriculares e Uso de Tecnologias</strong></p>
                                    <span>Palestrante Prof. Ma. Heloísa Cardoso Varão Santos</span>
                                </li>
                                <li>
                                    <p><strong>Psicomotricidade e Aprendizagem na Educação Infantil</strong></p>
                                    <span>Palestrante Prof. Ma. Antônia Márcia Sousa Torres</span>
                                </li>
                            </ul>

                            <h3><strong>De 12/11 a 03/12</strong> - Oficinas</h3>
                            <ul>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-1"><strong>Tema 1 - Desenvolvimento Infantil</strong></a></p>
                                    <span>Prof. Esp. Deys Araújo Santana</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-2"><strong>Tema 2 -Eixo Curricular Linguagem Oral e Escrita</strong></a></p>
                                    <span>Prof. Ma. Marioneide Vieira Lima</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-3"><strong>Tema 3 - A Ludicidade Como Principio Estético</strong></a></p>
                                    <span>Prof. Esp. Kate Lis Varão Santos</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-4"><strong>Tema 4 - Artes Visuais na Educação Infantil</strong></a></p>
                                    <span>Prof. Esp. Maria Eliane Pereira Sousa</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-5"><strong>Tema 5 - Musicalização na Educação Infantil</strong></a></p>
                                    <span>Prof. Me. Samuel Mendonça Fagundes</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-6"><strong>Tema 6 - Natureza e Sociedade na Educação Infantil</strong></a></p>
                                    <span>Prof. Ma. Heloísa Cardoso Varão Santos</span>
                                </li>
                                <li>
                                    <p><a data-toggle="modal" data-target="#modal-theme-7"><strong>Tema 7 - Organização do Trabalho Pedagógico: Sequências Didáticas e Projetos</strong></a></p>
                                    <span>Prof. Me. Ednardo Monteiro Gonzaga do Monti</span>
                                </li>
                            </ul>

                        </div>

                        <div class="col-sm-6 box-course calendar">
                            <h2 class="box-title-course">Calendário Presencial</h2>

                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>EVENTO</th>
                                        <th>DATA</th>
                                        <th>PROGRAMAÇÃO</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td>Abertura</td>
                                        <td>03/11</td>
                                        <td>
                                            <ul>
                                                <li>Apresentação do CAPTEC</li>
                                                <li>Palestras</li>
                                            </ul>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div style="font-size: 12px">&nbsp</div>
                            <div style="font-size: 12px"><strong>LOCAL:</strong> Auditório da FACEMA</div>
                            <div style="font-size: 12px"><strong>HORA:</strong> das 14h às 18h</div>
                            <div style="font-size: 12px">&nbsp</div>
                            <div style="font-size: 12px">&nbsp</div>

                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>ENCONTRO</th>
                                        <th>DATA</th>
                                        <th>TURMAS e TEMAS</th>
                                    </tr>
                                    </thead>

                                    <tbody>

                                    <tr>
                                        <td>1º Encontro</td>
                                        <td>12/11</td>
                                        <td>A1, B2, C3, D4, E5, F6 e G7</td>
                                    </tr>

                                    <tr>
                                        <td>2º Encontro</td>
                                        <td>13/11</td>
                                        <td>B1, C2, D3, E4, F5, G6 e A7</td>
                                    </tr>

                                    <tr>
                                        <td>3º Encontro</td>
                                        <td>19/11</td>
                                        <td>C1, D2, E3, F4, G5, A6 e B7</td>
                                    </tr>

                                    <tr>
                                        <td>4º Encontro</td>
                                        <td>20/11</td>
                                        <td>D1, E2, F3, G4, A5, B6 e C7</td>
                                    </tr>

                                    <tr>
                                        <td>5º Encontro</td>
                                        <td>26/11</td>
                                        <td>E1, F2, G3, A4, B5, C6 e D7</td>
                                    </tr>

                                    <tr>
                                        <td>6º Encontro</td>
                                        <td>27/11</td>
                                        <td>F1, G2, A3, B4, C5, D6 e E7</td>
                                    </tr>

                                    <tr>
                                        <td>7º Encontro</td>
                                        <td>03/12</td>
                                        <td>G1, A2, B3, C4, D5, E6 e F7</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                            <div style="font-size: 12px">&nbsp</div>
                            <div style="font-size: 12px"><strong>LOCAL:</strong> Colégio Municipal Antônio Rodrigues Bayma<br>Av. Mal Costa e Silva, 1327, Castelo Branco</div>
                            <div style="font-size: 12px"><strong>HORA:</strong> das 08h às 12h e das 14h às 18h</div>
                            <div style="font-size: 12px">&nbsp</div>
                            <div style="font-size: 12px">&nbsp</div>

                            <div class="row legenda">
                                <div class="col-xs-12">
                                    <span class="title">LEGENDA:</span>
                                    <span class="circle"><strong>7 TURMAS:</strong> A, B, C, D, E, F, G</span>
                                    <span class="circle"><strong>7 TEMAS:</strong> 1, 2, 3, 4, 5, 6, 7</span>
                                </div>
                            </div>

                            <div class="panel panel-info course-hours">
                                <div class="panel-heading">CARGA HORÁRIA</div>
                                <div class="panel-body text-center">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <span>CAPTEC EAD</span>
                                            <p>220h</p>
                                        </div>
                                        <div class="col-xs-6">
                                            <span>PRESENCIAL</span>
                                            <p>80h</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <a href="http://ava.sistemacaptec.com.br/" class="btn btn-block btn-custom">Acesse o AMBIENTE VIRTUAL</a>
                                </div>
                                <div class="col-md-4">
                                    <a href="{{route('valida-certificado')}}" class="btn btn-block btn-custom2"><span class="glyphicon glyphicon-save-file"></span> Certificados</a>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>

        </div>
    </section>



    <!-- POP-UPS THEMES -->

    <div class="modal fade" id="modal-theme-1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        - Etapas do desenvolvimento da criança;<br>
                        - Intervenções pedagógicas para estimular a linguagem oral e escrita, o movimento, a afetividade, o raciocínio lógico.
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        EDWARDS,C. As cem linguagens da criança: a abordagem de Reggio  Emilia na educação da primeira infância. Porto Alegre: Artes Médicas, 1999.<br>
                        GALVÃO,H.. Henri Wallon: uma concepção dialética do desenvolvimento infantil. Petrópolis: Vozes. 2.ª ed., 1995.<br>
                        MEIRA, Marcos-Educação infantil  no tempo presente  São Paulo : Érica ,2002<br>
                        OLIVEIRA, Zilma de M. Ramos- A criança e seu desenvolvimento : perspectivas para  se discutir a educação infantil.
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-2" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        - Leitura na Educação Infantil: para quê?<br>
                        -Literatura: porta de entrada das crianças para a leitura.<br>
                        (Oficina de Recursos para as  histórias)<br>
                        -Alfabetizar e letrar na Educação Infantil<br>
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        FONSECA, Edi- Interações : com olhos de ler .São Paulo: Blucher ,2012<br>
                        MEYER, Ivanise Corrêa Rezende-Brincar &Viver :Projetos de Educação Infantil-Rio de Janeiro .WAK,2003<br>
                        ROSA , Ester Calland Perrusi(org.) Ler e  escrever na educação infantil :discutindo práticas pedagógicas- 2 ed. Belo Horizonte: Autentica Editora 2011<br>
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-3" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        O brincar no desenvolvimento da criança;<br>
                        Classificação das brincadeiras;<br>
                        Jogos e brincadeiras (Oficina Movimento e o brincar na Educação infantil).
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        -FRIEDMAN, Adriana – O brincar  na Eucação Infantil 1 ed. São Paulo: Moderna 2012<br>
                        -HORN, Maria da Graça Souza- Sabores ,cores,sons, aromas e a organização  dos e´paços  na\ educaçõ Infantil.Porto Alegre, Artemed ,2004<br>
                        -OLIVEIRA, Zilma de Moraes Ramos- Educação Infantil: muitos olhares 9ª ed.São Paulo: Cortez ,2010<br>
                        -OLIVEIRA, Vera Barros de – O brincar  e a criança do nascimento aos seis anos – 4ª ed.Petrópolis – Rj Vozes  2000<br>
                        -PICCOLO, Vilma Leni –Corpo em movimento  na  Educação Infantil 1ª ed. São Paulo .Editora Telos 2012
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-4" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        -Experiências estéticas: onde está a arte?<br>
                        -Leitura de imagens e produção artística na infância
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        -BARBIERI, Stela – Interações : onde está a arte na infância ? São Paulo : Blucher , 2012<br>
                        -SANS, Paulo de Tarso Cheida – Pedagogia do Desenho Infantil .Campinas: Àtomo,2001
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-5" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        -Apreciação musical na educação infantil - qualidade dos sons;<br>
                        -O fazer musical (Oficina Cantando e imitando).
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        -BRITO, Teca Alencar- Música na Educação Infantil.<br>
                        -MARZULLO, Eliane- Musicalização nas escolas. Petrópolis , RJ : vozes ,2001<br>
                        -KEBACH, Patrícia- Pedagogia da Música: experiências de apreciação musical. Porto Alegre –Editora Mediação 2009.
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-6" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        -A compreensão dos fenômenos naturais e sociais na infância (Oficina de exploração de temas integradores ).<br>
                        -Temas integradores e elaboração de Projetos.
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        KULISZ, Beatriz – Professores em cena : o que faz a diferença ? Porto Alegre- Mediação,2004<br>
                        ABRAMOVICZ, Anete & WAJSKOP, Gisela. Creches. Atividades para crianças de zero a seis anos. São Paulo. Moderna.1995.<br>
                        ARRIBAS, Teresa Lleixá &Cols., Educação Infantil: Desenvolvimento, currículo e organização escolar. Porto Alegre: Artmed, 2004.
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal-theme-7" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Detalhes</h4>
                </div>
                <div class="modal-body">

                    <p>
                        <strong>Carga horária:</strong> 10 horas presenciais e 30h à distância (CAPTEC)
                    </p>

                    <p>
                        <strong>Conteúdos:</strong><br>
                        -Planejamento e organização do trabalho: Sequências didática e Projetos didáticos.<br>
                        -Organização de Portifólios : registro e sistematização .
                    </p>

                    <p>
                        <strong>Referências:</strong><br>
                        BRASIL. Práticas Cotidianas na Educação Infantil – Bases para Reflexão sobre as Orientações Curriculares. Projeto de Cooperação Técnica MEC / Universidade Federal do Rio Grande do Sul para Construção de Orientações Curriculares para a Educação Infantil. Brasília, MEC/Secretaria de Educação Básica/ UFRGS, 2009.<br>
                        MEYER, Ivanise Corrêa Rezende-Brincar &Viver :Projetos de Educação Infantil-Rio de Janeiro .WAK,2003<br>
                        Revista Pátio Infantil. O Currículo na Escola Infantil: a organização do ensino em Projetos de Trabalho. Educação, Porto Alegre,Ano XXII n. 38 Junho 1999
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- POP-UPS THEMES end -->



@endsection
