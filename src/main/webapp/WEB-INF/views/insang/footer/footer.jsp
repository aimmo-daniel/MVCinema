<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.footer1 li {
  display: inline;
  border-right: 1px solid gray;
  padding-right: 1%;
  padding-left: 0px;
}
.footer2 li {
  display: inline;
}
</style>
</head>
<body>

  <!-- Footer section -->
  <footer style="padding: 3%; background-color: #221f1f;">
    <div class="container">
      <div class="row">

        <div>
          <span style="float: left;">
            <label>
              <h2 style="float: left; color: lightgray; font-size: x-large; font-weight: bold;">
                영화 그 이상의 감동 MVCinema
              </h2>
              <br><br><br>
              <h3 style="color: lightgray;">
                서울특별시 성동구 도선동 39-1 신방빌딩 4층 미래능력개발교육원 1강의실
              </h3>
              <h3 style="color: gray; padding-top:20px; text-align: left;">
                <ul style="border-right: none; width: 100%;" class="footer1">
                  <li><a href="#">회사소개</a></li>
                  <li><a href="#">채용정보</a></li>
                  <li><a href="#">제휴/광고/부대사업 문의</a></li>
                  <li style="border-right: none;"><a href="#">이용약관</a></li>
                </ul>
              </h3>
              <h3 style="color: gray; float: left;">
                product by Comnawa.
              </h3>
            </label>
          </span>
          <span style="float: right;">
            <label style="font-size: x-large; padding-top: 60px;">
              <font color="gray">ARS</font>
              <font color="lightgray">1544-7700</font>
            </label>
            <ul class="footer2" style="padding-top: 30px; padding-right: 60px;">
              <li><a href="#">
                <img src="${path}/admin/resources/adminImages/footerImg/twitter.png" style="width: 40px; height: auto;">
              </a></li>
              <li><a href="#">
                <img src="${path}/admin/resources/adminImages/footerImg/fb.png" style="width: 40px; height: auto;">
              </a></li>
              <li><a href="#">
                <img src="${path}/admin/resources/adminImages/footerImg/instargram.png" style="width: 40px; height: auto;">
              </a></li>
              <li><a href="#">
                <img src="${path}/admin/resources/adminImages/footerImg/playstore.png" style="width: 40px; height: auto;">
              </a></li>
              <li><a href="#">
                <img src="${path}/admin/resources/adminImages/footerImg/apple.png" style="width: 40px; height: auto;">
              </a></li>
            </ul>
          </span>
        </div>

      </div>
    </div>
  </footer>

</body>
</html>