<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp"%>
</head>
<body>

  <%
  char row_en= 'A';
  pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
  %>

  <div style="height: ${theaterSitMax * 28}px; border: 1px solid rgba(250,190,230,.4); text-align: center; padding-top: 10px;"
    id="zzo_theaterThumbDiv">
    <label for="zzo_theaterThumb">
      <table style="width: 100%;" id="zzo_theaterThumb">
        <tr>
          <th colspan="${theaterSitDTO.seat_col +2}" style="text-align: center;">| SCREEN |</th>
        </tr>
        <tr>
          <th>&nbsp;</th>
        </tr>
        <c:forEach var="rows" begin="1" end="${theaterSitDTO.seat_row}">
          <tr>
            <td>&nbsp;</td>
            <td><font color="lightgray"><b><%=row_en%></b></font></td>
            <c:forEach var="cols" begin="1" end="${theaterSitDTO.seat_col}">
              <td style="width: 30px;" onclick="addEmpty('${pageScope.row_en}${cols}')">
                <c:set var="emptyResult" value="false"/>
                <c:set value="${pageScope.row_en}${cols}" var="sit_empty"/>
                  <c:forEach var="theaterSit" items="${theater_sit_empty}">
                    <c:if test="${theaterSit.seat_empty==sit_empty && idx == theaterSit.idx}">
                      <c:set var="emptyResult" value="true"/>
                      <span id="seat${pageScope.row_en}${cols}"></span>
                    </c:if>
                  </c:forEach>
                  <c:if test="${emptyResult==false}">
                    <span id="seat${pageScope.row_en}${cols}"> ${cols} </span>
                  </c:if>
              </td>
            </c:forEach>
            <td>&nbsp;</td>
          </tr>
          <%
            row_en++;
            pageContext.setAttribute("row_en", String.valueOf(row_en).toLowerCase());
          %>
        </c:forEach>
      </table>
    </label>
  </div>
  
  <div>
    <h1>제외할 좌석을 클릭해주세요</h1>
    <p style="font-weight: bold; color: red;">
      <input type="text" disabled style="width: 80%;" name="add_seat_empty" id="add_seat_empty" value="${theater_sit_empty_result}">
      <input type="button" value="저장" style="float: right;" class="btn btn-success" id="btn_save">
      <label id="insang_spinner" style="display: none;">
        <img style="width: 30px;" src='${path}/admin/resources/adminImages/loader.gif'>
      </label>
      <input type="hidden" value="${idx}" id="idxx">
    </p>
  </div>

  <script>
  function addEmpty(value){
    var val= ( $("#add_seat_empty").val()!="" ) ? $("#add_seat_empty").val()+',' : "";
    if ($("#seat"+value).text()!=""){
      $("#seat"+value).text("");
      $("#add_seat_empty").val(val+value);
    } else {
      $("#seat"+value).text(value.replace(/[^0-9]/,""));
      var empties= $("#add_seat_empty").val().split(",");
      var empResult= "";
      for (var i=0; i<empties.length; i++){
        if (empties[i] != value){
          empResult+=empties[i]+',';
        }
      }
      $("#add_seat_empty").val(empResult.substring(0,empResult.length-1));
    }
  }
  
  $("#btn_save").click(function(){
    $("#btn_save").hide();
    $("#insang_spinner").show();
    var param= "sit="+$("#add_seat_empty").val()+"&idx="+$("#idxx").val();
    $.ajax({
      type: "get",
      url: "${path}/subMenu/theater/updateSit.do?"+param,
      success: function(){
        alert("좌석 배치에 성공하였습니다.");
        location.href="${path}/admin";
      }
    })
  })
  </script>

</body>
</html>