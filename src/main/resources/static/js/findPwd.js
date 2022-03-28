/*
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
});*/

$('#findPwdBtn').click(function(){
	
	var vali=/^[가-힣]{2,15}$/; //이름 유효성
	var vali2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var vali3= /^[0-9]+/g; //핸드폰 번호 유효성
	var vali4 = /^[a-zA-Z0-9]{4,12}$/; //아이디 유효성
	
	var Name=document.getElementById("name");
	var Email=document.getElementById("email");
	var Id=document.getElementById("user_id");
	var Phone1=document.getElementById("phone1");
	var Phone2=document.getElementById("phone2");
	var Phone3=document.getElementById("phone3");
	var Phone=Phone1.value+Phone2.value+Phone3.value;
	
if($("input[name=radio]:checked").val() == "1"){	
	if(Id.value==''){
		alert("아이디를 입력해주세요");
	}else if(!vali4.test(Id.value)){
		alert('올바른 아이디 형식이 아닙니다.')
	
	}else if(Name.value ==''){
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
		
		//이름과 이메일 아이디로 찾을 때
		$.ajax({
			type:'post',
			url:'findPwdEmail',
			data:{
				'email':$('#email').val(),
				'name':$('#name').val(),
				'user_id':$('#user_id').val()
				
			},
			dataType:'text',
			success:function(data){
				data = data.trim();
			
			if(data=='emailok'){
				location.href="findPwdResult";
				
			}else if(data=='emailfail'){
				alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
				location.href="findPwd";
			}
			
			
			},
			error:function(err){
				alert(err);
			}
		
		
		});
	}
	}else if($("input[name=radio]:checked").val() == "2"){
	
		if(Id.value==''){
		alert("아이디를 입력해주세요");
	}else if(!vali4.test(Id.value)){
		alert('올바른 아이디 형식이 아닙니다.')
	
	}else if(Name.value ==''){
	alert("이름을 입력해주세요");
	
	}else if(!vali.test(Name.value)){
		alert('올바른 이름 형식이 아닙니다.');
		
	}else if(Phone==''){
		alert("핸드폰 번호를 입력해주세요");
	}else if(Phone.length<=10){
		alert("휴대전화 번호 항목이 3자(개) 이상으로 해주십시오.");
		
		}else{
			//이름과 핸드폰 번호로 찾을 때
			$.ajax({
				type:'post',
				url:'findPwdPhone',
				data:{
					'phone':Phone,
					'name':$('#name').val(),
					'user_id':$('#user_id').val()
				},
				dataType:'text',
				success:function(data){
					data = data.trim();
					if(data=='phoneok'){
						location.href="findPwdResult";
						
					}else if(data=='phonefail'){
						alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
						location.href="findPwd";
					}
				},
				error:function(err){
					alert(err);
				}
			});
		}
	}
});
	
