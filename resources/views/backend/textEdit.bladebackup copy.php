@extends('backend.layouts.master')
@section('title','聊天區')
@section('js')
<script src="{{ asset('js/message.js') }}" charset="utf-8"></script>
@endsection
@section('content')

<!-- git clone -b full/latest git://github.com/ckeditor/ckeditor4-releases.git -->
<!-- <script src="https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js"></script> -->
<script src="{{ asset('ckeditor4-releases/ckeditor.js') }}" charset="utf-8"></script>
<div class="row">
    <form method="post" action="{{route('admin.postTextEdit')}}" class="col s12 loginform" enctype="multipart/form-data">
        {{ csrf_field() }}
        <textarea name="editor1"></textarea>
        <button class="btn waves-effect waves-light test" type="submit">登入
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>
<div class="row">
    <form method="post" action="{{route('admin.postTextEdit')}}" class="col s12 loginform" enctype="multipart/form-data">
        {{ csrf_field() }}
        <textarea name="editor2"></textarea>
        <button class="btn waves-effect waves-light test" type="submit">登入
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>
<script>
    CKEDITOR.replace("editor1");
</script>
<script>
    CKEDITOR.replace("editor2");
</script>


@endsection