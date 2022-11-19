<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Contracts\Auth\Guard;

class AuthenticateApi
{
	/**
	 * The Guard implementation.
	 *
	 * @var Guard
	 */
	protected $auth;

	/**
	 * Create a new middleware instance.
	 *
	 * @param  Guard $auth
	 * @return void
	 */
	public function __construct(Guard $auth)
	{
		$this->auth = $auth;
	}

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request $request
	 * @param  \Closure $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
		$username = $request->header('username');
		$password = $request->header('password');

		$user = User::where('username', $username)->first();

		if (!$user) {
			abort(403, "Invalid Username or Password");
		}

		$verified = password_verify($password, $user->password);

		if (!$verified) {
			abort(403, "Invalid Username or Password");
		} else {
			\Auth::api()->loginUsingId($user->id);
		}

		if (\Auth::api()->guest()) {
			return response('Unauthorized.', 401);
		}

		return $next($request);
	}
}
