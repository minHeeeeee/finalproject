//로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          data: {
      	  property_keys: ["kakao_account.email","properties.nickname"]
   		 },
          success: function (response) {
			console.log(response)
        	  $.ajax({
					url:'/kakaoLogin',
					type:'post',
					data:{
						'kakaoId':response.id+'@k',
						'email':response.kakao_account.email,
						'name':response.properties.nickname
					},
					success:function(){
						location.href='/index';
					},
					error:function(){}
				});
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
$('#bt').click(function(){
   if($('#user_id').val()=='')
   Swal.fire({
           icon: 'warning',
           title: '아이디 항목은 필수 입력값입니다!',
         });
   else if($('#user_pwd').val()=='')
      Swal.fire({
           icon: 'warning',
           title: '패스워드 항목은 필수 입력값입니다!',
         });
   else if($('#user_pwd').val().length<= 4)
      Swal.fire({
              icon: 'warning',
              title: '패스워드 항목을 4자(개) 이상으로 해주세요.',
         });
   else{
      $.ajax({
         type:'post',
         url:'/loginOk',
         data: {
            'user_id': $('#user_id').val(),
            'user_pwd': $('#user_pwd').val()
         },
         dataType:'text',
         success:function(data){
            data = data.trim();
            if(data =='ok'){
               
               
               
               Swal.fire({
                     icon: 'success',
                     title: $('#user_id').val() + "님 로그인 성공!✌(‘ω’✌)",
                     closeOnClickOutside: false
                  }).then(function() {
                     location.href = '/';
                  });
            }else if(data=='fail'){
               Swal.fire({
                 icon: 'warning',
                 title: '아이디 또는 비밀번호가 일치 하지 않아요!',
               });
            }
         },
         error:function(err){
            alert(err);
         }
      });
   }
   

   
   
});

$('#kakao').click(kakaoLogin);