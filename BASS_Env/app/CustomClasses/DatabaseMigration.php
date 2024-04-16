<?php

namespace App\CustomClasses;

class DatabaseMigration
{
    public static function flags()
    {
        $flag_arr = array(
            "1"=>"flag{BASS_Secret}",
            "2"=>"flag{BASS_Secret}",
            "3"=>"flag{BASS_Secret}",
            "4"=>"flag{BASS_Secret}",
            "5"=>"flag{BASS_Secret}",
            "6"=>"flag{BASS_Secret}",
            "7"=>"flag{BASS_Secret}",
            "8"=>"flag{BASS_Secret}",
            "9"=>"flag{BASS_Secret}",
            "10"=>"flag{BASS_Secret}",
        );

        return $flag_arr;
    }
}
