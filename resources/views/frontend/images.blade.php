@extends('frontend.layouts.master')
@section('title','BK-Web')
@section('content')
<div class="carousel">
    @foreach($ImgPublish as $image)
    <?php $path = explode("\\", $image->image_path); ?>
    <a class="carousel-item" href="#one!"><img src='{{ asset("img/".end($path)) }}'></a>
    @endforeach
</div>
@endsection