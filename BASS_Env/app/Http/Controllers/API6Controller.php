<?php

namespace App\Http\Controllers;

use App\CustomClasses\Variables;
use Illuminate\Http\Request;

class API6Controller extends Controller
{
    public function flag()
    {
        // Prepare the detailed dummy data
        $dummyData = [
            "message" => "Successfully authenticated",
            "user" => [
                "uuid" => "87faf56f-5be6-4932-927b-16559d6755bd",
                "username" => "JohnDoe",
                "full_name" => "Johnathan A. Doe",
                "email" => "john.doe@example.com",
                "address" => [
                    "street" => "1234 Maple Drive",
                    "city" => "Springfield",
                    "state" => "IL",
                    "postal_code" => "62704",
                    "country" => "USA"
                ],
                "phone_numbers" => [
                    "home" => "+1-555-0123",
                    "mobile" => "+1-555-4567"
                ],
                "role" => "admin",
                "permissions" => ["read", "write", "delete"],
                "account_status" => "active",
                "last_login" => "2023-04-18T06:48:40",
                "registration_date" => "2022-05-01T15:22:34",
                "security_questions" => [
                    [
                        "question" => "What is the name of your first pet?",
                        "answer_hash" => "5f4dcc3b5aa765d61d8327deb882cf99"
                    ],
                    [
                        "question" => "What was your first car?",
                        "answer_hash" => "098f6bcd4621d373cade4e832627b4f6"
                    ]
                ]
            ],
            "flag" => base64_decode(Variables::getAPI6Flag())
        ];

        // Encode the data to JSON and return the response
        return response(json_encode($dummyData), 200)
            ->header('Content-Type', 'application/json');
    }
}