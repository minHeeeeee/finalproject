$(function () {
	if(window.innerWidth<700){
		$('.grid_item1').css("grid-column","1/span 2");
		$('.grid_item1').css("grid-row","1");
		$('.grid_item2').css("grid-column","2");
		$('.grid_item2').css("grid-row","2");
		$('.grid_item3').css("grid-column","1");
		$('.grid_item3').css("grid-row","2/span 2");
		$('.grid_item4').css("grid-column","2");
		$('.grid_item4').css("grid-row","3");
	}else{
		$('.grid_item1').css("grid-column","1");
		$('.grid_item1').css("grid-row","1");
		$('.grid_item2').css("grid-column","2");
		$('.grid_item2').css("grid-row","1");
		$('.grid_item3').css("grid-column","3");
		$('.grid_item3').css("grid-row","1");
		$('.grid_item4').css("grid-column","4");
		$('.grid_item4').css("grid-row","1");
	}
	
});


$(window).resize(function(){
	if(window.innerWidth<700){
		$('.grid_item1').css("grid-column","1/span 2");
		$('.grid_item1').css("grid-row","1");
		$('.grid_item2').css("grid-column","2");
		$('.grid_item2').css("grid-row","2");
		$('.grid_item3').css("grid-column","1");
		$('.grid_item3').css("grid-row","2/span 2");
		$('.grid_item4').css("grid-column","2");
		$('.grid_item4').css("grid-row","3");
	}else{
		$('.grid_item1').css("grid-column","1");
		$('.grid_item1').css("grid-row","1");
		$('.grid_item2').css("grid-column","2");
		$('.grid_item2').css("grid-row","1");
		$('.grid_item3').css("grid-column","3");
		$('.grid_item3').css("grid-row","1");
		$('.grid_item4').css("grid-column","4");
		$('.grid_item4').css("grid-row","1");
	}
});