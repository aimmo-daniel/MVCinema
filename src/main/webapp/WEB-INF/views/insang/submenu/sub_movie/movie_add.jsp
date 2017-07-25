<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.lab{
  transition: color 1s;
}
.lab:hover {
  color: green;
}
.sub_sub_lab {
  margin-left: 50px;
}
</style>
</head>
<body>

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">신규 영화 추가</p>
    </label>
  </div>
  
  <div style="display: none;" id="sub_movie_addMovie_div" class="sub_sub_lab">
    <form name="form1">
      <table class="table table-default">
        <tr>
          <td>영화제목</td>
          <td><input type="text" name="title" id="title" style="width: 80%;"></td>
        </tr>
        <tr>
          <td>나이제한</td>
          <td><input type="number" name="age" id="age" style="width: 80%;" min="1" max="120"></td>
        </tr>
        <tr>
          <td>영화평점</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>영화감독</td>
          <td><input type="text" name="director" id="director" style="width: 80%;"></td>
        </tr>
        <tr>
          <td>주연배우</td>
          <td><input type="text" name="actors" id="actors" style="width: 80%;"></td>
        </tr>
        <tr>
          <td>줄거리</td>
          <td><textarea name="contents" id="contents" style="width: 80%;" rows="6"></textarea></td>
        </tr>
        <tr>
          <td>장르</td>
          <td>(체크박스필요)</td>
        </tr>
        <tr>
          <td>개봉일</td>
          <td>(날짜선택)</td>
        </tr>
        <tr>
          <td>상영시간</td>
          <td><input type="number" name="runtime" id="runtime"> 분</td>
        </tr>
        <tr>
          <td>미리보기 동영상</td>
          <td>동영상업로드필요</td>
        </tr>
        <tr align="center">
          <td colspan="2" style="padding-top: 30px;">
            <input type="button" id="btnCancel" value="작성취소" class="btn btn-defulat" style="color: white;">
            &nbsp;
            <input type="button" id="btnReset" value="다시작성하기" class="btn btn-defulat" style="color: white;">
            &nbsp;
            <input type="button" id="btnOk" value="작성완료" class="btn btn-success">
          </td>
        </tr>
      </table>
    </form>
  </div>
  
  <div>
    <label for="sub_movie_mod_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_mod_lab" style="font-size: 20px; margin: 40px 20px 20px 20px;">영화 관리</p>
    </label>
  </div>
  
  <div style="display: none;" id="sub_movie_modMovie_div" class="sub_sub_lab">
    shabal
  </div>
  
  
  <script>
  
  	$("#sub_movie_add_lab").click(function(){
  	  sub_movie_addMovie_div('sub_movie_addMovie_div');
  	});
  	
  	$("#sub_movie_mod_lab").click(function(){
  	  sub_movie_addMovie_div('sub_movie_modMovie_div');
  	});
  	
  	$("#btnCancel").click(function(){
  	  $("#title").val("");
  	  $("#age").val("");
  	  $("#director").val("");
  	  $("#actors").val("");
  	  $("#contents").val("");
  	  $("#runtime").val("");
  	  sub_movie_addMovie_div('sub_movie_addMovie_div');
  	});
  	
  	$("#btnReset").click(function(){
  	  $("#title").val("");
  	  $("#age").val("");
  	  $("#director").val("");
  	  $("#actors").val("");
  	  $("#contents").val("");
  	  $("#runtime").val("");
  	});
  	
  </script>
</body>
</html>