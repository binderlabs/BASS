<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class SsrfController extends Controller
{
    public function show(Request $request)
    {
        if ($request->input('url') != "") {
            $url = $request->input('url');

            // WARNING: This is a deliberate vulnerability for educational purposes.
            // In a real-world application, you MUST NOT allow loading of file:///, 
            // as it can lead to Arbitrary File Read vulnerabilities.

            // Check for disallowed keywords and schemes
            $disallowed = ['127.0.0.1', 'localhost', '::1'];
            $isFileScheme = parse_url($url, PHP_URL_SCHEME) === 'file';
            
            // Block potentially harmful URLs
            if (in_array(parse_url($url, PHP_URL_HOST), $disallowed) || (!$isFileScheme && !filter_var($url, FILTER_VALIDATE_URL))) {
                Log::warning('Blocked potentially unsafe SSRF request: ' . $url);
                return response(json_encode(["success" => "false", "msg" => "Not Allowed!!"]), 403)
                    ->header('Content-Type', 'application/json');
            }

            // Perform the request. This line could lead to local file disclosure if file:// is allowed.
            try {
                $data = file_get_contents($url);
                return response(json_encode(["success" => "true", "data" => base64_encode($data)]), 200)
                    ->header('Content-Type', 'application/json');
            } catch (\Throwable $e) {
                // Handle error, such as logging and returning an appropriate response
                Log::error('Error during SSRF request: ' . $e->getMessage());
                return response(json_encode(["success" => "false", "msg" => "Error fetching data"]), 500)
                    ->header('Content-Type', 'application/json');
            }
        } else {
            return response(json_encode(["success" => "false", "cause" => "url param not set"]), 403)
                ->header('Content-Type', 'application/json');
        }
    }
}