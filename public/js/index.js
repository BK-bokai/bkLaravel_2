$(document).ready(function () {
  $('button#index_img').on('click', function () {
    let url = $(this).attr('url');
    window.location.href = url;
  })



  $("textarea[name='index_content_one'],textarea[name='index_content_two'],textarea[name='student_content'],textarea[name='worker_content']").on('keyup', function () {
    let url = $(this).attr('url');
    let index_content_one = $("textarea[name='index_content_one']").val();
    let index_content_two = $("textarea[name='index_content_two']").val();
    let student_content = $("textarea[name='student_content']").val();
    let worker_content = $("textarea[name='worker_content']").val();
    $.ajax({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      type: "POST",
      url: url,
      data: {
        index_content_one: index_content_one,
        index_content_two: index_content_two,
        student_content: student_content,
        worker_content: worker_content,
      },
      dataType: 'json',
      success: function (data) {
        console.log(data);
        console.log("ajax success");

        if (data['change'] == 1) {
          $("button#index_submit").removeClass('disabled');
        }
        else {
          $("button#index_submit").addClass('disabled');
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.responseText);
      }
    })

  })


  $('button#index_submit').on('click', function () {
    let index_content_one = $("textarea[name='index_content_one']").val();
    let index_content_two = $("textarea[name='index_content_two']").val();
    let student_content = $("textarea[name='student_content']").val();
    let worker_content = $("textarea[name='worker_content']").val();
    let url = $(this).attr('url');
    // alert(url);
    $.ajax({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      type: "PUT",
      url: url,
      data: {
        index_content_one: index_content_one,
        index_content_two: index_content_two,
        student_content: student_content,
        worker_content: worker_content,
      },
      dataType: 'json',
      success: function (data) {
        console.log(data);
        console.log("ajax success");
        window.location.reload();

      },
      error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.responseText);
      }
    })

  })

  $('a.studentskill_del').on('click', function () {
    let url = $(this).attr('url');
    let target = $(this).parent().parent();
    alert(url)
    swal({
      title: "Are you sure?",
      text: "你確定要刪除嗎?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Yes, 確認刪除!",
      cancelButtonText: "No, 取消動作!",
      closeOnConfirm: false,
      closeOnCancel: false
    },
      function (isConfirm) {
        if (isConfirm) {
          $.ajax({
            headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "DELETE",
            url: url,
            dataType: 'json',
            success: function (data) {
              swal("確認刪除", "已刪除此技能", "success")
              target.slideUp()
              console.log(data);
              console.log("ajax success");
            }
          })
        }
        else {
          swal("取消動作", "已取消剛剛請求！", "success")
        }
      });

  })

  $('a.workskill_del').on('click', function () {
    let url = $(this).attr('url');
    let target = $(this).parent().parent();
    alert(url)

    swal({
      title: "Are you sure?",
      text: "你確定要刪除嗎?",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Yes, 確認刪除!",
      cancelButtonText: "No, 取消動作!",
      closeOnConfirm: false,
      closeOnCancel: false
    },
      function (isConfirm) {
        if (isConfirm) {
          $.ajax({
            headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "DELETE",
            url: url,
            dataType: 'json',
            success: function (data) {
              swal("確認刪除", "已刪除此技能", "success");
              target.slideUp();
              console.log(data);
              console.log("ajax success");
            }
          })
        }
        else {
          swal("取消動作", "已取消剛剛請求！", "success")
        }
      });
  })

  // $("form#add_student_skill").on('submit',function(e){
  //   e.preventDefault();
  //   alert('123')
  // })


})
