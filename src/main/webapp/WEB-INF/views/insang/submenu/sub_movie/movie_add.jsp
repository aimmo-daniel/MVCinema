<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${path}/admin/resources/template/css/zoo_style_movie.css">

</head>
<body>

  <div>
    <label for="sub_movie_add_lab" class="lab">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_movie_add_lab" style="font-size: 20px; margin: 10px 20px 20px 20px;">신규 영화 추가</p>
    </label>
  </div>
  
  <div style="display: none;" id="sub_movie_addMovie_div">
    sibal
  </div>
  
  <div>
    <label for="sub_movie_mod_lab" class="lab">
      <p class="wow fadeIn" data-wow-delay="0s" id="sub_movie_mod_lab" style="font-size: 20px; margin: 25px 20px 20px 20px;">영화 관리</p>
    </label>
  </div>
  
  <div style="display: none;" id="sub_movie_modMovie_div">
    shabal
  </div>
  
  
  <script>
  	$("#sub_movie_add_lab").click(function(){
  	  sub_movie_addMovie_div('sub_movie_addMovie_div');
  	});
  	$("#sub_movie_mod_lab").click(function(){
  	  sub_movie_addMovie_div('sub_movie_modMovie_div');
  	});
  </script>
</body>
</html>