$(function(){
	$.ajax({
		url:'getAddresses',
		data:{'user_id':$('#user_id').val()},
		dataType:'json',
		type:'post',
		success:function(data){
			//console.log(data)
			if(data.length!=0){
			$.each(data,function(index,item){
				$('<div/>',{'id':'addcontent'}).append($('<input/>',{'type':'checkbox','name':'checkbox','class':'checkbox','value':item.addr_number}))
				.append($('<div/>',{'id':'address1'}).append($('<span/>').text(item.addr_name==null?'미지정':item.addr_name))
										.append($('<span/>').text(item.user_name))
										.append($('<span/>').text(item.zipcode.toString().length==4?'0'+item.zipcode:item.zipcode))
										.append($('<span/>').text(item.addr1))
										.append($('<span/>').text(item.addr2))
										.append($('<span/>').text("0"+item.phone)))
				.append($('<a/>',{'href':'addressEdit?addnum='+item.addr_number,'text':'EDIT'}))
				.appendTo($('#content'))
				
			
			
		
			})
			}else{
				$('#DELETEbtn').hide();
			}
			},
		error:function(err){
			console.log(err);
			alert(err);
		}
	});
});
$('#DELETEbtn').click(function(){


if(!$("input:checkbox[name=checkbox]").is(":checked")){
		Swal.fire({
			  icon: 'warning',
			  title: '삭제할 주소를 선택해주세요!',
			})
		
	}else{
		
		
		Swal.fire({
  title: '주소를 삭제하시겠습니까??',
 
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
 confirmButtonText: '삭제할래요',
 cancelButtonText: '아니요',
}).then((result) => {
  if (result.isConfirmed) {
	$.ajax({
			
			type: 'post',
			url: 'delEdit',
			data:$("#addressForm").serialize(),
			success: function() {
				Swal.fire({
			  icon: 'success',
			  title: '삭제 완료!',
			}).then(function(){
				location.href='/addresses'
			})
			
			},
			error: function(err) {
				alert(err);
				console.log(err)
			
			}
			
			
			});
	}
	
	})
	}
	});	
		
		
		
	