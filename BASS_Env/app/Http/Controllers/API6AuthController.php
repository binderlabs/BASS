<?php 
// app/Http/Controllers/API6AuthController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class API6AuthController extends Controller
{
    public function apiLogin(Request $request)
    {
        // Define static credentials for simplicity
        $staticEmail = "carlos1887@gmail.com";
        $staticPassword = "password!123";

        // Extract credentials from request
        $email = $request->input('email');
        $password = $request->input('password');

        // Check if the provided credentials match the static ones
        if ($email === $staticEmail && $password === $staticPassword) {
            // Credentials match. Generate and return UUID and token.
            $response = [
                'uuid' => '87faf56f-5be6-4932-927b-16559d6755bd',
                'token' => 'Y2FybG9zMTg4N0BnbWFpbC5jb206cGFzc3dvcmQhMTIz',
            ];
            return response()->json($response, 200);
        } else {
            // Credentials do not match. Return an error message.
            $response = ['error' => 'Invalid credentials'];
            return response()->json($response, 401); // Using 401 for Unauthorized
        }
    }
}