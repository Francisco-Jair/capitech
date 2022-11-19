@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="{{ URL::route('gestor.aulas.index') }}"
                    id="link-index"
                    data-toggle="tooltip" data-placement="top"
                    title="Listar tudo"
                    class="btn btn-primary">
                    <i class="glyphicon glyphicon-th-list"></i>
                </a>

            </div>
            <h3>Frequência</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-list"></i> Edição
            </h3>
        </div>

        <div class="panel-body">
                {!! Form::open(
                [
                    'route' => 'gestor.aulas.storefrequencia',
                    'id' => 'form-store',
                    'class' => 'form-horizontal form-save',
                    'autocomplete' => 'off',
                    'role' => 'form'
                ]) !!}

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

                <ul class="alert">
                    <li>Verifique os erros abaixo!</li>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            @endif
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="color: white;">
                            Alunos
                        </h3>
                        <input type="hidden" name="aulaId" value="{{$id}}">
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <span id="erroCheck" class="help-block" style="color: red;text-align: center;font-weight: bold;"></span>
                            <table class="table table-striped tabela-full-middle">
                                <thead>
                                <tr>
                                    <th class="text-left" width="151">Frequência manhã</th>
                                    <th class="text-left" width="151">Frequência tarde</th>
                                    <th>Nome</th>
                                </tr>
                                </thead>
                                <tbody class="hover-tr-danger">
                                    @foreach($alunos as $aluno)
                                        <?
                                        $presenteManha = DB::table('frequencias')
                                                ->select('presente_m')
                                                ->where('aula_id', '=' ,$id)
                                                ->where('user_id', '=' ,$aluno->aluno_id)
                                                ->whereNull('frequencias.deleted_at')
                                                ->get();
                                        $presenteTarde = DB::table('frequencias')
                                                ->select('presente_t')
                                                ->where('aula_id', '=' ,$id)
                                                ->where('user_id', '=' ,$aluno->aluno_id)
                                                ->whereNull('frequencias.deleted_at')
                                                ->get();
                                        ?>
                                        <tr>
                                            <td>
                                                <select class="form-control chosen-select-deselect" name="aluno[{{$aluno->aluno_id}}][M]">
                                                    <option value="S">Presente</option>
                                                    <option value="N"
                                                         <?   if(!empty($presenteManha) and $presenteManha[0]->presente_m == 'N'){
                                                        echo 'selected';
                                                        }?>>Faltou</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control chosen-select-deselect" name="aluno[{{$aluno->aluno_id}}][T]">
                                                    <option value="S">Presente</option>
                                                    <option value="N"
                                                         <?   if(!empty($presenteTarde) and $presenteTarde[0]->presente_t == 'N'){
                                                        echo 'selected';
                                                        }?>>Faltou</option>
                                                </select>
                                            </td>
                                            <td>
                                                {{ $aluno->firstname . ' ' . $aluno->lastname }}
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-right">
                    <button type="submit"
                            id="button-store"
                            class="btn btn-info"
                            data-loading-text="Aguarde...">
                        <span class="glyphicon glyphicon-floppy-disk"></span> Salvar
                    </button>
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