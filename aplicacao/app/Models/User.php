<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Kbwebs\MultiAuth\PasswordResets\CanResetPassword;
use Kbwebs\MultiAuth\PasswordResets\Contracts\CanResetPassword as CanResetPasswordContract;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;

class User extends Model implements AuthenticatableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;
    protected $table = "mdl_user";

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * Os atributos que s�o permitidos na inser��o em massa.
     *
     * @var array
     */
    protected $fillable = ['id', 'username', 'password', 'firstname', 'lastname', 'email', 'phone1', 'phone2', 'institution'];

    /**
     * Os atributos exclu�dos da inser��o em massa.
     *
     * @var array
     */
    protected $hidden = [];


    public function aulas()
    {
        return $this->hasMany('\App\Models\Aula', 'user_id');
    }
}
