$('#editbtn').click(function() {
   $('#pwdDiv').empty();
   $('#pwdckDiv').empty();
   var vali2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   //이메일 유효성
   var vali3 = /^[가-힣]{2,15}$/; //이름 유효성    

   var vali4 = /^[0-9]+/g; //핸드폰 번호 유효성 

   var vali5 = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/; //비밀번호 유효성


   var objEmail = document.getElementById("email");//메일
   var objName = document.getElementById("name"); //이름
   var objmobile = document.getElementById("phone");//핸드폰
   var objPwd = document.getElementById("user_pwd"); //비밀번호


   if ($('#user_pwd').val() == '') {
      $('#pwdDiv').text('비밀번호를 입력해 주세요.');
      $('#pwdDiv').css('font-size', '9pt');
      $('#pwdDiv').css('font-weight', 'bold');
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


   } else if ($('#user_pwd').val() != $('#pwdck').val()) {
      $('#pwdckDiv').text('비밀번호가 일치하지 않습니다.')
      $('#pwdckDiv').css('font-size', '9pt');
      $('#pwdckDiv').css('font-weight', 'bold');



   } else if ($('#email').val() == '') {
      alert('이메일을 입력하세요');
      $('#emailDiv').text('이메일을 입력해 주세요.');
      $('#emailDiv').css('font-size', '9pt');
      $('#emailDiv').css('font-weight', 'bold');
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
         icon: 'warning',
         title: '전화번호는 숫자만 입력할수 있어요!',
      })



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

   } else if ($('#user_pwd').val() == '') {
      Swal.fire({
         icon: 'error',
         title: '비밀번호 항목은 필수 입력값입니다.!',
      })
   } else if ($('#zipcode').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })
      

   } else if ($('#addr1').val() == '') {
         Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })
   

   } else if ($('#addr2').val() == '') {
            Swal.fire({
         icon: 'warning',
         title: '주소를 입력해주세요!',
      })

   }else
      $.ajax({
         type: 'post',
         url: 'editOk',
         data: $('#editForm').serialize(),
         success: function() {
            Swal.fire({
               icon: 'success',
               title: ' 회원정보 수정 완료! (๑>ᴗ<๑)',
               closeOnClickOutside: false
            }).then(function() {
               location.href = '/index';
            });
         },
         error: function(err) {
            console.log(err);
         }
      });
});

$('#pass').focusout(function() {
   if ($('#pass').val() != $('#user_pwd').val())
      $('#passwordCheckDiv').text('비밀번호가 맞지 않습니다.');
   else if ($('#pass').val() == $('#user_pwd').val())
      $('#passwordCheckDiv').empty();
});

$('#deletebtn').click(function() {

   if ($('#user_pwd').val() == '') {


      Swal.fire({
         icon: 'warning',
         title: '비밀번호를 입력해주세요!',

      })

   } else if ($('#pwdck').val() == '')
      Swal.fire({
         icon: 'warning',
         title: '비밀번호확인을 해주세요!',
      })

   else if ($('#user_pwd').val() != $('#pwdck').val())
      Swal.fire({
         icon: 'error',
         title: '비밀번호가 틀렸어요!',
      })
   else {

      $.ajax({
         type: 'post',
         url: 'loginOk',//DB에 가서 비밀번호를 꺼내온다
         //data : $("quitForm").serialize(),
         data: {
            'user_id': $('#user_id').val(),
            'user_pwd': $('#user_pwd').val()
         },
         success: function(data) {

            if (data == 'ok') {
               const swalWithBootstrapButtons = Swal.mixin({
                  customClass: {
                     confirmButton: 'btn btn-success',
                     cancelButton: 'btn btn-danger'
                  },
                  buttonsStyling: false
               });
               swalWithBootstrapButtons.fire({
                  title: '정말로 탈퇴 하실껀가요?',
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonText: '넹!!',
                  cancelButtonText: '아니요!!',
                  reverseButtons: false
               }).then((result) => {
                  console.log(result)
                  
                  if (result.isConfirmed) {
                     $.ajax({
                        type: 'post',
                        url: 'deleteOk',
                        data: {
                           'user_id': $('#user_id').val()
                        },
                        success: function() {
                           swalWithBootstrapButtons.fire(
                              '삭제 되었습니다!!',
                              '회원님의 계정은 이제 안녕!',
                              'success'
                           )
                           Swal.fire({
                              icon: 'success',
                              title: '탈퇴 완료 (๑>ᴗ<๑)',
                              closeOnClickOutside: false
                           }).then(function() {
                              location.href = '/index';
                           });

                        },

                        error: function(err) {
                           console.log(err);
                        }
                     });

                  } else if (
                     /* Read more about handling dismissals below */
                     result.dismiss === Swal.DismissReason.cancel
                  ) {
                     swalWithBootstrapButtons.fire(
                        '취소 되었어요!',
                        'Your imaginary file is safe :)',
                        'error'
                     )
                  }
               });

            }
            else {
               Swal.fire({
                  icon: 'error',
                  title: '비밀번호가 맞지않아요!!',
               });
            }
         },
         error: function() {
            Swal.fire({
               icon: 'error',
               title: '서버에러!',
            });
         }
      });
   }
});

