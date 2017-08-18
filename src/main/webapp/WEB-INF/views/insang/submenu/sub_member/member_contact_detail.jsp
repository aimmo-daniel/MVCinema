<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<body>

  <div class="wow fadeIn lab" data-wow-delay="0s">
    <table class="table table-default" style="width: 100%;" style="table-layout: fixed;">
      <tr>
        <td style="width: 25%;">
          <label>
            아이디
          </label>
        </td>
        <td>
          <label>
            ${contactDetail.userid}
          </label>
        </td>
      </tr>
      <tr>
        <td style="width: 25%;">
          <label>
            이름
          </label>
        </td>
        <td>
          <label>
            ${contactDetail.name}
          </label>
        </td>
      </tr>
      <tr>
        <td style="width: 25%;">
          <label>
            제목
          </label>
        </td>
        <td>
          <div>
            <label style="width: 100%;" class="insangContactDetailTitle">
              ${contactDetail.title}
            </label>
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label>
            문의 일자
          </label>
        </td>
        <td>
          <label>
            <fmt:formatDate value="${contactDetail.post_date}" pattern="yyyy-MM-dd HH:mm"/>
          </label>
        </td>
      </tr>
      <tr>
        <td>
          <label>
            질문 내용
          </label>
        </td>
        <td>
          <label style="color: #dd7777;">
            ${contactDetail.content}
          </label>
        </td>
      </tr>
      <tr>
        <td>
          <label>
            답변 상태
          </label>
        </td>
        <td>
          <c:choose>
            <c:when test="${contactDetail.admin_post_date== null}">
              <label style="color: red;">
                대기중
              </label>
            </c:when>
            <c:otherwise>
              <label style="color: green;">
                완료
              </label>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr><td colspan="2"></td></tr>
    </table>
    
    <!-- 답변 폼 -->
    <div id="answerForm" style="display:none">
      <c:choose>
        <c:when test="${contactDetail.admin_post_date== null}">
          <textarea id="text_ok" style="width: 100%; padding: 20px;" rows="10"></textarea>
          <input type="button" id="btn_okAnswer" value="작성완료" class="btn btn-success" style="float: right;">
        </c:when>
        <c:otherwise>
          <div style="color: green;">
            <label>
              답변이 완료된 질문입니다.<br>
              <span style="color: #aa7777;">
                <fmt:formatDate value="${contactDetail.admin_post_date}" pattern="yyyy-MM-dd HH:mm"/>
              </span>
            </label>
          </div>
          <textarea id="text_mod" style="width: 100%; padding: 20px;" rows="10" disabled>${contactDetail.admin_content}</textarea>
          <input type="button" id="modifyForm" value="수정" class="btn btn-default"
            style="float: right; display: block;" onclick="modifyAnswer();">
          <input type="button" id="btn_modAnswer" value="작성완료" class="btn btn-success" style="float: right; display: none;">
        </c:otherwise>
      </c:choose>
    </div>
  </div>
  
<script>
function modifyAnswer(){
  $("#btn_modAnswer").show();
  $("#text_mod").prop("disabled",false);
  $("#modifyForm").hide();
}
function modifyFinish(){
  $("#btn_modAnswer").hide();
  $("#text_mod").prop("disabled",true);
  $("#modifyForm").show();
}
$("#btn_okAnswer").click(function(){
  var text= $("#text_ok").val();
  var param= "answer="+text+"&idx=${contactDetail.idx}"+"&status="+"insert";
  $.ajax({
    type: "post",
    data: param,
    url: "${path}/subMenu/member/contactAnswer.do",
    success: function(result){
      if (result == 'insertok'){
        alert("답변달기 완료");
        modifyFinish();
        loadSub_memb('contact');
      }
    }
  })
});
$("#btn_modAnswer").click(function(){
  var text= $("#text_mod").val();
  var param= "answer="+text+"&idx=${contactDetail.idx}"+"&status="+"modify";
  $.ajax({
    type: "post",
    data: param,
    url: "${path}/subMenu/member/contactAnswer.do",
    success: function(result){
      if (result == 'modifyok'){
        alert("답변 수정 완료");
        modifyFinish();
        loadSub_memb('contact');
      }
    }
  })
});
</script>
</body>
</html>