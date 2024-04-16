<?php

namespace App\Http\Controllers;

use App\Models\API10Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class API10UsersController extends Controller
{


    public function login(Request $request)
    {
        $user = DB::table('a_p_i10_users')
                    ->select('username','authkey')
                    ->whereRaw("username='".$request->input('username')."' AND password='".$request->input('password')."'")
                    ->first();

        if($user)
        {
            return response(json_encode(array("success"=>"true","authkey"=>$user->authkey)), 200)
            ->header('Content-Type', 'application/json');
        }
        else
        {
            return response(json_encode(array("success"=>"false","cause"=>"IncorrectUsernameOrPassword")), 403)
            ->header('Content-Type', 'application/json');
        }
    }

    public function showsecret(Request $request)
    {
        if($request->hasHeader('Authorization-Token') && $request->header('Authorization-Token')!="" )
        {
            return API10Users::where('authkey',$request->header('Authorization-Token'))->first();
        }
    }
}
