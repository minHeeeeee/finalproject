$(function(){
	$.ajax({
		type: 'post',
		url: '/getMainImg',
		success: function(data) {
			$.each(data,function(index,item){
				if($('#'+item.menu).length!=0){
					$('#'+item.menu+' img').attr('src','/storage/menu/'+item.stored_thumbnail);
				}
			})
		},
		error: function(err) {
			console.log(err)
		}
	})
	$.ajax({
		type: 'post',
		url: '/board/getNewPost',
		success: function(data) {
			console.log(data)
			$('<a/>',{href:data.boardDTO.board_num,class:'move'}).append(
				$('<img/>',{src:'/file/display?fileName=/'+data.fileDTO.uploadPath+'/'+data.fileDTO.uuid+'_'+data.fileDTO.fileName})
			).appendTo($('#post_image'));
			$('<a/>',{href:data.boardDTO.board_num,class:'move'}).append(
				$('<span/>').text(data.boardDTO.subject)
			).appendTo($('#post_content'));
			$('<p/>').text(data.boardDTO.content).appendTo($('#post_content'));
			$('<a/>',{href:data.boardDTO.board_num,class:'move'}).text('Read more').appendTo($('#post_content'));
			let actionForm = $("#actionForm");
			$(".move").on("click", function(e){
				e.preventDefault();
				console.log($(this).attr("href"));
				$("input[name='board_num']").val($(this).attr('href'));
				console.log(actionForm);
				actionForm.submit();
			});
		},
		error: function(err) {
			console.log(err)
		}
	})
})