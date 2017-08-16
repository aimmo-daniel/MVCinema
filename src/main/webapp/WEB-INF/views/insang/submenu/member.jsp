<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../include/header.jsp" %>
<style>
#zzo_addTheater1:hover {
  transition: color 0.5s
}
#zzo_addTheater2:hover {
  transition: color 0.5s
}
#zzo_addTheater3:hover {
  transition: color 0.5s
}
</style>
</head>
<body>

<!-- Single Project section
================================================== -->
  <section id="single-project">
    <div class="container" style="margin-bottom: 20px; transition: color 1s;" >
      <div class="row">
        <div class="wow fadeInUp col-md-offset-1 col-md-2 col-sm-offset-1 col-sm-4" data-wow-delay="0.1s">
          <a href="#member_contact">
            <label for="zzo_addTheater1" onmouseover="$('#sub_theater_1').css('color','green')"
            onclick="loadSub_memb('contact')" onmouseout="$('#sub_theater_1').css('color','black')" id="zzo_addTheater1_label">
              <div class="project-info" id="zzo_addTheater1">
                <h4 id="sub_theater_1">1:1문의 답변</h4>
                <p>
                  response contact
                </p>
              </div>
            </label>
          </a>
          <a href="#member_faq">
            <label for="zzo_addTheater2" class="zzo_hover" onmouseover="$('#sub_theater_2').css('color','green')"
            onclick="loadSub_memb('faq')" onmouseout="$('#sub_theater_2').css('color','black')" id="zzo_addTheater2_label">
              <div class="project-info" id="zzo_addTheater2">
                <h4 id="sub_theater_2">FAQ 관리</h4>
                <p>
                  FAQ.
                </p>
              </div>
            </label>
          </a>
          <a href="#member_notice">
            <label for="zzo_addTheater2" class="zzo_hover" onmouseover="$('#sub_theater_3').css('color','green')"
            onmouseout="$('#sub_theater_3').css('color','black')" onclick="loadSub_memb('notice')" id="zzo_addTheater2_label">
              <div class="project-info" id="zzo_addTheater3">
                <h4 id="sub_theater_3">공지사항 등록</h4>
                <p>
                  FAQ.
                </p>
              </div>
            </label>
          </a>
        </div>
        
        <div class="wow fadeInUp col-md-8 col-sm-8" data-wow-delay="0.3s" id="sub_memb_content">
        
          <div id='my-spinner'>
            <div>
              <span><img src='${path}/admin/resources/adminImages/loader.gif'></span>
            </div>
          </div>
          
        </div>

<script>
function loadSub_memb(choice){
  var param= choice;
  console.log(choice);
  $("#my-spinner").show();
  $.ajax({
    url: "${path}/subMenu/member/"+param+".do",
    success: function(result){
      $("#my-spinner").hide();
      $("#sub_memb_content").html(result);
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