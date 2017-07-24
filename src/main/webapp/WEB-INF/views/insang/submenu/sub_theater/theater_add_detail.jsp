<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
<script>
$(function(){
  
  console.log("index:"+$("#theaterIDX").val());
  console.log("name:"+$("#theaterName").val());
  
  $("input:radio[name=type_radio]").click(function(){
    var val= $("input:radio[name=type_radio]:checked").val();
    if (val=='normal' && '${map.name}'.indexOf('IMAX')!= -1){
      $("#theaterIDX").val('${map.max.max+1}');
      $("#theaterName").val('${map.name}'.split(" ")[0]);
    } else if (val=='imax' && '${map.name}'.indexOf('IMAX')== -1){
      $("#theaterIDX").val('${map.max.imax+1}');
      $("#theaterName").val('${map.name} (IMAX)');
    }
  })
  
  $("#btnAddTheaterDetail").click(function(){
    if ($("#addTheater_cols").val() == ''){
      alert('입력하지 않은 사항이있습니다. 입력후 다시시도해주세요');
      $("#addTheater_cols").focus();
      return;
    }
    if ($("#addTheater_rows").val() == ''){
      alert('입력하지 않은 사항이있습니다. 입력후 다시시도해주세요');
      $("#addTheater_rows").focus();
      return;
    }
    if ($("#addTheater_price").val() == ''){
      alert('입력하지 않은 사항이있습니다. 입력후 다시시도해주세요');
      $("#addTheater_price").focus();
      return;
    }
    if ($("#addTheater_preview").val() == ''){
      alert('입력하지 않은 사항이있습니다. 입력후 다시시도해주세요');
      $("#addTheater_preview").focus();
      return;
    }
    document.form1.submit();
  })
})
</script>
</head>
<body>

  <div>
    <label for="sub_tdeater_subject">
      <p class="wow fadeIn" data-wow-delay="0s">상영관 관리</p>
    </label>
  </div>
  
  <div class="container" style="width: 100%;">
    <form name="form1" id="form1" method="post" action="${path}/subMenu/theater_updateTheater.do">
      <table class="table">
        <tr style="width:80%;">
          <td colspan="2">상영관 타입</td>
          <td>
            <input type="radio" name="type_radio" value="normal" id="radio_normal"> 일반 상영관 &nbsp;
            <input type="radio" name="type_radio" value="imax" id="radio_imax"> 아이맥스 상영관
          </td>
          <td><input type="hidden" value="" id="theaterIDX" name="idx"></td>
          <td>
            <input type="hidden" value="${idx.count+1}관" id="theaterName" name="name">
            <input type="hidden" value="" id="primaryIDX" name="primaryIDX">
            <input type="hidden" value="" id="primaryName" name="primaryName">
          </td>
        </tr>
        <tr>
          <td>가로 좌석</td>
          <td colspan="2"><input type="number" widtd="20px" min="1" id="addTheater_cols" name="cols"></td>
        </tr>
        <tr>
          <td>세로 좌석</td>
          <td colspan="2"><input type="number" widtd="20px" min="1" id="addTheater_rows" name="rows"></td>
        </tr>
        <tr>
          <td>추가 요금</td>
          <td colspan="2"><input type="number" id="addTheater_price" name="price"></td>
        </tr>
        <tr>
          <td>한줄 설명</td>
          <td colspan="2"><textarea id="addTheater_preview" name="preview"></textarea></td>
        </tr>
        <tr>
          <td colspan="3" align="right"><button type="button" id="btnAddTheaterDetail">수정 긔긔</button></td>
        </tr>
      </table>
    </form>
  </div>

<script>
  if ('${map.name}'.indexOf('IMAX')!= -1){
    $("#radio_imax").attr("checked", "checked");
  } else {
    $("#radio_normal").attr("checked", "checked");
  }
  $("#primaryIDX").val('${map.idx}');
  $("#primaryName").val('${map.name}');
  $("#theaterIDX").val('${map.idx}');
  $("#theaterName").val('${map.name}');
  $("#addTheater_cols").val('${map.cols}');
  $("#addTheater_rows").val('${map.rows}');
  $("#addTheater_price").val('${map.price}');
  $("#addTheater_preview").val('${map.preview}');
</script>

</body>
</html>