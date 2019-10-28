<?php
namespace App\Repositories;

use App\Model\Image;

class ImageRepository
{
    protected $image;

    public function __construct(Image $image)
    {
        $this->image = $image;
    }

    public function GetPublish()
    {
        $ImgPublish=$this->image
                    ->where('publish',1)    
                    ->get();

        return $ImgPublish;
    }

    public function GetAll()
    {
        $Images = $this->image
                ->all();
        
        return $Images;
    }
}
?>
