<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<script>
$(function(){
  $("input:radio[name=type_radio]").click(function(){
    var val= $("input:radio[name=type_radio]:checked").val();
    var value;
    if (val=='normal'){
      $("#theaterIDX").val('${idx.max+1}');
      $("#theaterName").val("${idx.count+1}관");
    } else {
      $("#theaterIDX").val('${idx.imax+1}');
      $("#theaterName").val('${idx.count+1}관 (IMAX)')
    }
  })
})
</script>
</head>
<body>

  <div>
    <label for="sub_tdeater_subject">
      <p class="wow fadeIn" data-wow-delay="0s">상영관 추가</p>
    </label>
  </div>
  
  <div class="container" style="width: 100%;">
    <table class="table" border="0">
      <tr style="width:80%;">
        <td colspan="2">상영관 타입</td>
        <td>
          <input type="radio" name="type_radio" value="normal" checked> 일반 상영관 &nbsp;
          <input type="radio" name="type_radio" value="imax"> 아이맥스 상영관
        </td>
        <td><input type="hidden" value="${idx.max+1}" id="theaterIDX" disabled></td>
        <td><input type="hidden" value="${idx.count+1}관" id="theaterName"></td>
      </tr>
      <tr>
        <td>가로 좌석</td>
        <td colspan="2"><input type="number" widtd="20px" min="1"></td>
      </tr>
      <tr>
        <td>세로 좌석</td>
        <td colspan="2"><input type="number" widtd="20px" min="1"></td>
      </tr>
      <tr>
        <td>추가 요금</td>
        <td colspan="2"><input type="number"></td>
      </tr>
      <tr>
        <td>한줄 설명</td>
        <td colspan="2"><textarea></textarea></td>
      </tr>
      <tr>
        <td colspan="3" align="right"><button type="button">등록 긔긔</button></td>
      </tr>
    </table>
  </div>

</body>
</html>