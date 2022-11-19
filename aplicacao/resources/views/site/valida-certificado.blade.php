@extends('site._layouts.master')
@section('content')
    <section class="header-course">
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Certificado</li>
            </ol>
            <div class="row">
                <div class="col-sm-12">
                    <h1>
                        <strong style="font-size: 50px;">Certificado:</strong>
                        <br>
                    </h1>
                </div>
                @if($errors->any())
                    <div class="col-md-12">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                            <span class="sr-only">Error:</span>
                            @if($errors->count() == 1)
                                Verifique o erro abaixo:
                            @else
                                Verifique os {{ $errors->count() }} erros abaixo:
                            @endif
                        </div>
                    </div>
                @endif
            </div>
            @if(Session::has('mensagem'))
                <div class="col-md-12">
                     <h2 style="color:green">{{ Session::get('mensagem') }}</h2>
                </div>
            @endif
        </div>
    </section>

    <section class="content">
        <div class="container" style="min-height: 500px;">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        {!! Form::open(array('route' => array('valida-certificado'),
                                'id' => 'frm_valida_certificado',
                                'class' => 'contact-form',
                                'autocomplete' => 'off',
                                'role' => 'form'
                                )) !!}

                        <div class="col-sm-6 form-group">
                            <div class="form-group">
                                <label>Código de verificação ou CPF (somente números)</label>
                                <input type="text" name="codigo" class="form-control" required>

                                {!! $errors->first('codigo','<span
          class="glyphicon glyphicon-remove form-control-feedback"></span><span
          class="help-block alerta"><small>:message</small></span>') !!}
                            </div>
                            <input type="submit" class="btn btn-success" value="Verificar">
                        </div>
                        {!! Form::close() !!}
                    </div>

                    <div class="row">
                        @if(!empty($certificados))
                            <ul>
                                @foreach($certificados as $certificado)
                                    <li>
                                        <p>
                                            Visualizar Certificado
                                            <a target="_blank" href="{{ url('/certificados/' . $certificado->codigo.'.pdf')}}"><strong>{{ $certificado->codigo }}</strong></a>
                                        </p>
                                    </li>
                                @endforeach
                            </ul>
                        @elseif(!empty($codigo))
                            <div class="col-md-12">
                                <div class="alert alert-danger" role="alert">
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    Código ou CPF "{{ $codigo }}" inválido(s).
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection