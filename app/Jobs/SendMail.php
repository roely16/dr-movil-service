<?php

namespace App\Jobs;

use Illuminate\Support\Facades\Mail;
use App\Mail\NotificationMail;

class SendMail extends Job{
    
    public function __construct(){
        


    }

    public function handle(){
        
        $data = (object) [
            "view" => "emails.register",
            "data" => []
        ];

        Mail::to('gerson.roely@gmail.com')->send(new NotificationMail($data));

    }
}