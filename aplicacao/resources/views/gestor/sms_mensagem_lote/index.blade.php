<?php
/**
 * Gerado por Rlustosa
 * Rupert Brasil Lustosa rupertlustosa@gmail.com
 * Date: 11-11-2016
 * Time: 11:27:51
 */

?>
@extends('gestor._layouts.base')

@section('main')

    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">

                <a href="{{ URL::route('gestor.sms_mensagem_lote.create') }}"
                   id="link-create"
                   data-toggle="tooltip" data-placement="top"
                   title="Adicionar Novo"
                   class="btn btn-primary">
                    <i class="fa fa-plus"></i>
                </a>
            </div>
            <h3>Mensagens em Lote</h3>
        </div>
    </div>

    @include('gestor._layouts.sessionMensagem')

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-list"></i> Listagem</h3>
        </div>

        <div class="panel-body">

            @if ($dados->count())
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'id', '#ID') !!}</th>
                        <th>Destinatario</th>
                        <th>Mensagem</th>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'created_at', 'Data de criação') !!}</th>
                        <th>{!! HeaderPaginacao::MontaLinksHeaderPaginacao($ordenacao, 'updated_at', 'Data de atualização') !!}</th>
                        <th width="150" class="text-center">Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($dados as $item)
                        <tr>
                            <td>
                                @if($item->enviado == 1)

                                    <i style='color: #cccbcb;'>
                                        {{$item->id}}
                                    </i>
                                @else
                                    {{$item->id}}
                                @endif
                            </td>
                            <td>
                                @if($item->enviado == 1)

                                    <i style='color: #cccbcb;'>
                                        {{$item->destinatario}}
                                    </i>
                                @else
                                    {{$item->destinatario}}
                                @endif
                            </td>
                            <td>
                                @if($item->enviado == 1)

                                    <i style='color: #cccbcb;'>
                                        {{ $item->mensagem }}
                                    </i>
                                @else
                                    {{ $item->mensagem }}
                                @endif
                            </td>
                            <td>
                                @if($item->enviado == 1)

                                    <i style='color: #cccbcb;'>
                                        {{$item->created_at}}
                                    </i>
                                @else
                                    {{$item->created_at}}
                                @endif
                                   </td>
                            <td>
                                @if($item->enviado == 1)

                                    <i style='color: #cccbcb;'>
                                        {{$item->updated_at}}
                                    </i>
                                @else
                                    {{$item->updated_at}}
                                @endif
                                    </td>
                            <td class="text-center">
                                {{--<a href="{{ URL::route('gestor.sms_mensagem_lote.show', [$item->id]) }}?read=true"
                                   id="link-show-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Visualizar"
                                   class="link-show btn btn-info">
                                    <i class="fa fa-eye"></i>
                                </a>--}}
                                @if($item->enviado == 0)
                                <a href="{{ URL::route('gestor.sms_mensagem_lote.edit', [$item->id]) }}"
                                   id="link-edit-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Editar"
                                   class="link-edit btn btn-primary">
                                    <i class="fa fa-pencil"></i>
                                </a>

                                <a href="{{ URL::route('gestor.sms_mensagem_lote.view_enviar_sms', [$item->id]) }}"
                                   id="link-delete-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Enviar SMS"
                                   class="link-delete btn btn-info btn-sms">
                                    <i class="fa fa-send-o"></i>
                                </a>
                                @endif
                                {{--<a href="{{ URL::route('gestor.sms_mensagem_lote.delete', [$item->id]) }}"
                                   id="link-delete-{{ $item->id }}"
                                   data-id="{{ $item->id }}"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Remover"
                                   class="link-delete btn btn-danger">
                                    <i class="fa fa-trash-o"></i>
                                </a>--}}

                                <a href="{{ URL::route('gestor.relatorios.relatorios_de_sms_enviado', [$item->id]) }}"
                                   data-id="{{ $item->id }}"
                                   target="_blank"
                                   data-toggle="tooltip" data-placement="top"
                                   title="Relatório de destinatários"
                                   class="link-delete btn btn-default">
                                    <i class="fa fa-file-word-o"></i>
                                </a>
                            </td>
                        </tr>
                    @endforeach

                    </tbody>
                </table>
                {!! $dados->render() !!}




            @else
                @include('gestor._layouts.naoExistemRegistros')
            @endif
        </div>
    </div>
@endsection

@section('scripts')

@endsection