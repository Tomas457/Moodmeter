<?php

namespace App\Controllers;

class Homecontroller extends BaseController
{
    public function index()
    {
        return view('welcome_message');
    }
}
