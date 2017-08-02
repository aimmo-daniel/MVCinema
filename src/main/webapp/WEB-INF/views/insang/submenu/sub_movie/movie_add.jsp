<%@page import="java.util.List"%>
<%@page import="com.comnawa.mvcinema.insang.model.dto.Insang_MovieDTO"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.ui.Model" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp"%>
<style>
.lab {
	transition: color 1s;
}

.lab:hover {
	color: green;
}

.sub_sub_lab {
	margin-left: 50px;
}
</style>
<script>
  
</script>
</head>
<body>

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
        신규 영화 추가</p>
    </label>
  </div>

  <div style="display: none;" id="sub_movie_addMovie_div" class="sub_sub_lab">
    <form name="form1" method="post" action="${path}/subMenu/movie/addMovie.do" enctype="multipart/form-data">
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
          <td>영화감독</td>
          <td><input type="text" name="director" id="director" style="width: 80%;"></td>
        </tr>
        <tr>
          <td>주연배우</td>
          <td><input type="text" name="actors" id="actors" style="width: 80%;"></td>
        </tr>
        <tr>
          <td>줄거리</td>
          <td><textarea name="content" id="content" style="width: 80%;" rows="6"></textarea></td>
        </tr>
        <tr>
          <td>장르</td>
          <td><c:forEach var="genre" items="${genreList}">
              <label style="font-weight: normal;"> <input type="checkbox" id="genre${genre.idx}" value="${genre.genre}">
                ${genre.genre} &nbsp;
              </label>
            </c:forEach> <input type="hidden" name="genre" id="genreResult"></td>
        </tr>
        <tr>
          <td>개봉일</td>
          <td><input type="date" name="release_date" id="release_date"></td>
        </tr>
        <tr>
          <td>상영시간</td>
          <td><input type="number" name="runtime" id="runtime"> 분</td>
        </tr>
        <tr>
          <td>미리보기 동영상</td>
          <td><input type="file" name="filePreview" id="filePreview"></td>
        </tr>
        <tr>
          <td>영화 포스터</td>
          <td><input type="file" name="filePoster" id="filePoster"></td>
        </tr>
        <tr align="center">
          <td colspan="2" style="padding-top: 30px;"><input type="button" id="btnCancel" value="작성취소" class="btn btn-defulat"
            style="color: white;"> &nbsp; <input type="button" id="btnReset" value="다시작성하기" class="btn btn-defulat"
            style="color: white;"> &nbsp; <input type="button" id="btnOk" value="작성완료" class="btn btn-success"></td>
        </tr>
      </table>
    </form>
  </div>

  <div>
    <label for="sub_movie_mod_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_mod_lab" style="font-size: 20px; margin: 40px 20px 20px 20px;">영화
        관리</p>
    </label>
  </div>
  
  <div style="display: none;" id="sub_movie_modMovie_div" class="sub_sub_lab">
    <table class="table" style="width: 100%;">
      <c:forEach var="mod_row" items="${movieList}">
        <tr onclick="showModForm(${mod_row.idx});">
          <td><img src="http://192.168.0.69/mvcinema/img/${mod_row.img_url}" width="240px" height= "280px"></td>
          <td style="height:320px;" align="center">
            <p style="font-weight: bolder; vertical-align: middle; padding-top: 130px; font-size: 30px;" >${mod_row.title}</p>
          </td>
        </tr>
      </c:forEach>
    </table>
    <!-- 수정 눌렀을시 나오는 입력폼 -->
    <hr>
  </div>
  
    <div id="sub_movie_modMovie_div_div" style="visibility: hidden;">
      <form name="form2" method="post" action="${path}/subMenu/movie/modMovie.do" enctype="multipart/form-data">
        <table class="table table-default">
          <tr>
            <td>영화제목</td>
            <td colspan="2"><input type="text" name="title" id="mod_title" style="width: 80%;"></td>
          </tr>
          <tr>
            <td>나이제한</td>
            <td colspan="2"><input type="number" name="age" id="mod_age" style="width: 80%;" min="1" max="120"></td>
          </tr>
          <tr>
            <td>영화감독</td>
            <td colspan="2"><input type="text" name="director" id="mod_director" style="width: 80%;"></td>
          </tr>
          <tr>
            <td>주연배우</td>
            <td colspan="2"><input type="text" name="actors" id="mod_actors" style="width: 80%;"></td>
          </tr>
          <tr>
            <td>줄거리</td>
            <td colspan="2"><textarea name="content" id="mod_content" style="width: 80%;" rows="6"></textarea></td>
          </tr>
          <tr>
            <td>장르</td>
            <td colspan="2">
              <c:forEach var="genre" items="${genreList}">
                <label style="font-weight: normal;"> <input type="checkbox" id="mod_genre${genre.genre}" value="${genre.genre}">
                  ${genre.genre} &nbsp;
                </label>
              </c:forEach> <input type="hidden" name="genre" id="mod_genreResult"></td>
          </tr>
          <tr>
            <td>개봉일</td>
            <td colspan="2"><input type="date" name="release_date" id="mod_release_date"></td>
          </tr>
          <tr>
            <td>상영시간</td>
            <td colspan="2"><input type="number" name="runtime" id="mod_runtime"> 분</td>
          </tr>
          <tr>
            <td>미리보기 동영상</td>
            <td><input type="file" name="filePreview" id="mod_filePreview"></td>
            <td style="width: 120px;"><div id="mod_video"></div></td>
            <td><input type="hidden" name="preview" id="mod_preview" value=""></td>
          </tr>
          <tr>
            <td>영화 포스터</td>
            <td><input type="file" name="filePoster" id="mod_filePoster"></td>
            <td style="width: 120px;"><img src="ad.png" id="mod_img"></td>
            <td><input type="hidden" name="img_url" id="mod_img_url" value=""></td>
          </tr>
          <tr align="center">
            <td colspan="2" style="padding-top: 30px;"><input type="button" id="mod_btnCancel" value="수정취소"
              class="btn btn-defulat" style="color: white;"> &nbsp; <input type="button" id="mod_btnOk" value="수정완료"
              class="btn btn-success" onclick="modMovie()"> <input type="hidden" name="mod_idx" id="mod_idx" value="0"></td>
          </tr>
        </table>
      </form>
    </div>


  <!-- ===================== ㅅㅋ리트 ㄱ가 -->
  <!-- ===================== ㅡㅡㅂㅡ ㅜㄴ -->
  <script>
  function showModForm(idx) {
    /*
     * 영화관리창 영화 상세정보 페이지 벨류 등록
     */

    $("#sub_movie_modMovie_div").css("display", "none");
    $("#sub_movie_modMovie_div_div").css("visibility", "visible");
    $.ajax({
      type : "get",
      url : '${path}/subMenu/movie/movieDetail.do?idx=' + idx,
      success : function(result) {
        $("#mod_idx").val(result.idx);
        $("#mod_title").val(result.title);
        $("#mod_age").val(result.age);
        $("#mod_director").val(result.director);
        $("#mod_actors").val(result.actors);
        $("#mod_content").val(result.content);
        $("#mod_release_date").val(changeDate(result.release_date));
        $("#mod_runtime").val(result.runtime);
        $("#mod_video").html((result.preview != null) ? result.preview : '영상없음');
        $("#mod_img").attr("src",
            "http://192.168.0.69/mvcinema/img/" + result.img_url);
        $("#mod_img_url").val(result.img_url);
        $("#mod_preview").val(result.preview);

        var genres = [];
        genres = result.genre.split(',');
        for (var i = 0; i < genres.length; i++) {
          $("#mod_genre" + genres[i]).prop("checked", true);
        }
      }
    })
  }

  function changeDate(date) {
    date = new Date(parseInt(date));
    // javascript 날짜 객체, parseInt() 숫자로 변환
    year = date.getFullYear(); // 4자리 연도
    month = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date
        .getMonth() + 1);
    day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
    strDate = year + "-" + month + "-" + day;
    return strDate;
  }

  function modMovie() {
    /*
     * ============================================================ 작성완료 버큰을 클릭했을시
     * 장르 배열에서 결과값 뽑아서 문자열로 만들고 hidden태그에 저장
     * ------------------------------------------------------------
     */
    var size = parseInt('${genreSize}', 10);
    var genre = '';
    for (var i = 1; i <= size; i++) {
      if ($("#mod_genre" + i).is(":checked")) {
        genre = genre + ($("#mod_genre" + i).val() + ',');
      }
    }
    genre = genre.slice(0, -1);
    $("#mod_genreResult").val(genre);
    // -- end
    var title = $("#mod_title").val();
    var age = $("#mod_age").val();
    var director = $("#mod_director").val();
    var actors = $("#mod_actors").val();
    var content = $("#mod_content").val();
    var release_date = $("#mod_release_date").val();
    var runtime = $("#mod_runtime").val();
    alert($("#mod_filePreview").val() == '');
    var filePreview = ($("#mod_filePreview").val() == '') ? $("#mod_img_url")
        .val() : $("#mod_filePreview").val();
    var filePoster = ($("#mod_filePoster").val() == '') ? $("#mod_preview").val()
        : $("#mod_filePreview").val();
    if (!$("#mod_filePreview").val() == '') {
      $("#mod_preview").val($("#mod_filePreview").val());
    }
    if (!$("#mod_filePoster").val() == '') {
      $("#mod_img_url").val($("#mod_filePoster").val());
    }
    // ==========================================
    // 업로드 영상 확장자 검사
    // ------------------------------------------
    if ($("#mod_preview").val() == "") {
      if (filePreview.substring(filePreview.lastIndexOf('.')).toLowerCase() != '.mp4'
          && filePreview.substring(filePreview.lastIndexOf('.')).toLowerCase() != '.mkv'
          && filePreview.substring(filePreview.lastIndexOf('.')).toLowerCase() != '.avi'
          && filePreview.substring(filePreview.lastIndexOf('.')).toLowerCase() != '.mov'
          && filePreview.substring(filePreview.lastIndexOf('.')).toLowerCase() != '.m4v') {
        alert("미리보기 동영상은 동영상 파일만 업로드 가능합니다.\n ( mp4, mkv, avi, mov, m4v )");
        return;
      }
    }
    if ($("#mod_img_url").val() == "") {
      if (filePoster.substring(filePoster.lastIndexOf('.')).toLowerCase() != '.jpg'
          && filePoster.substring(filePoster.lastIndexOf('.')).toLowerCase() != '.jpeg'
          && filePoster.substring(filePoster.lastIndexOf('.')).toLowerCase() != '.png') {
        alert("영화 포스터는 사진 파일만 업로드 가능합니다.\n ( jpg, jpeg, png )");
        return;
      }
    }
    // -- end
    /*
     * ========================================= 각 입력항복 비어있는곳 체크 후 알람 띄우기
     * =========================================
     */
    alert("filePreview" + filePreview + "\n" + "filePoster:" + filePoster);
    if (title == '' || age == '' || director == '' || actors == ''
        || content == '' || release_date == '' || runtime == '') {
      alert("입력하지 않은 항목이 있습니다.");
      return;
    }
    // -- end
    document.form2.submit();
  }

  $("#sub_movie_add_lab").click(function() { // 신규영화 div열고닫기
    sub_movie_addMovie_div('sub_movie_addMovie_div');
  });

  $("#sub_movie_mod_lab").click(function() { // 영화관리 div 열고닫기
    sub_movie_addMovie_div('sub_movie_modMovie_div');
  });

  $("#btnCancel").click(function() { // 취소버튼 클릭
    $("#title").val("");
    $("#age").val("");
    $("#director").val("");
    $("#actors").val("");
    $("#content").val("");
    $("#release_date").val("");
    $("#runtime").val("");
    $("#filePreview").val("");
    $("#filePoster").val("");
    // ================
    // 체크박스 초기화
    // ----------------
    for (var i = 1; i <= parseInt('${genreSize}', 10); i++) {
      $("#genre" + i).prop("checked", false);
    }
    // -- end
    // 체크박스초기화 후 div 숨김
    sub_movie_addMovie_div('sub_movie_addMovie_div');
  });

  $("#btnReset").click(function() { // 다시작성하기 버튼 클릭
    $("#title").val("");
    $("#age").val("");
    $("#director").val("");
    $("#actors").val("");
    $("#content").val("");
    $("#release_date").val("");
    $("#runtime").val("");
    $("#filePreview").val("");
    $("#filePoster").val("");
    // ================
    // 체크박스 초기화
    // ----------------
    for (var i = 1; i <= parseInt('${genreSize}', 10); i++) {
      $("#genre" + i).prop("checked", false);
    }
    // -- end
  });

  $("#mod_btnCancel").click(function() {
    $("#sub_movie_modMovie_div").css("display", "block");
    $("#sub_movie_modMovie_div_div").css("visibility", "hidden");
    fnMove();
  })

  $("#btnOk")
      .click(
          function() { // 작성완료 버튼 클릭
            /*
             * ============================================================ 작성완료
             * 버큰을 클릭했을시 장르 배열에서 결과값 뽑아서 문자열로 만들고 hidden태그에 저장
             * ------------------------------------------------------------
             */
            var size = parseInt('${genreSize}', 10);
            var genre = '';
            for (var i = 1; i <= size; i++) {
              if ($("#genre" + i).is(":checked")) {
                genre = genre + ($("#genre" + i).val() + ',');
              }
            }
            genre = genre.slice(0, -1);
            $("#genreResult").val(genre);
            // -- end
            var title = $("#title").val();
            var age = $("#age").val();
            var director = $("#director").val();
            var actors = $("#actors").val();
            var content = $("#content").val();
            var release_date = $("#release_date").val();
            var runtime = $("#runtime").val();
            var filePreview = $("#filePreview").val();
            var filePoster = $("#filePoster").val();
            // ==========================================
            // 업로드 영상 확장자 검사
            // ------------------------------------------
            /*
             * if (filePreview.substring(filePreview.lastIndexOf('.'))
             * .toLowerCase() != '.mp4' &&
             * filePreview.substring(filePreview.lastIndexOf('.')) .toLowerCase() !=
             * '.mkv' && filePreview.substring(filePreview.lastIndexOf('.'))
             * .toLowerCase() != '.avi' &&
             * filePreview.substring(filePreview.lastIndexOf('.')) .toLowerCase() !=
             * '.mov' && filePreview.substring(filePreview.lastIndexOf('.'))
             * .toLowerCase() != '.m4v') { alert("미리보기 동영상은 동영상 파일만 업로드 가능합니다.\n (
             * mp4, mkv, avi, mov, m4v )"); return; }
             */

            if (filePoster.substring(filePoster.lastIndexOf('.')).toLowerCase() != '.jpg'
                && filePoster.substring(filePoster.lastIndexOf('.'))
                    .toLowerCase() != '.jpeg'
                && filePoster.substring(filePoster.lastIndexOf('.'))
                    .toLowerCase() != '.png') {
              alert("영화 포스터는 사진 파일만 업로드 가능합니다.\n ( jpg, jpeg, png )");
              return;
            }
            // -- end
            /*
             * ========================================= 각 입력항복 비어있는곳 체크 후 알람 띄우기
             * =========================================
             */
            if (title == '' || age == '' || director == '' || actors == ''
                || content == '' || release_date == '' || runtime == ''
                || filePoster == '') {
              alert("입력하지 않은 항목이 있습니다.");
              return;
            }
            // -- end
            document.form1.submit();
          });
  </script>
  
</body>
</html>