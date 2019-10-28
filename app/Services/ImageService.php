<?php

namespace App\Services;

use App\Repositories\ImageRepository;
use Illuminate\Http\Request;
use App\Model\Image;
use App\EventService\Events\ImageEvent;

class ImageService
{
    protected $imageRepo;

    public function __construct(ImageRepository $imageRepo)
    {
        $this->imageRepo = $imageRepo;
    }

    public function GetAll()
    {
        $Images = $this->imageRepo
            ->GetAll();

        return $Images;
    }

    public function createImg(Request $request)
    {
        $path = public_path() . '\img\\';
        
        $file = $request->file('image_file');
        $fileName = $file->getClientOriginalName();
        $image = Image::where('image_path', $path . $fileName)->first();
        $images = Image::all();

        if (is_file($path . $fileName) || $image !== null) {
            $errors = ['image' => '檔案已存在'];
            return redirect()->route('admin.img')
                ->withErrors($errors);


        } else {
            
            $imSize = getimagesize($file);
            $imX = $imSize[0];
            $imY = $imSize[1];

            if ($imX > $imY) {
                $imX = $imY;
            } else {
                $imY = $imX;
            }
            
            $newIm = imagecreatetruecolor(600, 600); //代表了一幅大小为 $imX和 $imY的黑色图像


            $source = imagecreatefromjpeg($file); //从给定的文件名取得的图像

            ImageCopyResampled($newIm, $source, 0, 0, 0, 0, 600, 600, $imSize[0], $imSize[1]); //重采样拷贝部分图像并调整大小

            imagejpeg($newIm, $path . $fileName);
            $CreateImg=Image::create(['image_path' => $path . $fileName, 'publish' => $request->publish]);
            event(new ImageEvent($CreateImg));
            return redirect()->route('admin.img');

        }
    }
}
