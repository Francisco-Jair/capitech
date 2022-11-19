@extends('site._layouts.master')
@section('content')



    <section class="header-course">
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li class="active">Dúvidas</li>
            </ol>

            <div class="row">
                <div class="col-sm-12">
                    <h1><strong style="font-size: 50px;">Formulário de contato:</strong><br>Entre em contato conosco para tirar suas dúvidas</h1>



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


                    {{--<ul class="alert">
                        <li>Verifique os erros abaixo!</li>
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>--}}
                @endif

            </div>

            @if(Session::has('mensagem'))

                    <div class="col-md-12">


                         <h2 style="color:green">{{ Session::get('mensagem') }}</h2>
                        </div>

                    </div>

            @endif

        </div>
    </section>

    <section class="content">
        <div class="container">

            <div class="panel panel-default">
                <div class="panel-body">


                    <div class="row">


                        {!! Form::open(array('route' => array('assuntos.store'),
                                'id' => 'frm_store_assuntos',
                                'class' => 'contact-form',
                                'autocomplete' => 'off',
                                'role' => 'form'
                                )) !!}

                        <div class="col-sm-6 form-group">
                            <label>Nome</label>
                            <input type="text" name="nome" class="form-control" required>

                            {!! $errors->first('nome','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>E-mail</label>
                            <input type="email" name="email" class="form-control" required>

                            {!! $errors->first('email','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}

                        </div>

                        <div class="col-sm-6 form-group">
                            <label>CPF</label>
                            <input type="text" name="cpf" class="form-control " required>

                            {!! $errors->first('cpf','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}
                        </div>

                        <div class="col-sm-6 form-group">
                            <label>Telefone</label>
                            <input type="text" name="telefone" class="form-control " required>

                            {!! $errors->first('telefone','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}

                        </div>

                        <div class="col-sm-6 form-group">
                            <label>Assunto</label>
                            {!! Form::select('assunto_id',$listaDeAssuntos,
            Input::old('assunto_id'),
            [
            'data-placeholder' => 'Selecione um registro',
            'class' => 'form-control',
            'required'=>"required",
            'id' => 'select_form'
            ]
            ) !!}

                            {!! $errors->first('assunto_id','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}

                        </div>

                        <div class="col-sm-12 form-group">
                            <label>Mensagem</label>
                            <textarea name="mensagem" class="form-control" required rows="6"></textarea>

                            {!! $errors->first('mensagem','<span
      class="glyphicon glyphicon-remove form-control-feedback"></span><span
      class="help-block alerta"><small>:message</small></span>') !!}
                        </div>

                        <div class="col-sm-12 text-right">
                            <input type="submit" class="btn btn-success" value="Enviar">
                        </div>

                        {!! Form::close() !!}
                    </div>


                </div>
            </div>

        </div>
    </section>





@endsection
