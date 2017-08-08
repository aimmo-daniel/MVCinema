/*별점 : .star-input*/
var starRating = function(){
var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star-input label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});
};

var starRating2 = function(){
	var $star2 = $(".star-input2"),
	    $result2 = $star2.find("output>b");
		
	  	$(document)
		.on("focusin", ".star-input2>.input2", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input2>.input2", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input2 :radio", function(){
	    	$result.text($(this).next().text());
	  	})
	    .on("mouseover", ".star-input2 label", function(){
	    	$result.text($(this).text());
	    })
	    .on("mouseleave", ".star-input2>.input2", function(){
	    	var $checked2 = $star2.find(":checked");
	    		if($checked2.length === 0){
	     	 		$result.text("0");
	   		 	} else {
	     	 		$result.text($checked2.next().text());
	    		}
	  	});
	};

starRating();
starRating2();