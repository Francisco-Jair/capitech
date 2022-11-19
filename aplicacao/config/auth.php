<?php

return [

    'multi-auth' => [
        'gestor' => [
            'driver' => 'eloquent',
            'model'  => App\Models\Gestor::class,
        ],
        'api' => [
            'driver' => 'eloquent',
            'model'  => App\Models\User::class,
        ]
    ],

    'password' => [
        'email'  => 'emails.password',
        'table'  => 'password_resets',
        'expire' => 60,
    ],

];
