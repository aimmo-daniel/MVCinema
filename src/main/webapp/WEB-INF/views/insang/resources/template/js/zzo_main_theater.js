 /**
 *  관리자 메인소스 head절 최하단 인클루드
 *  영화관리 서브메뉴에 관한 자바스크립트 소스파일
 */

function sub_theater_loadSub(choice){
  var param= choice=='sub_theater_1'?'add':'sit';
  $("#my-spinner").show();
  $.ajax({
    url: "/mvcinema/subMenu/theater/"+param+".do",
    success: function(result){
      $("#my-spinner").hide();
      $("#sub_theater_contents").html(result);
    }
  })
}

function sub_theater_add_addTheater(id, action){
  var target= document.getElementById(id);
  if (action== 'over'){
    $("#"+id).css("color","green");
  } else {
    $("#"+id).css("color","gray");  
  }
}

function loadTheaterDetail(idx){
  var param= "idx="+idx;
  $("#my-spinner").show();
  $.ajax({
    type: "post",
    data: param,
    url: "/mvcinema/subMenu/theater_updateTheaterDetail",
    success: function(result){
      $("#my-spinner").hide();
      $("#sub_theater_contents").html(result);
    }
  })
}