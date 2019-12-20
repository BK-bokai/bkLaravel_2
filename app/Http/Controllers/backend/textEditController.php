<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\Index;
use App\Services\IndexService;
use App\Model\Image;
use Auth;
use Illuminate\Support\Facades\Validator;

class textEditController extends Controller
{
    protected $IndexService;

    public function __construct(IndexService $IndexService)
    {
        $this->IndexService = $IndexService;
    }
    public function index()
    {
        $index = $this->IndexService->GetAll('Index')->first();
        $student = $this->IndexService->GetAll('student')->first();
        $student_skills = $this->IndexService->GetAll('student_skills');
        $worker = $this->IndexService->GetAll('worker')->first();
        $work_skills = $this->IndexService->GetAll('work_skills');
        $image = Image::where('index', 1)->first();
        $image = explode("\\", $image->image_path);
        $image = end($image);
        $name = Auth::user()->name;

        return view('backend/textEdit', compact('index', 'student', 'student_skills', 'worker', 'work_skills', 'name', 'image'));
    }

    public function post(Request $request)
    {
        return $request;
    }
}
