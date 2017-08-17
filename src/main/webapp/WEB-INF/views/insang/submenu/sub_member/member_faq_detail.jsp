<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<style>
.table > tbody > tr > td {
  vertical-align: middle;
}
</style>
</head>
<body>

  <c:choose>
    <c:when test="${result == 'faq'}">
      <c:set var="faqListSize" value="${fn:length(faqList)}"/>
      <!-- faq -->
      <table class="table table-default">
        <tr style="text-align: center;">
          <td style="width: 30%; border-right: 1px solid lightgray;">
            <label>카테고리</label>
          </td>
          <td style="width: 70%;" colspan="2">
            <label>질문</label>
          </td>
        </tr>
        <c:forEach var="row" items="${faqList}" varStatus="status">
          <tr onclick="faq_showAsk('${status.count}')">
            <td style="text-align: center; border-right: 1px solid lightgray;">
              <label>${row.category}</label>
            </td>
            <td>
              <label>${row.question}</label>
            </td>
            <td style="width: 10%;">
              <input type="button" class="btn btn-danger" value="삭제" style="float: right; width: 100%;" onclick="faq_delAsk('${row.idx}')">
            </td>
          </tr>
          <tr id="ask${status.count}" style="display: none;">
            <td colspan="3">
              <label style="font-size: 20px; color: green; padding: 10px;">
                ${row.ask}
              </label>
            </td>
          </tr>
        </c:forEach>  
      </table>
      <input type="button" id="add_faq" value="faq추가" class="btn btn-primary" style="float: right;"
        onclick="$('#faq_addForm').toggle();">
      
    </c:when>
    
    <c:when test="${result == 'category'}">
    
      <!-- category -->
      <table class="table table-default">
        <tr>
          <td style="text-align: center;" colspan="3">
            <label style="font-size: 17px;">카테고리명</label>
          </td>
        </tr>
        <c:forEach var="row" items="${categoryList}" varStatus="status">
          <tr>
            <td style="text-align: center; width: 30%; border-right: 1px solid lightgray;">
              <label style="font-size: 20px; color: gray;">${status.count}</label>
            </td>
            <td style="text-align: center; width: 70%;">
              <label style="font-size: 20px; color: green;">${row.category}</label>
            </td>
            <td>
              <input type="button" value="삭제" class="btn btn-danger" onclick="faq_delCategory('${row.idx}')">
            </td>
          </tr>
        </c:forEach>
      </table>  
      <input type="button" id="add_category" value="카테고리 추가" class="btn btn-primary"
        style="float: right;" onclick="$('#category_addForm').toggle();">
      
    </c:when>
  </c:choose>
  
  <!-- faq addForm -->
  <div style="margin-top: 100px; display: none;" id="faq_addForm">
    <table class="table table-default">
      <tr>
        <td style="width: 30%; text-align: center;"><label>카테고리</label></td>
        <td style="width: 70%; text-align: center;">
          <select id="faq_category">
            <c:forEach var="rows" items="${categoryList}">
              <option value="${rows.idx}">${rows.category}</option>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td style="text-align: center;"><label>질문</label></td>
        <td style="text-align: center;">
          <input type="text" style="width: 100%;" id="faq_question">
        </td>
      </tr>
      <tr>
        <td style="text-align: center;"><label>답변</label></td>
        <td style="text-align: center;">
          <textarea rows="10" style="width: 100%;" id="faq_ask"></textarea>
        </td>
      </tr>
    </table>
    <input type="button" value="등록" id="insert_faq2" style="float: right;" class="btn btn-success">
  </div>
  
  <!-- category addForm -->
  <div style="margin-top: 100px; display: none;" id="category_addForm">
    <table class="table table-default">
      <tr>
        <td style="width: 30%; text-align: center;"><label>카테고리명</label></td>
        <td style="width: 70%; text-align: center;"><input type="text" id="category_name" style="width: 100%;"></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" id="insert_category" value="등록" class="btn btn-success" style="float: right;"> 
        </td>
      </tr>
    </table>
  </div>
  
<script>

function faq_delCategory(idx){
  if (confirm("카테고리 삭제시 이 카테고리가 적용되어있는 faq또한 삭제됩니다.\n진행하시겠습니까?")){
    $.ajax({
      type: "get",
      url: "${path}/subMenu/member/deleteCategory.do?idx="+idx,
      success: function(result){
        if (result=='success'){
          alert("삭제 성공");
          faq_submenu('category');
        }
      }
    })
  }
}

function faq_delAsk(idx){
  if (confirm("삭제하시겠습니까?")){
    $.ajax({
      type: "get",
      url: "${path}/subMenu/member/deleteFaq.do?idx="+idx,
      success: function(result){
        if (result=='success'){
          alert("삭제 성공");
          faq_submenu('faq');
        }
      }
    })
  }
}

function faq_showAsk(idx){
  for (var i=1; i<=${faqListSize}; i++){
    if (i==idx){
      continue;
    }
    $("#ask"+i).hide();
  }
  $("#ask"+idx).toggle();
}

$("#insert_category").click(function(){
  var value= $("#category_name").val();
  $.ajax({
    type: "get",
    url: "${path}/subMenu/member/insertCategory.do?category="+value,
    success: function(result){
      if (result=='success'){
        alert("카테고리가 등록되었습니다.");
        faq_submenu('category');
      }
    }
  })
});

$("#insert_faq2").click(function(){
  var question= $("#faq_question").val();
  var ask= $("#faq_ask").val();
  var category_idx= $("#faq_category option:selected").val();
  var param= "ask="+ask+"&question="+question+"&category_idx="+category_idx;
  $.ajax({
    type: "post",
    url: "${path}/subMenu/member/insertFaq.do",
    data: param,
    success: function(result){
      if (result=='success'){
        alert("FAQ 가 등록되었습니다.");
        faq_submenu('faq');
      }  
    }
  })
});

</script>
</body>
</html>