@extends('backend.layouts.master')
@section('title','聊天區')
@section('js')
<script src="{{ asset('js/message.js') }}" charset="utf-8"></script>
@endsection
@section('content')

<!-- git clone -b full/latest git://github.com/ckeditor/ckeditor4-releases.git -->
<!-- <script src="https://cdn.ckeditor.com/4.7.3/basic/ckeditor.js"></script> -->
<!-- <script src="{{ asset('ckeditor4-standard/ckeditor.js') }}" charset="utf-8"></script> -->
<script src="{{ asset('ckeditor-full/ckeditor.js') }}" charset="utf-8"></script>
<script type="text/javascript">
    // do this before the first CKEDITOR.replace( ... )
    CKEDITOR.timestamp = 'something_random';
    // 還要清除快取
</script>


<div class="row">
    <form method="post" action="{{route('admin.postTextEdit')}}" class="col s12 loginform" enctype="multipart/form-data">
        {{ csrf_field() }}
        <textarea name="editor1"></textarea>
        <button class="btn waves-effect waves-light test" type="submit">登入
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>
<script>
    CKEDITOR.replace("editor1",);
</script>



@endsection