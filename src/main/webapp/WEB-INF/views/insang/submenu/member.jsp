<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>

<!-- Single Project section
================================================== -->
  <section id="single-project">
    <div class="container" style="margin-bottom: 20px; transition: color 1s;" >
      <div class="row">
        <div class="wow fadeInUp col-md-offset-1 col-md-2 col-sm-offset-1 col-sm-4" data-wow-delay="0.1s">
          <a href="#tong_statistics1">
            <label for="zzo_addTheater1" onmouseover="sub_theater('sub_sub_mouseOver', 'over', 'sub_theater_1')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_1')" onclick="sub_tong_loadSub('yeame1')"
              id="zzo_addTheater1_label">
              <div class="project-info" id="zzo_addTheater1">
                <h4 id="sub_theater_1">1:1문의 답변</h4>
                <p>
                  response contact
                </p>
              </div>
            </label>
          </a>
          <a href="#theater_sit">
            <label for="zzo_addTheater2" onmouseover="sub_theater('sub_sub_mouseOver','over','sub_theater_2')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_2')" onclick="sub_tong_loadSub('yeame2')"
              id="zzo_addTheater2_label">
              <div class="project-info" id="zzo_addTheater2">
                <h4 id="sub_theater_2">아직안정함</h4>
                <p>
                  Timetable.
                </p>
              </div>
            </label>
          </a>
        </div>

<!-- Javascript 
================================================== -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>