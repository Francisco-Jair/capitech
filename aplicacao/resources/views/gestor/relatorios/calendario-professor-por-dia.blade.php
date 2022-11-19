@extends('gestor._layouts.base')
@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <h3>Calendário do professor por dia</h3>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> Filtros
            </h3>
        </div>

        <div class="panel-body">

                {!! Form::open(
                [
                    'route' => ['gestor.relatorios.calendario_professor_por_dia'],
                    'method' => 'get',
                    'id' => 'form-update',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}

            <div class="form-group">
                <label class="col-sm-2 control-label">Dia da aula <span class="obrigatorio">*</span></label>

                <div class="col-sm-7">
                        <div class="input-group date" id="datepicker">
                            <!-- datepicker timepicker datetimepicker datetimerangepicker1 datetimerangepicker2-->
                            {!! Form::text('data',null,
                            [
                                'placeholder'=>'dd/mm/yyyy',
                                'data-date-format' => 'DD/MM/YYYY',
                                'data-inputmask' => "'alias': 'dd/mm/yyyy'",
                                'class'=>'form-control inputmask',
                                'id' => 'data_inicio',
                                'required' => 'required',
                                'value'=>Input::old('data')
                            ]
                            ) !!}
                            <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                </div>
            </div>


            <div class="text-right">
                @if  (!\Request::query('read'))
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            data-loading-text="Aguarde...">
                        <i class="fa fa fa-file-word-o"></i> Gerar relatório
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