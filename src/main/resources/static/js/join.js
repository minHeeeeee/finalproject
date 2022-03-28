$('#accountbtn').click(function() {
   $('#idDiv').empty();
   $('#pwdckDiv').empty();
   $('#pwdDiv').empty();


   var vali2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   //이메일 유효성
   var vali3 = /^[a-zA-Z가-힣]{2,15}$/; //이름 유효성    

   var vali4 = /^[0-9]+/g; //핸드폰 번호 유효성 

   var vali5 = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/; //비밀번호 유효성



   var objEmail = document.getElementById("email");//메일
   var objName = document.getElementById("name"); //이름
   var objmobile = document.getElementById("phone");//핸드폰
   var objPwd = document.getElementById("user_pwd"); //비밀번호



   if ($('#user_id').val() == '') {
      $('#idDiv').text('아이디를 입력해 주세요.');
      $('#idDiv').css('font-size', '9pt');
      $('#idDiv').css('font-weight', 'bold');
      $('#idDiv').css('color', 'red');
      $('#user_id').focus();


   } else if ($('#user_pwd').val() == '') {
      $('#pwdDiv').text('비밀번호를 입력해 주세요.');
      $('#pwdDiv').css('font-size', '9pt');
      $('#pwdDiv').css('font-weight', 'bold');
      $('#pwdDiv').css('color', 'red');
      objPwd.focus();

   } else if (!vali5.test(objPwd.value)) {
      Swal.fire({
         icon: 'error',
         title: '비밀번호 입력 조건을 다시 한번 확인해주세요\n' +
            '※비밀번호 입력 조건\n' +
            '-대소문자/숫자/특수문자 조합, 8~16자\n' +
            '입력 가능 특수문자\n' +
            '~`!@#$%^()_-={}[]|;:<>,.?/\n' +
            '-공백 입력 불가능")'

      })


      /*   alert("비밀번호 입력 조건을 다시 한번 확인해주세요"
               "※비밀번호 입력 조건"
               "-대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자"
               "-입력 가능 특수문자"
               "  ~`!@#$%^()_-={}[]|;:<>,.?/"   
                " -공백 입력 불가능")*/


   } else if ($('#user_pwd').val() != $('#pwdck').val()) {
      $('#pwdckDiv').text('비밀번호가 일치하지 않습니다.')
      $('#pwdckDiv').css('font-size', '9pt');
      $('#pwdckDiv').css('font-weight', 'bold');
      $('#pwdckDiv').css('color', 'red');



   } else if ($('#email').val() == '') {
         Swal.fire({
         icon: 'error',
         title: '이메일을 입력해주세요',
      })
      $('#emailDiv').text('이메일을 입력해 주세요.');
      $('#emailDiv').css('font-size', '9pt');
      $('#emailDiv').css('font-weight', 'bold');
      $('#emailDiv').css('color', 'red');
      objEmail.focus();


   } else if (!vali2.test(objEmail.value)) { //이메일 유효성 검사
      Swal.fire({
         icon: 'error',
         title: '올바른 이메일 형식이 아니에요!',
      })


   } else if ($('#phone').val() == '') {
      Swal.fire({
         icon: 'warning',
         title: '핸드폰 번호를 입력해주세요!',
      })
   } else if ($('#phone1').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '핸드폰 번호를 입력해주세요!',
      })

   } else if (!vali4.test(objmobile.value)) { //이메일 유효성 검사
         Swal.fire({
         icon: 'error',
         title: '전화번호는 숫자만 입력할수 있어요!',
      })
      objmobile.focus();
      return false;




   } else if ($('#name').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '이름은 필수 항목입니다!',
      })


   } else if (!vali3.test(objName.value)) {
         Swal.fire({
         icon: 'error',
         title: '올바른 이름 형식이 아니에요!',
      })
      objName.focus();
      return false;


   } else if ($('#user_pwd').val() == '') {
      Swal.fire({
         icon: 'error',
         title: '비밀번호 항목은 필수 입력값입니다.!',
      })

   } else if (!$("input:checkbox[name=email_check]").is(":checked")) {
      Swal.fire({
         icon: 'warning',
         title: '이메일 수신 동의 항목은 필수 입력값입니다!',
      })
   } else if ($('#zipcode').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })


   } else if ($('#add1').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })



   } else if ($('#add2').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })
   } else if (!$("input:checkbox[name=check_box]").is(":checked")) {
      Swal.fire({
         icon: 'warning',
         title: '이용약관에 동의해주세요!',
      })

   } else if (!$("input:checkbox[name=check_box1]").is(":checked")) {
         Swal.fire({
         icon: 'warning',
         title: '개인정보 수집 및 이용 약관에 동의해주세요!',
      })


   } else {

      $.ajax({
         type: 'post',
         url: '/joinOk',
         data: $('#writeForm').serialize(),
         success: function() {
         Swal.fire({
               icon: 'success',
               title: ' 회원가입을 축하합니다! (๑>ᴗ<๑)',
               closeOnClickOutside: false
            }).then(function() {
               location.href = '/index';
            });
         },
         error: function(err) {
            alert(err); //console.log(err);
         }

      });
      //아이디 중복 체크
   };

});
$('#writeForm #user_id').focusout(function() {
      $('#idDiv').empty();

      var sId = $('#user_id').val();
      var objId = document.getElementById("user_id");
      var vali = /^[a-zA-Z0-9]{4,12}$/; //id유효성


      if (sId == '') {
         $('#idDiv').text('아이디를 입력해 주세요.');
         $('#idDiv').css('font-size', '9pt');
         $('#idDiv').css('font-weight', 'bold');
         $('#user_id').focus();


      } else if (!vali.test(objId.value)) {
            Swal.fire({
            icon: 'warning',
            title: 'id는 4~12자의 영문 대소문자와 숫자로만 입력해주세요!',
         })

         $('#user_id').val('');


      } else {
         $.ajax({
            type: 'post',
            url: '/checkId',
            data: 'id=' + sId,
            dataType: 'text',
            success: function(data) {
               data = data.trim();

               if (data == "exist") {
                  $('#idDiv').text(sId + '는 이미 사용중인 아이디입니다.');
                  $('#idDiv').css('font-size', '9pt');
                  $('#idDiv').css('font-weight', 'bold');
                  $('#idDiv').css('color', 'red');

               } else if (data == 'non_exist') {

                  $('#idDiv').text(sId + '는사용가능한 아이디입니다.');
                        $('#idDiv').css('font-size', '9pt');
                  $('#idDiv').css('font-weight', 'bold');
                  $('#idDiv').css('color', 'red');
                  $('#check').val(sId); //중복체크 수행

               }
               sId.focus();
            },
            error: function(err) {
               alert('난가?');
            }

         });

      }

   });

//약관
$("#content1").click(function() {
   $("#content_1").toggle();
});



$("#content2").click(function() {
   $("#content_2").toggle();
});


//우편번호
function checkPost() {
   new daum.Postcode({
      oncomplete: function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수
         //var extraAddr = ''; // 참고항목 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
         }

         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if (data.userSelectedType === 'R') {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            //if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            //    extraAddr += data.bname;
            //}
            // 건물명이 있고, 공동주택일 경우 추가한다.
            //if(data.buildingName !== '' && data.apartment === 'Y'){
            //     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            //}
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            //if(extraAddr !== ''){
            //    extraAddr = ' (' + extraAddr + ')';
            // }
            // 조합된 참고항목을 해당 필드에 넣는다.
            //document.getElementById("sample6_extraAddress").value = extraAddr;

         } else {
            //document.getElementById("sample6_extraAddress").value = '';
         }

         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('zipcode').value = data.zonecode;
         document.getElementById("addr1").value = addr;
         // 커서를 상세주소 필드로 이동한다.
         document.getElementById("addr2").focus();
      }
   }).open();
}
