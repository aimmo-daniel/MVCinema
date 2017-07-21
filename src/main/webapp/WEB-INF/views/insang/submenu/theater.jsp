<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../include/header.jsp" %>
</head>
<body>

  <!-- Single Project section
================================================== -->
  <section id="single-project">
    <div class="container" style="margin-bottom: 20px;">
      <div class="row">
        <div class="wow fadeInUp col-md-offset-1 col-md-3 col-sm-offset-1 col-sm-4" data-wow-delay="0.1s">
          <a href="#theater">
            <label for="zzo_addTheater1" onmouseover="sub_theater('sub_sub_mouseOver', 'over', 'sub_theater_1')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_1')" onclick="sub_theater_loadSub('sub_theater_1')">
              <div class="project-info" id="zzo_addTheater1">
                <h4 id="sub_theater_1">상영관 추가</h4>
                <p>
                  Add theater.
                </p>
              </div>
            </label>
          </a>
          <a href="#theater">
            <label for="zzo_addTheater2" onmouseover="sub_theater('sub_sub_mouseOver','over','sub_theater_2')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_2')" onclick="sub_theater_loadSub('sub_theater_2')">
              <div class="project-info" id="zzo_addTheater2">
                <h4 id="sub_theater_2">상영관 좌석배치</h4>
                <p>
                  Sit placement.
                </p>
              </div>
            </label>
          </a>
        </div>

        <div class="wow fadeInUp col-md-8 col-sm-8" data-wow-delay="0.3s" id="sub_theater_contents">
        </div>

      </div>
    </div>
  </section>

  <!-- Javascript 
================================================== -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/custom.js"></script>

</body>
</html>