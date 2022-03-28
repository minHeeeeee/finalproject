$(".bread_container ul li a").mouseover(function (event) {
	console.log(event.target.innerText);
	$('#img1').attr('src','');
	$('#img1').attr('src','/storage/'+event.target.innerText+'.jpg');
	$('#breadImg').css('display','block');
});
$(".bread_container ul li a").mouseleave(function () {
	$('#breadImg').css('display','none');
});





/*$(".image_file").mouseenter(function(event){
	$.ajax({
		type:'post',
		url:'/user/getImage',
		data:'value='+event.target.innerText,
		dataType:'json',
		success: function(data) {
			//console.log(data)
			$.each(data,function(index,item){
				
				
			$('#img'+(index+1)).attr('src','storage/'+item)	;
				
			});
		},
		error:function(err){
			console.log(err);
		}
		
		
		
	});
	
	
	
	
	
	
	
});*/