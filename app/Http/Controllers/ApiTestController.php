<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\Image;

class ApiTestController extends Controller
{
    public function GetImgs()
    {
        $Imgs = Image::all();
        return $Imgs;
    }
}
