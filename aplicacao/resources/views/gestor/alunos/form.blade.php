<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 04-10-2016
 * Time: 13:48:21
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                @if(isset($item->id))
                    <a href="{{{ URL::route('gestor.alunos.delete', [$item->id]) }}}"
                       id="link-delete"
                       data-toggle="tooltip" data-placement="top"
                       title="Remover"
                       class="btn btn-danger">
                        <i class="fa fa-trash-o"></i>
                    </a>
                @endif

                @if  (\Request::query('read'))
                    <a href="{{ URL::route('gestor.alunos.edit', [$item->id]) }}"
                       id="link-enable-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Editar esse registro"
                       class="btn btn-primary">
                        <i class="glyphicon glyphicon-edit"></i>
                    </a>
                @elseif(isset($item->id))
                    <a href="{{ URL::route('gestor.alunos.edit', [$item->id]) }}?read=true"
                       id="link-cancel-edit"
                       data-toggle="tooltip" data-placement="top"
                       title="Visualizar esse registro"
                       class="btn btn-info">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                @endif

                <a href="{{ URL::route('gestor.alunos.index') }}"
                   id="link-index"
                   data-toggle="tooltip" data-placement="top"
                   title="Listar tudo"
                   class="btn btn-primary">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Alunos</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> {{ \Request::query('read') ? 'Visualização' : (isset($item->id) ? 'Edição' : 'Cadastro') }}
            </h3>
        </div>

        <div class="panel-body">
            @if (isset($item->id))
                {!! Form::open(
                [
                    'route' => ['gestor.alunos.update', $item->id],
                    'method' => 'put',
                    'id' => 'form-update',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
            @else
                {!! Form::open(
                [
                    'route' => 'gestor.alunos.store',
                    'id' => 'form-store',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
            @endif

            @if($errors->any())

                <div class="row">
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
                </div>

                <!--ul class="alert">
                    <li>Verifique os erros abaixo!</li>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                        </ul-->
            @endif


            <div class="form-group {{ $errors->has('username') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">CPF <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->username) ? $item->username : null) !!}</p>
                    @else
                        {!! Form::text('username', ( isset($item->username) ? $item->username : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'username',
                            'value'=>Input::old('username'),
                            'maxlength' => 11
                        ]
                        ) !!}

                        {!! $errors->first('username','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>


            <div class="form-group {{ $errors->has('password') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Senha <span class="obrigatorio"></span></label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->password) ? $item->password : null) !!}</p>
                    @else
                        {!! Form::text('password', ( isset($item->password) ? $item->password : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'password',
                            'value'=>Input::old('password')
                        ]
                        ) !!}

                        {!! $errors->first('password','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>


            <div class="form-group {{ $errors->has('firstname') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Primeiro nome <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->firstname) ? $item->firstname : null) !!}</p>
                    @else
                        {!! Form::text('firstname', ( isset($item->firstname) ? $item->firstname : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'firstname',
                            'value'=>Input::old('firstname')
                        ]
                        ) !!}

                        {!! $errors->first('firstname','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>


            <div class="form-group {{ $errors->has('lastname') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Último nome <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->lastname) ? $item->lastname : null) !!}</p>
                    @else
                        {!! Form::text('lastname', ( isset($item->lastname) ? $item->lastname : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'lastname',
                            'value'=>Input::old('lastname')
                        ]
                        ) !!}

                        {!! $errors->first('lastname','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>


            <div class="form-group {{ $errors->has('email') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">E-mail <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->email) ? $item->email : null) !!}</p>
                    @else
                        {!! Form::text('email', ( isset($item->email) ? $item->email : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'email',
                            'value'=>Input::old('email')
                        ]
                        ) !!}

                        {!! $errors->first('email','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>

            <div class="form-group {{ $errors->has('phone1') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Telefone</label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->phone1) ? $item->phone1 : null) !!}</p>
                    @else
                        {!! Form::text('phone1', ( isset($item->phone1) ? $item->phone1 : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control mascara_telefone',
                            'id' => 'phone1',
                            'value'=>Input::old('phone1')
                        ]
                        ) !!}

                        {!! $errors->first('phone1','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>

            <div class="form-group {{ $errors->has('phone2') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Celular</label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->phone2) ? $item->phone2 : null) !!}</p>
                    @else
                        {!! Form::text('phone2', ( isset($item->phone2) ? $item->phone2 : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control mascara_telefone',
                            'id' => 'phone2',
                            'value'=>Input::old('phone2')
                        ]
                        ) !!}

                        {!! $errors->first('phone2','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>

            <div class="form-group {{ $errors->has('institution') ? 'has-error has-feedback' : '' }}">
                <label class="col-sm-2 control-label">Instituição</label>

                <div class="col-sm-7">
                    @if  (\Request::query('read'))
                        <p class="form-control-static">{!! ( isset($item->institution) ? $item->institution : null) !!}</p>
                    @else
                        {!! Form::text('institution', ( isset($item->institution) ? $item->institution : null),
                        [
                            'placeholder'=>'',
                            'class'=>'form-control',
                            'id' => 'institution',
                            'value'=>Input::old('institution')
                        ]
                        ) !!}

                        {!! $errors->first('institution','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                        <span class="help-block"><small>:message</small></span>') !!}
                    @endif
                </div>
            </div>


                <div class="form-group {{ $errors->has('role_id') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Turma <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->role->name) ? $item->role->name : null) !!}</p>
                        @else
                            {!! Form::select('role_id',
                                ( isset($options_role_id) ? $options_role_id : ['0'=>'Selecione um registro']),
                                ( isset($item->role_id) ? $item->role_id : null),
                                [
                                    'data-placeholder' => 'Selecione um registro',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'role_id',
                                    'value'=>Input::old('role_id')
                                ]
                            ) !!}

                            {!! $errors->first('role_id','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>

            <div class="text-right">
                @if  (!\Request::query('read'))
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            data-loading-text="Aguarde...">
                        <span class="glyphicon glyphicon-floppy-disk"></span> {{ (isset($item->id) ? 'Salvar' : 'Adicionar') }}
                    </button>
                @endif
            </div>

            {!! Form::close() !!}
        </div>
    </div>
    @endsection

    @section('scripts')
            <!-- Laravel Javascript Validation -->
    <script type="text/javascript" src="{{ url('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
    {{-- @if( isset($item) )
        {!! JsValidator::formRequest('App\Http\Requests\AlunoRequestUpdate') !!}
    @else
        {!! JsValidator::formRequest('App\Http\Requests\AlunoRequest') !!}
    @endif --}}
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             $(\'textarea#IdDeAlgumCampo\').maxlength({
             alwaysShow: true,
             threshold: 30,
             warningClass: "label label-info",
             limitReachedClass: "label label-warning",
             placement: \'bottom\',
             message: \'Utilizado %charsTyped% de %charsTotal% caracteres.\'
             });
             // Não esquecer de acrescentar no campo: 'maxlength' => '999',
             */
            console.info('Jquery Ready');
        });
    </script>
@endsection