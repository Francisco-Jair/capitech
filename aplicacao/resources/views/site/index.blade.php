@extends('site._layouts.master')
@section('content')


    <section id="slider">
        <div id="carousel">

            <div class="item">
                <figure><img src="{{  asset('site/img/sample-slide-1.jpg') }}"></figure>
                <div class="details">
                    <h3><strong>Construindo</strong> uma <strong>Escola</strong> de <br>
                        <strong>Qualidade</strong> para <strong>Todos</strong>
                    </h3>
                    <a href="{{ route('eventosenador') }}">Conheça o evento</a>
                </div>
            </div>

        </div><!-- end #carousel -->
    </section><!-- end #slider -->

    <section class="box sample-parallax">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h2 class="box-title">Eventos em andamento</h2>
                </div>
            </div>

            <div class="row list-courses">
                <div class="col-sm-offset-4 col-sm-4 item">
                    <a href="{{ route('eventosenador') }}">
                        <figure><img src="{{  asset('site/photos/senador/CapaEventoSite.jpg') }}"></figure>
                        <span class="title">CAPtec de Senador Alexandre Costa - MA</span>
                    </a>
                </div>
            </div>

        </div>
    </section>

    <section class="box">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h2 class="box-title">Sobre o CAPTEC</h2>
                    <p>CAPTEC – Capacitações e Treinamentos, é uma plataforma tecnológica de EAD (Educação de Ensino à Distância)
                        em um ambiente AVA (Ambiente Virtual de Aprendizado) que contém material didático de ensino, controle de
                        frequência através de uma solução que funciona Online e Offline e emissão de certificado digital para
                        modalidade de ensino a distância e também presencial.</p>
                </div>
            </div>

        </div>
    </section>


@endsection
