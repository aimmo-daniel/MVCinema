/**
 * 관리자 메인화면 head절 제일 하단 인클루드
 * 관리자화면 전체포괄하는 javascript 소스코드
 */

function scrollReset(){
  $('html, body').animate({scrollTop : 300},10);
  $('html, body').animate({scrollTop : 0},10);
}

function loadSubMenu(select){
  $("#my-spinner").show();
  $.ajax({
    url: "/mvcinema/subMenu/"+select+".do",
    success: function(result){
      if (select.indexOf("_")!= -1){
        switch (select){
        case 'theater_addTheater':
          $("#my-spinner").hide();
          $("#sub_theater_contents").html(result);
          break;
        }
      } else {
        $("#my-spinner").hide();
        $("#zzo_contents").html(result);
      }
    }
  });
}

function fnMove(){
  var offset = $("#zzo_section").offset();
  $('html, body').animate({scrollTop : offset.top-100}, 300);
}

function fnScroll(value,animtime,y){
  var offset= $("#"+value).offset();
  $('html, body').animate({scrollTop : offset.top-y},animtime)
}

function sub_theater(choice, value1, value2, value3){
  switch (choice){
  case 'sub_sub_mouseOver':
    var target= document.getElementById(value2);
    if (value1=='over'){
      target.style.color='green';
    } else if (value1== 'out') {
    target.style.color='black';
    }
    break;
  case '':
    break;
  }
}