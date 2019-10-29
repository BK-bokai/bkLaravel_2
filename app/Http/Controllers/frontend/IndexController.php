<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\student_skills;
use App\Model\student;
use App\Model\work_skills;
use App\Model\worker;
use App\Model\Index;
use App\Model\Image;
use App\Services\IndexService;




class IndexController extends Controller
{
    protected $IndexService;
    public function __construct(IndexService $IndexService)
    {
        $this->IndexService = $IndexService;
    }
    function index()
    {
        $index=$this->IndexService->GetAll('Index')->first();
        $student=$this->IndexService->GetAll('student')->first();
        $student_skills=$this->IndexService->GetAll('student_skills');
        $worker=$this->IndexService->GetAll('worker')->first();
        $work_skills=$this->IndexService->GetAll('work_skills');
        $image = Image::where('index',1)->first();
        $image = explode("\\", $image->image_path);
        $image = end($image);
        return view('frontend/index',compact('index','student','student_skills','worker','work_skills','image'));
    }
}
