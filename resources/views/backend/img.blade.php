@section('js')
<script src="{{ asset('js/image.js') }}" charset="utf-8"></script>
@endsection

@extends('backend.layouts.master')
@section('title','編輯相片')

@section('content')
<!-- 新增相片表單 -->
<div class="row container">
  <form id="addimg" action="{{url('admin/img')}}" method="post" class="col s12" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="file-field input-field">
      <div class="btnEdit btn blue-grey lighten-5">
        <span class="black-text">照片</span>
        <input type="file" name="image_file" accept="image/gif, image/jpeg, image/png" required>
      </div>

      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>

    <div class="row">
      <div class="col s6">
        @error('image')
        <p class="red-text">{{ $message }}</p>
        @enderror
 
        <div class="col s12 newimg"></div>
        <button class="btn waves-effect waves-light red lighten-1 delete">
          取消
        </button>
      </div>
    </div>
    <div class="col s12">
      <label>
        <input class="with-gap" name="publish" type="radio" value="1" checked />
        <span>發佈</span>
      </label>
      <label>
        <input class="with-gap" name="publish" type="radio" value="0" />
        <span>不發佈</span>
      </label>
    </div>

    <button class="btn waves-effect waves-light" type="submit" name="action">
      <i class="fas fa-images"></i>
      新增相片
    </button>

  </form>
</div>
<hr>

<!-- 修改相片表單 -->
<div class="row container">


  @foreach ($images as $image)
  <?php $path = explode("\\", $image->image_path); ?>

  <!-- {{$path[7]}} -->

  <div class="img_box col s12 m3">
    <form action='{{url("admin/img/$image->id")}}' method="post" enctype="multipart/form-data">
      @csrf
      @method('DELETE')
      <div class="col s12">
        <img class="responsive-img" src='{{ asset("img/".end($path)) }}'>
      </div>

      <div class="col s12">
        <label>
          <input data-id="{{ $image->id }}" class="with-gap" name="publish" url='{{ route('admin.img_update_publish',['image'=> $image->id]) }}' type="radio" value="1" {{ $image->publish == 1 ? "checked" : "" }}>
          <span>發佈</span>
        </label>
        <label>
          <input data-id="{{ $image->id }}" class="with-gap" name="publish" url='{{ route('admin.img_update_publish',['image'=> $image->id]) }}' type="radio" value="0" {{ $image->publish == 0 ? "checked" : "" }}>
          <span>不發佈</span>
        </label>
      </div>

      <div class="col s12">

      </div>

      <div class="col s12 center">
        <button class="btn waves-effect waves-light red del_img " type="submit">刪除
          <i class="fas fa-trash-alt"></i>
        </button>
      </div>
    </form>
  </div>
  @endforeach
  @endsection