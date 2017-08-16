<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
        공지사항</p>
    </label>
  </div>
  
  <div>
    <table class="table table-default">
      <tr>
        <td><label>최종수정시간</label></td>
        <td>
          <label><fmt:formatDate value="${notice.post_date}" pattern="yyyy-MM-dd HH시 mm분"/></label>
        </td>
      </tr>
      <tr>
        <td><label>제목</label></td>
        <td>
          <label class="lab_title">${notice.title}</label>
          <label id="lab_title" class="lab_title" style="display: none;">
            <input type="text" value="${notice.title}" name="title" id="title">
          </label>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <label style="width: 100%;">
            <textarea id="content" name="content" style="width: 100%;" rows="15" disabled>${notice.content}</textarea>
          </label>
        </td>
      </tr> 
      <tr>
        <td colspan="2" style="text-align: right;">
          <a href="#member_notice_modify"><input type="button" id="btnMod" value="수정하기" class="btn btn-primary"></a>
          <input type="button" id="btnCancel" value="취소" class="btn btn-danger" style="display: none;">
          <input type="button" id="btnOk" value="완료" class="btn btn-success" style="display: none;">
          <label id="mod_insang_spinner" style="display: none;">
            <img style="width: 30px;" src='${path}/admin/resources/adminImages/loader.gif'>
          </label>  
        </td>
      </tr> 
    </table>
  </div>

<script>
$("#btnMod").click(function(){
  $("#content").prop("disabled",false);
  $(".lab_title").toggle();
  $(".btn").toggle();
})
$("#btnOk").click(function(){
  var param= "title="+$("#title").val()+"&content="+$("#content").val();
  $.ajax({
    type: "post",
    url: "${path}/subMenu/member/noticeModify.do",
    data: param,
    success: function(result){
      if (result){
        alert("공지사항이 수정되었습니다.");
        loadSub_memb('notice');
      } else {
        alert("수정이 실패하였습니다. 다시 시도해주세요");
        loadSub_memb('notice');
      }
    }
  })
})
</script>
</body>
</html>