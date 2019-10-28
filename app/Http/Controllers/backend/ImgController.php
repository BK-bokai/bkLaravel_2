<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\ImageService;
use App\Model\Image;
// use App\EventService\Events\ImageEvent;
use Auth;


class ImgController extends Controller
{
    protected $imageService;
    public function __construct(ImageService $imageService)
    {
        $this->imageService = $imageService;
    }

    public function index()
    {
        $images = $this->imageService->GetAll();
        $name = Auth::user()->name;
        return view('backend/img',compact('images','name'));
    }

    public function create(Request $request)
    {
        $path = public_path() . '\img\\';

        if ($request->hasFile('image_file')) {
            $create = $this->imageService->createImg($request);
            return $create;
        }
    }

    public function delete(Request $request, Image $image)
    {
        $image->delete();
        unlink($image->image_path);
        return redirect()->route('admin.img');
    }

    public function update(Request $request, Image $image)
    {
        $publish = $request->publish;
        $image->publish = $publish;
        $image->save();

        return $image;
    }
}
