@extends('backend.layouts.master')
@section('title','聊天區')
@section('js')
<script src="{{ asset('js/index.js') }}" charset="utf-8"></script>
@endsection
@section('content')


<!-- <script src="https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js"></script> -->
<script src="{{ asset('ckeditor4-releases/ckeditor.js') }}" charset="utf-8"></script>
<div class="row container">
    <textarea name="index_content_one" id="photoContent1" url="{{route('admin.check_article')}}" class="materialize-textarea">
        <div class="col s12 m6">
            <div class="card">
                <div class="card-image">
                    <?php $path = explode("\\", $index->photo_path); ?>
                    <img src='{{ asset("img/".$image) }}'>
                    <span class="card-title"> <?php echo (ucfirst($index->username)); ?> </span>
                </div>
                <div class="card-content">
                    <p class="text">
                        {!! nl2br(e($index->content_one )) !!}
                    </p>
                    <p class="text">
                        {!! nl2br(e($index->content_two )) !!}
                    </p>
                </div>
            </div>
        </div>

        <div class="intro col s12 m6">
            <p class="text">
                {{ $student->content }}
            </p>
            @foreach ($student_skills as $StudentSkill)
            <a class="waves-effect waves-light btn"> {{ $StudentSkill['skill_name'] }} </a>
            @endforeach
            <hr>
            <p class="text">
                {{ $worker['content'] }}
                <br>
            </p>
            @foreach ($work_skills as $WorkSkill)
            <a class="waves-effect waves-light btn"> {{ $WorkSkill['skill_name'] }} </a>
            @endforeach
        </div>
    </textarea>
</div>
<script>
    CKEDITOR.replace("index_content_one");
    CKEDITOR.replace("student_content");
    CKEDITOR.replace("worker_content");
</script>


@endsection