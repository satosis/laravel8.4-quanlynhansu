<?php

namespace App\Http\Middleware;

use Auth;
use Closure;

class CheckToTruongLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!Auth::user()) {
            return redirect()->to('/login');
        }
        if(Auth::user()->role == 2 || Auth::user()->role == 1)
        {
            return $next($request);
        }
        return redirect()->to('/');
    }
}
