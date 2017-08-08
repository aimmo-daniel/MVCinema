<style>
img {
	max-width: 80%;
	height: auto;
}
</style>
<link rel="stylesheet" href="${path}/sangjin/resource/css/bootstrap-theme.min.css">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>

	<div class="carousel-inner" style="width: 85%; margin: 0 auto;"role="listbox">
		<div class="item active">
			<img src="${path}/sangjin/resource/image/img4.jpg">
		</div>

		<div class="item">
			<img src="${path}/sangjin/resource/image/img3.jpg">
		</div>

		<div class="item">
			<img src="${path}/sangjin/resource/image/img1.jpg">
		</div>

		<div class="item">
			<img src="${path}/sangjin/resource/image/img2.jpg">
		</div>
	</div>

	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>