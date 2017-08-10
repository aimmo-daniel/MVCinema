<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../../include/header.jsp" %>
</head>
<style>
.tableHover {
  transition: color 0.5s;
}
.tableHover:hover {
  color: green;
}
.table > tbody > tr > td {
  vertical-align: middle;
}
</style>
<body>

  <div>
    <label for="sub_movie_add_lab">
      <p class="wow fadeIn lab" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">
        FAQ 관리</p>
    </label>
  </div>

  <div>
    <table class="table table-default">
      <tr>
        <td style="width: 50%; text-align: center;" onclick="faq_submenu('faq')">
          <div>
            <label for="sub_movie_add_lab">
              <p class="wow fadeIn lab tableHover" data-wow-delay="0s" style="font-size: 15px;" id="sub_movie_add_lab">
                FAQ</p>
            </label>
          </div>
        </td>
        <td style="width: 50%; text-align: center;" onclick="faq_submenu('category')">
          <label for="sub_movie_add_lab" class="tableHover">
            <p class="wow fadeIn lab tableHover" data-wow-delay="0s" id="sub_movie_add_lab">
              Category</p>
          </label>
        </td>
      </tr>
    </table>
  </div>
  
  <div id="faq_submenu"></div>

<script>
function faq_submenu(menu){
  $.ajax({
    type: "get",
    url: "${path}/subMenu/member/faq_detail.do?menu="+menu,
    success: function(result){
      $("#faq_submenu").html(result);
    }
  })
}
</script>  
</body>
</html>