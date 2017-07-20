<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../include/header.jsp"%>
<head>
<!--

Template 2082 Pure Mix

http://www.tooplate.com/view/2082-pure-mix

-->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<meta name="description" content="">

<!-- Site title
   ================================================== -->
<title>Pure Mix - Contact</title>

<!-- Bootstrap CSS
   ================================================== -->
<link rel="stylesheet" href="${path}/admin/template/css/bootstrap.min.css">

<!-- Animate CSS
   ================================================== -->
<link rel="stylesheet" href="${path}/admin/template/css/animate.min.css">

<!-- Font Icons CSS
   ================================================== -->
<link rel="stylesheet" href="${path}/admin/template/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/admin/template/css/ionicons.min.css">

<!-- Main CSS
   ================================================== -->
<link rel="stylesheet" href="${path}/admin/template/css/style.css">

<!-- Google web font 
   ================================================== -->
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'>
<style>
.zzo_subMenu {
  list-style-type: none;
}
.zzo_subMenu li {
  display: inline;
  padding-right: 6%;
  font-size: 20px;
}
.zzo_section {
  margin: 5%;
}
</style>
</head>
<body>


  <!-- Preloader section
================================================== -->
  <div class="preloader">

    <div class="sk-spinner sk-spinner-pulse"></div>

  </div>


  <!-- Navigation section
================================================== -->
  <div class="nav-container">
    <nav class="nav-inner transparent">

      <div class="navbar">
        <div class="container">
          <div class="row">

            <div class="brand">
              <a href="${path}/admin/login.do">ADMIN PAGE</a>
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


  <!-- Header section
================================================== -->
  <section id="header" class="header-four">
    <div class="container">
      <div class="row">

        <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
          <div class="header-thumb">
            <!-- <h1 class="wow fadeIn" data-wow-delay="0.6s"><input ></h1>
                   <h3 class="wow fadeInUp" data-wow-delay="0.9s">Vestibulum at aliquam lorem</h3> -->
            <c:if test="${sessionScope.dto.id== null}">       
              <form name="form1" id="form1" method="post" action="${path}/admin/login.do">
                <table class="wow fadeIn" data-wow-delay="1.2s" style="width:100%; font-size: 20px; margin-left: 1%; margin-right: 2%;">
                  <tr>
                    <td style="padding: 2%;"><b>I D</b></td>
                    <td style="padding: 2%;">
                      <input type="text" name="id" id="inputId" style="width: 70%;" tabindex="1">
                    </td>
                    <td rowspan="2" style="padding-right: 2%; text-align: center;">
                      <button class="btn btn-info" style="height: 95%; width: 100%;" tabindex="3">Login</button>
                    </td>
                  </tr>
                  <tr style="height: 30%;">
                    <td style="padding: 2%;"><b>P W</b></td>
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
                      style="width: 100%;" onclick="location.href='${path}/admin/logout.do'">LogOut</button>
                  </td>
                </tr>
              </table>
            </c:if>
            
          </div>
        </div>

      </div>
    </div>
  </section>


  <!-- Contact section
================================================== -->

  <div class="zzo_section">
    <div class="container">
      <div class="wow fadeInUp" data-wow-delay="1.3s">
        <c:if test="${sessionScope.dto.id!= null}">
          <ul class="zzo_subMenu" align="center">
            <li>
              <a href="#"><b>상영관 관리</b></a>
            </li>
            <li>
              <a href="#"><b>회원 관리</b></a>
            </li>
            <li>
              <a href="#"><b>영화 관리</b></a>
            </li>
            <li>
              <a href="#"><b>매출 확인</b></a>
            </li>
          </ul>
        </c:if>
      </div>
    </div>
  </div>






  <!-- <section id="contact">
    <div class="container">
      <div class="row">

        <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="1.3s">
          <div class="google_map">
            <div id="map-canvas"></div>
          </div>
        </div>

        <div class="wow fadeInUp col-md-6 col-sm-12" data-wow-delay="1.6s">
          <h1>Let's work together!</h1>
          <div class="contact-form">
            <form id="contact-form" method="post" action="#">
              <input name="name" type="text" class="form-control" placeholder="Your Name" required> <input name="email"
                type="email" class="form-control" placeholder="Your Email" required>
              <textarea name="message" class="form-control" placeholder="Message" rows="4" required></textarea>
              <div class="contact-submit">
                <input type="submit" class="form-control submit" value="Send a message">
              </div>
            </form>
          </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-4 col-sm-4">
          <div class="wow fadeInUp media" data-wow-delay="0.3s">
            <div class="media-object pull-left">
              <i class="fa fa-tablet"></i>
            </div>
            <div class="media-body">
              <h3 class="media-heading">Phone</h3>
              <p>+99 00 8877 6655</p>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-4">
          <div class="wow fadeInUp media" data-wow-delay="0.6s">
            <div class="media-object pull-left">
              <i class="fa fa-envelope"></i>
            </div>
            <div class="media-body">
              <h3 class="media-heading">Email</h3>
              <p>hello@company.com</p>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-4">
          <div class="wow fadeInUp media" data-wow-delay="0.9s">
            <div class="media-object pull-left">
              <i class="fa fa-globe"></i>
            </div>
            <div class="media-body">
              <h3 class="media-heading">Address</h3>
              <p>
                123 New Street, Old Town<br> Another Village, 11220
              </p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section> -->


  <!-- Footer section
================================================== -->
  <footer>
    <div class="container">
      <div class="row">

        <div class="col-md-12 col-sm-12">
          <p class="wow fadeInUp" data-wow-delay="0.3s">Copyright © 2016 Your Company Name - Designed by Tooplate</p>
          <ul class="social-icon wow fadeInUp" data-wow-delay="0.6s">
            <li><a href="#" class="fa fa-facebook"></a></li>
            <li><a href="#" class="fa fa-twitter"></a></li>
            <li><a href="#" class="fa fa-dribbble"></a></li>
            <li><a href="#" class="fa fa-behance"></a></li>
            <li><a href="#" class="fa fa-google-plus"></a></li>
          </ul>
        </div>

      </div>
    </div>
  </footer>

  <!-- Javascript 
================================================== -->
  <script src="${path}/admin/template/js/jquery.js"></script>
  <script src="${path}/admin/template/js/bootstrap.min.js"></script>
  <script src="${path}/admin/template/js/wow.min.js"></script>
  <script src="${path}/admin/template/js/custom.js"></script>

</body>
</html>
