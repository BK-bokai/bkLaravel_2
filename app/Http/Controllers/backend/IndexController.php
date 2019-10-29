<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Index;
use App\Model\student_skills;
use App\Model\student;
use App\Model\work_skills;
use App\Model\worker;
use App\Model\Image;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Services\IndexService;
use App\EventService\Events\IndexEvent;


class IndexController extends Controller
{

    protected $IndexService;

    public function __construct(IndexService $IndexService)
    {
        $this->IndexService = $IndexService;
    }

    function index()
    {
        $index = $this->IndexService->GetAll('Index')->first();
        $student = $this->IndexService->GetAll('student')->first();
        $student_skills = $this->IndexService->GetAll('student_skills');
        $worker = $this->IndexService->GetAll('worker')->first();
        $work_skills = $this->IndexService->GetAll('work_skills');
        $name = Auth::user()->name;

        return view('backend/index', compact('index', 'student', 'student_skills', 'worker', 'work_skills', 'name'));
    }

    function index_img()
    {
        $images = $this->IndexService->GetAll('Image');
        return view('backend.index_img', [
            'images' => $images,
            'name' => Auth::user()->name
        ]);
    }

    function check_index_img(Request $request, Image $image)
    {
        if ($image->index == 1) {
            return ['change' => 0];
        } else {
            return ['change' => 1];
        }
    }

    function checkArticle(Request $request)
    {
        $change = $this->IndexService->CheckEdit($request);
        return $change;
    }

    function change_index_img(Request $request)
    {
        $OldIndexImage = Image::where('index', 1)->first();
        $NewIndexImage = Image::where('id', $request->index_img)->first();

        $description = '更改首頁照片';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));
        return $this->IndexService->CheckChange($OldIndexImage, $NewIndexImage);
    }

    function edit(Request $request, Index $index, student $student, worker $worker)
    {

        $index->content_one = $request->index_content_one;
        $index->content_two = $request->index_content_two;
        $index->save();
        $student->content  = $request->student_content;
        $student->save();
        $worker->content   = $request->worker_content;
        $worker->save();

        $description = '更改首頁文章';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));

        return ['changed'];
    }

    function add_student_skill(Request $request)
    {
        $this->IndexService->StudentSkillValidator($request->all())->validate();
        $student_skills = new student_skills;
        $student_skills->skill_name = $request->student_skill;
        $student_skills->save();
        $description = '新增學生技能';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));

        return redirect()->route('admin.index');
    }


    function del_student_skill(Request $request, student_skills $student_skill)
    {
        $student_skill->delete();
        $description = '刪除學生技能';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));
        return ['finish'];
    }

    function add_work_skill(Request $request)
    {

        $this->IndexService->WorkSkillValidator($request->all())->validate();

        $work_skills = new work_skills;
        $work_skills->skill_name = $request->work_skill;
        $work_skills->save();
        $description = '新增工作技能';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));
        return redirect()->route('admin.index');
    }


    function del_work_skill(Request $request, work_skills $work_skill)
    {
        $work_skill->delete();
        $description = '刪除工作技能';
        $user = Auth::user()->name;
        event(new IndexEvent($user, $description));
        return ['finish'];
    }
}
