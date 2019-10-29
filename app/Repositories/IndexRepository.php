<?php
namespace App\Repositories;
use App\Model\Index;
use App\Model\student_skills;
use App\Model\student;
use App\Model\work_skills;
use App\Model\worker;
use App\Model\Image;
use Illuminate\Support\Facades\Validator;
use Auth;

class IndexRepository{
    protected $Index;
    protected $student_skills;
    protected $student;
    protected $work_skills;
    protected $worker;
    protected $Image;

    public function __construct(Index $Index, student_skills $student_skills, student $student, work_skills $work_skills, worker $worker, Image $Image)
    {
      $this->Index          = $Index;
      $this->student_skills = $student_skills;
      $this->student        = $student;
      $this->work_skills    = $work_skills;
      $this->worker         = $worker;
      $this->Image          = $Image;
    }


    /**
     * $data為你需要的資料，選項有Index、student_skills、student、work_skills、worker、Image預設是Index
     */
    public function GetAll( $data = 'Index' )
    {
        $data = $this->$data->all();
        return $data;
    }

    

}


?>