/**
 * 
 */

function sub_movie_loadSub(choice){
  var param= choice=='sub_movie_1'?'add':'batch';
  console.log(choice);
  $("#my-spinner").show();
  $.ajax({
    url: "/mvcinema/subMenu/movie/"+param+".do",
    success: function(result){
      $("#my-spinner").hide();
      $("#sub_movie_contents").html(result);
    }
  })
}