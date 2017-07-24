<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../include/header.jsp" %>
<script>
</script>
</head>
<body>

  <!-- Single Project section
================================================== -->
  <section id="single-project">
    <div class="container" style="margin-bottom: 20px; transition: color 1s;" >
      <div class="row">
        <div class="wow fadeInUp col-md-offset-1 col-md-2 col-sm-offset-1 col-sm-4" data-wow-delay="0.1s">
          <a href="#theater_add">
            <label for="zzo_addTheater1" onmouseover="sub_theater('sub_sub_mouseOver', 'over', 'sub_theater_1')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_1')" onclick="sub_movie_loadSub('sub_movie_1')"
              id="zzo_addTheater1_label">
              <div class="project-info" id="zzo_addTheater1">
                <h4 id="sub_theater_1">영화 추가/관리</h4>
                <p>
                  Add movie.
                </p>
              </div>
            </label>
          </a>
          <a href="#theater_sit">
            <label for="zzo_addTheater2" onmouseover="sub_theater('sub_sub_mouseOver','over','sub_theater_2')"
              onmouseout="sub_theater('sub_sub_mouseOver','out','sub_theater_2')" onclick="sub_movie_loadSub('sub_theater_2')"
              id="zzo_addTheater2_label">
              <div class="project-info" id="zzo_addTheater2">
                <h4 id="sub_theater_2">상영관 영화 등록</h4>
                <p>
                   Registration movie.
                </p>
              </div>
            </label>
          </a>
        </div>

        <div class="wow fadeInUp col-md-8 col-sm-8" data-wow-delay="0.3s" id="sub_movie_contents">
          <div id='my-spinner'>
            <div>
              <span><img src='${path}/admin/resources/adminImages/loader.gif'></span>
            </div>
          </div>
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