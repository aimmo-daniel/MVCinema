<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../include/header.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">
<title>MVCinema AdminPage</title>
<!-- insang include css -->
<link rel="stylesheet" href="${path}/admin/resources/template/css/zzo_style_login.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${path}/admin/resources/template/css/bootstrap.min.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="${path}/admin/resources/template/css/animate.min.css">
<!-- Font Icons CSS -->
<link rel="stylesheet" href="${path}/admin/resources/template/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/admin/resources/template/css/ionicons.min.css">
<!-- Main CSS -->
<link rel="stylesheet" href="${path}/admin/resources/template/css/style.css">
<!-- Google web font --> 
<link href='${path}/admin/resources/template/css/fontSansPro.css' rel='stylesheet' type='text/css'>

<script>
$(function(){
  document.location.href=document.location.href.split('#')[0]+"#admin";
  scrollReset();
})

$(window).bind('hashchange',function(){
  var menuName= document.location.hash.split('#')[1];
  if (menuName.indexOf('Theater_detailTheater')!= -1){
    var idx= menuName.split('?')[1];
    loadTheaterDetail(idx);
    return;
  }
  loadSubMenu(menuName);
  if (menuName == 'admin'){
    scrollReset();
  } else {
    fnMove();
  }
  if (menuName=='theater' || menuName=='member' || menuName=='movie' || menuName=='option'){
    $("#section_theater").css("color","black");
    $("#section_member").css("color","black");
    $("#section_movie").css("color","black");
    $("#section_option").css("color","black");
    $("#section_"+menuName).css("color","green");
  }
  if (menuName=='theater_add' || menuName=='theater_sit'){
    $("#sub_theater_1").css("color","black");
    $("#sub_theater_2").css("color","black");
    $("#zzo_addTheater1_label").attr("onmouseout","sub_theater('sub_sub_mouseOver','out','sub_theater_1')");
    $("#zzo_addTheater2_label").attr("onmouseout","sub_theater('sub_sub_mouseOver','out','sub_theater_2')");
    if (menuName=='theater_add'){
      $("#sub_theater_1").css("color","green");
      $("#zzo_addTheater1_label").attr("onmouseout","");
    } else if (menuName=='theater_sit') {
      $("#sub_theater_2").css("color","green");
      $("#zzo_addTheater2_label").attr("onmouseout","");
    }
  }
})
</script>
</head>
<body>


  <c:if test="${result != null}">
    <script>
    if ('${result}' == 'modTheater'){
      alert('상영관 수정에 성공하였습니다.');
      loadSubMenu('theater');
   	  fnMove();
    } else {
      alert("로그인에 실패하였습니다. \n 아이디 또는 비밀번호를 확인해주세요");
    }
    </script>
  </c:if>
  
  <!-- Preloader section -->
  <div class="preloader" id="zzo_preloader">

    <div class="sk-spinner sk-spinner-pulse"></div>

  </div>


  <!-- Navigation section -->
  <div class="nav-container" id="zzo_nav-container">
    <nav class="nav-inner transparent">

      <div class="navbar">
        <div class="container">
          <div class="row">

            <div class="brand">
              <a href="${path}/admin/resources/loginpage.do">ADMIN PAGE</a>
            </div>

            <div class="navicon">
              <div class="menu-container">

                <div class="circle dark inline">
                  <i class="icon ion-navicon"></i>
                </div>

                <div class="list-menu">
                  <i class="icon ion-close-round close-iframe"></i>
                  <div class="intro-inner">
                    <ul id="nav-menu">
                      <li><a href="index.html">Home</a></li>
                      <li><a href="about.html">About</a></li>
                      <li><a href="blog.html">Blog</a></li>
                      <li><a href="contact.html">Contact</a></li>
                    </ul>
                  </div>
                </div>

              </div>
            </div>

          </div>
        </div>
      </div>

    </nav>
  </div>


  <!-- Header section -->
  <section id="header" class="header-four">
    <div class="container">
      <div class="row">

        <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
          <div class="header-thumb">
            <!-- <h1 class="wow fadeIn" data-wow-delay="0.6s"><input ></h1>
                   <h3 class="wow fadeInUp" data-wow-delay="0.9s">Vestibulum at aliquam lorem</h3> -->
            <c:if test="${sessionScope.dto.id== null}">       
              <form name="form1" id="form1" method="post" action="${path}/admin/login.do">
                <table class="wow fadeIn" data-wow-delay="1.2s" style="width:100%; font-size: 20px; margin-right: 2%;">
                  <tr>
                    <td style="padding: 2%;"><label for="inputId"><b>I D</b></label></td>
                    <td style="padding: 2%;">
                      <input type="text" name="id" id="inputId" style="width: 70%;" tabindex="1">
                    </td>
                    <td rowspan="2" style="padding-right: 2%; text-align: center;">
                      <button class="btn btn-default" style="height: 95%; width: 100%; font-size: 18px;" tabindex="3">Login</button>
                    </td>
                  </tr>
                  <tr style="height: 30%;">
                    <td style="padding: 2%;"><label for="inputPw"><b>P W</b></label></td>
                    <td style="padding: 2%;">
                      <input type="password" name="passwd" id="inputPw" style="width: 70%;" tabindex="2">
                    </td>
                  </tr>
                </table>
              </form>
            </c:if>
            <c:if test="${sessionScope.dto.id!= null}">
              <table style="width: 100%; height: 100%; font-size: 20px;" class="wow fadeIn" data-wow-delay="1.2s">
                <tr>
                  <td style="text-align: left; padding-left: 15%;">
                    <b>${sessionScope.dto.name} 님 환영합니다!</b>
                  </td>
                  <td style="padding-right: 10%;">
                    <button type="button" class="btn btn-info"
                      style="width: 100%; font-size: 18px;" onclick="location.href='${path}/admin/logout.do'">LogOut</button>
                  </td>
                </tr>
              </table>
            </c:if>
            
          </div>
        </div>

      </div>
    </div>
  </section>


  <!-- Contact section -->

  <div class="zzo_section" id="zzo_section">
    <div class="container">
      <div class="wow fadeInUp" data-wow-delay="1.3s">
        <c:if test="${sessionScope.dto.id!= null}">
          <ul class="zzo_subMenu" align="center">
            <li>
              <a href="#theater" id="section_theater"><b>상영관 관리</b></a>
            </li>
            <li>
              <a href="#member" id="section_member"><b>회원 관리</b></a>
            </li>
            <li>
              <a href="#movie" id="section_movie"><b>영화 관리</b></a>
            </li>
            <li>
              <a href="#option" id="section_option"><b>매출 확인</b></a>
            </li>
          </ul>
        </c:if>
      </div>
    </div>
  </div>

  <div id="zzo_contents" class="container">
  </div>

  <!-- Footer section -->
  <footer>
    <div class="container">
      <div class="row">

        <div class="col-md-12 col-sm-12">
          <p class="wow fadeInUp" data-wow-delay="0.3s">Copyright © 2016 Your Company Name - Designed by Tooplate</p>
        </div>

      </div>
    </div>
  </footer>

  <!-- Javascript -->
  <script src="${path}/admin/resources/template/js/jquery.js"></script>
  <script src="${path}/admin/resources/template/js/bootstrap.min.js"></script>
  <script src="${path}/admin/resources/template/js/wow.min.js"></script>
  <script src="${path}/admin/resources/template/js/custom.js"></script>
  <!-- insang Javascript -->
  <script src="${path}/subMenu/resources/template/js/zzo_main.js?v1" charset="utf-8"></script>
  <script src="${path}/subMenu/resources/template/js/zzo_main_theater.js?v1" charset="utf-8"></script>
  <script src="${path}/subMenu/resources/template/js/zzo_main_movie.js?v1" charset="utf-8"></script>
</body>
</html>
