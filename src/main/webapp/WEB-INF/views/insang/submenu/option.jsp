<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp" %>
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
                <h4 id="sub_theater_1">예매율 확인</h4>
                <p>
                  Advance rate.
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

<script>
function sub_tong_loadSub(choice){
  var param= choice=='yeame1'?'yeame1':'yeame2';
  console.log(choice);
  $("#my-spinner").show();
  $.ajax({
    url: "/mvcinema/tong/"+param+".do",
    success: function(result){
      $("#my-spinner").hide();
      $("#sub_movie_contents").html(result);
    }
  })
}
</script>

  <!-- Javascript 
================================================== -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/custom.js"></script>

</body>
</html>