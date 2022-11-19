@extends('site._layouts.master')
@section('content')

    <section class="header-course">
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Eventos</li>
            </ol>

            <div class="row">
                <div class="col-sm-12">
                    <h1><strong style="font-size: 50px;">Eventos</strong></h1>
                </div>
            </div>

        </div>
    </section>

    <section>
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h3>Em andamento</h3><hr>
                </div>
            </div>

            <div class="row list-courses">
                <div class="col-sm-4 item">
                    <a href="{{ route('eventosenador') }}">
                        <figure><img src="{{  asset('site/photos/senador/CapaEventoSite.jpg') }}"></figure>
                        <span class="title">CAPtec de Senador Alexandre Costa - MA</span>
                    </a>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <h3>Finalizados</h3><hr>
                </div>
            </div>

            <div class="row list-courses">
                <div class="col-sm-4 item">
                    <a href="{{ route('eventocaxias') }}">
                        <figure><img src="{{  asset('site/img/child-education-course.png') }}"></figure>
                        <span class="title">Educação Infantil: Desafios Curriculares e Uso de Tecnologias</span>
                    </a>
                </div>
            </div>

        </div>
    </section>


@endsection
