$('#rePwdBtn').click(function(){
	if($('#memOption').val()=='Email')
	$.ajax({
				url : "temppwd",
				type : "POST",
				data : {
					'user_id' : $("#user_id").val(),
					'email' : $("#memKeyword").val()
				},
				success : function() {
					location.href = 'tempalert';
				},
				error:function(err){
					alert(err);
				}
			});
	else if($('#memOption').val()=='휴대폰번호')
	$.ajax({
				url : "temppwd2",
				type : "POST",
				data : {
					'user_id' : $("#user_id").val(),
					'phone' : $("#memKeyword").val()
				},
				success : function(data) {
					console.log(data);
					location.href = 'tempalert';
				},
				error:function(err){
					alert(err);
				}
			});
});



