$(document).ready(function () {
  if ($("input[name=radio]:checked").val() == "1") {
    $("#phone_1").hide();
    $("#email_1").show();
  } else if ($("input[name=radio]:checked").val() == "2") {
    $("#email_1").hide();
    $("#phone_1").show();
  }
  
    //라디오버튼 클릭시 이벤트 발생
  $("input:radio[name=radio]").click(function () {
    if ($("input[name=radio]:checked").val() == "1") {
      $("#phone_1").hide();
      $("#email_1").show();
      	
      
      
    } else if ($("input[name=radio]:checked").val() == "2") {
      $("#email_1").hide();
      $("#phone_1").show();
    }
    
  });
});



//이메일로 찾냐 핸드폰 번호로 찾느냐에 따라 유효성 검사 나오는게 달라져야함 지금은 3개 다나온다.
$('#findIdBtn').click(function(){
	
	var vali=/^[가-힣]{2,15}$/; //이름 유효성
	var vali2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var vali3= /^[0-9]+/g; //핸드폰 번호 유효성
	
	var Name=document.getElementById("name");
	var Email=document.getElementById("email");
	var Phone1=document.getElementById("phone1");
	var Phone2=document.getElementById("phone2");
	var Phone3=document.getElementById("phone3");
	var Phone=Phone1.value+Phone2.value+Phone3.value;
	
	if($("input[name=radio]:checked").val() == "1"){
		if(Name.value ==''){
		alert("이름을 입력해주세요");
		
		}else if(!vali.test(Name.value)){
			alert('올바른 이름 형식이 아닙니다.');
	
		}else if(Email.value ==''){
			alert("이메일을 입력해주세요")
			
		}else if(!vali2.test(Email.value)){
			alert('올바른 이메일 형식이 아닙니다.');
		
		
		/*}else if(Phone.value==''){
			alert("핸드폰 번호를 입력해주세요");
		}else if(Phone.value<=3){
			alert("휴대전화 번호 항목이 3자(개) 이상으로 해주십시오.");
		*/
		}else{
			//이름과 이메일로 찾을 때
			$.ajax({
				type:'post',
				url:'findIdEmail',
				data:{
					'email':$('#email').val(),
					'name':$('#name').val()
				},
				dataType:'text',
				success:function(data){
					data = data.trim();
					if(data=='emailok'){
						location.href="findIdResult";
						
					}else if(data=='emailfail'){
						alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
						location.href="findId";
					}
				},
				error:function(err){
					alert(err);
				}
			});
		}
		
	}else if($("input[name=radio]:checked").val() == "2"){
		if(Name.value ==''){
		alert("이름을 입력해주세요");
		
		}else if(!vali.test(Name.value)){
			alert('올바른 이름 형식이 아닙니다.');
	
		/*}else if(Email.value ==''){
			alert("이메일을 입력해주세요")
			
		}else if(!vali2.test(Email.value)){
			alert('올바른 이메일 형식이 아닙니다.');
		
		*/
		}else if(Phone==''){
			alert("핸드폰 번호를 입력해주세요");
		}else if(Phone.length<=10){
			alert("휴대전화 번호 항목이 3자(개) 이상으로 해주십시오.");
		
		}else{
			//이름과 핸드폰 번호로 찾을 때
			$.ajax({
				type:'post',
				url:'findIdPhone',
				data:{
					'phone':Phone,
					'name':$('#name').val()
				},
				dataType:'text',
				success:function(data){
					data = data.trim();
					if(data=='phoneok'){
						location.href="findIdResult";
						
					}else if(data=='phonefail'){
						alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
						location.href="findId";
					}
				},
				error:function(err){
					alert(err);
				}
			});
		}
	}
});

//이름과 핸드폰 번호로 찾을 때
/*}else{
	
		$.ajax({
			type:'post',
			url:'/user/findidPhone',
			data:{
				'phone':$('#phone').val(),
				'name':$('#name').val()
				
			},
			dataType:'text',
			success:function(data){
				data = data.trim();
			
			if(data=='phoneok'){
				location.href="/user/findidEmail";
				
			}else if(data=='phonefail'){
				alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
				location.href="/user/id";
			}
			
			
			},
			error:function(err){
				alert(err);
			}
		
		
			
			
		});
	}
	
	
	
	
});*/




  



