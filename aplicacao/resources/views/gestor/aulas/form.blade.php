<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 24-10-2016
 * Time: 14:11:47
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                @if(isset($item->id))
                    <a href="{{{ URL::route('gestor.aulas.delete', [$item->id]) }}}"
                        id="link-delete"
                        data-toggle="tooltip" data-placement="top"
                        title="Remover"
                        class="btn btn-danger">
                        <i class="fa fa-trash-o"></i>
                    </a>
                @endif

                @if  (\Request::query('read'))
                    <a href="{{ URL::route('gestor.aulas.edit', [$item->id]) }}"
                        id="link-enable-edit"
                        data-toggle="tooltip" data-placement="top"
                        title="Editar esse registro"
                        class="btn btn-primary">
                        <i class="glyphicon glyphicon-edit"></i>
                    </a>
                @elseif(isset($item->id))
                    <a href="{{ URL::route('gestor.aulas.edit', [$item->id]) }}?read=true"
                        id="link-cancel-edit"
                        data-toggle="tooltip" data-placement="top"
                        title="Visualizar esse registro"
                        class="btn btn-info">
                        <i class="glyphicon glyphicon-eye-open"></i>
                    </a>
                @endif

                <a href="{{ URL::route('gestor.aulas.index') }}"
                    id="link-index"
                    data-toggle="tooltip" data-placement="top"
                    title="Listar tudo"
                    class="btn btn-primary">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Aulas</h3>
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
                    'route' => ['gestor.aulas.update', $item->id],
                    'method' => 'put',
                    'id' => 'form-update',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}
            @else
                {!! Form::open(
                [
                    'route' => 'gestor.aulas.store',
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
    

                <div class="form-group {{ $errors->has('user_id') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Professor <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->user->firstname) ? $item->user->firstname . ' ' . $item->user->lastname : null) !!}</p>
                        @else
                            {!! Form::select('user_id',
                                ( isset($options_user_id) ? $options_user_id : ['0'=>'Selecione um registro']),
                                ( isset($item->user_id) ? $item->user_id : null),
                                [
                                    'data-placeholder' => 'Selecione um registro',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'user_id',
                                    'value'=>Input::old('user_id')
                                ]
                            ) !!}
                            
                            {!! $errors->first('user_id','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>
    

                <div class="form-group {{ $errors->has('course_id') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Curso <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->course->fullname) ? $item->course->fullname : null) !!}</p>
                        @else
                            {!! Form::select('course_id',
                                ( isset($options_course_id) ? $options_course_id : ['0'=>'Selecione um registro']),
                                ( isset($item->course_id) ? $item->course_id : null),
                                [
                                    'data-placeholder' => 'Selecione um registro',
                                    'class'=>'form-control chosen-select-deselect',
                                    'id' => 'course_id',
                                    'value'=>Input::old('course_id')
                                ]
                            ) !!}
                            
                            {!! $errors->first('course_id','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
                            <span class="help-block"><small>:message</small></span>') !!}
                        @endif
                    </div>
                </div>
    

                <div class="form-group {{ $errors->has('data_aula') ? 'has-error has-feedback' : '' }}">
                    <label class="col-sm-2 control-label">Data <span class="obrigatorio">*</span></label>

                    <div class="col-sm-7">
                        @if  (\Request::query('read'))
                            <p class="form-control-static">{!! ( isset($item->data_aula) ? $item->data_aula : null) !!}</p>
                        @else
                            <div class="input-group date" id="datepicker">
                            <!-- datepicker timepicker datetimepicker datetimerangepicker1 datetimerangepicker2-->
                                {!! Form::text('data_aula', ( isset($item->data_aula) ? $item->data_aula : null),
                                [
                                    'placeholder'=>'dd/mm/yyyy',
                                    'data-date-format' => 'DD/MM/YYYY',
                                    'data-inputmask' => "'alias': 'dd/mm/yyyy'",
                                    'class'=>'form-control inputmask',
                                    'id' => 'data_aula',
                                    'value'=>Input::old('data_aula')
                                ]
                                ) !!}
                                <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                            </div>
            
                            {!! $errors->first('data_aula','<span class="glyphicon glyphicon-remove form-control-feedback"></span>
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
    {!! JsValidator::formRequest('App\Http\Requests\AulaRequest') !!}

    <script src="{{ url('/') }}/ckeditor/ckeditor.js"></script>
    <script src="{{ url('/') }}/admin/assets/js/rlustosa-ckeditor.js"></script>

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