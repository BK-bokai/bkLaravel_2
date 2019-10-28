<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Repositories\ImageRepository;

class ImgController extends Controller
{
    protected $imageRepo;

    public function __construct(ImageRepository $imageRepo)
    {
        $this->imageRepo = $imageRepo;
    }


    function index()
    {
        $ImgPublish = $this->imageRepo->GetPublish();
        return view('frontend/images',compact('ImgPublish'));
    }
}
