<?php

namespace App\Services;

use App\Repositories\IndexRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Model\Index;
use App\Model\student;
use App\Model\worker;



class IndexService
{
    protected $IndexRepo;

    public function __construct(IndexRepository $IndexRepo)
    {
        $this->IndexRepo = $IndexRepo;
    }

    /**
     * $data為你需要的資料，選項有Index、student_skills、student、work_skills、worker、Image預設是Index
     */
    public function GetAll($data = 'Index')
    {
        return $this->IndexRepo->GetAll($data);
    }


    /**
     * 請輸入舊資料$OldIndexImage與新資料$NewIndexImage
     */
    public function CheckChange($OldIndexImage, $NewIndexImage)
    {
        if ($OldIndexImage == $NewIndexImage) {
            return redirect()->route('admin.index_img');
        } else {
            $OldIndexImage->index = 0;
            $OldIndexImage->save();
            $NewIndexImage->index = 1;
            $NewIndexImage->save();
            return redirect()->route('admin.index_img');
        }
    }

    public function CheckEdit(Request $request)
    {
        $index_content_one = Index::find(1)->content_one;
        $index_content_two = Index::find(1)->content_two;
        $student_content   = student::find(1)->content;
        $worker_content    = worker::find(1)->content;

        if (
            $request->index_content_one  != $index_content_one ||
            $request->index_content_two != $index_content_two ||
            $request->student_content   != $student_content   ||
            $request->worker_content    != $worker_content
        ) {
            return ['change' => 1];
        } else {
            return ['change' => 0];
        }
    }

    /**
     * $data必須為陣列
     */
    public function WorkSkillValidator(array $data)
    {
        return Validator::make($data, [
            'work_skill' => ['required', 'string', 'max:255'],
        ], [
            'work_skill.required'    => '請輸入技能名稱。',
        ]);
    }


    /**
     * $data必須為陣列
     */
    public function StudentSkillValidator(array $data)
    {
        return Validator::make($data, [
            'student_skill' => ['required', 'string', 'max:255'],
        ], [
            'student_skill.required'    => '請輸入技能名稱。',
        ]);
    }
}
