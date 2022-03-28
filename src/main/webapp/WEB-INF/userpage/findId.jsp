<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



    <div id="findIdDiv" class="col-12 col-lg-8">
      <h3><center>FIND ID</center></h3>
      <!--동일 name값 주어야 하나만 선택 가능-->
      <input name="radio" type="radio" id="r1" value="1" checked />이메일
      <input name="radio" type="radio" id="r2" value="2" />휴대폰번호
      <p></p>
      <label for="name" style="color: gray">Name</label><br />
      <input
        type="text" id="name"
        style="width: 120px; border: 0px; border-bottom: 1px solid gray"
      />

      <p name="email_1" id="email_1">
        <label for="email" style="color: gray">E-mail</label><br />
        <input
          id="email"
          name="email"
          type="text"
          style="width: 320px; border: 0px; border-bottom: 1px solid gray"
        />
      </p>
      <p name="phone_1" id="phone_1">
        <label for="phone" style="color: gray">Mobile</label><br />
        <input
          id="phone1"
          type="text"
          maxlength="3"
          style="width: 50px; border: 0px; border-bottom: 1px solid gray"
        />-
        <input
        id="phone2"
          type="text" 
                  maxlength="4"
          style="width:50px; border: 0px; border-bottom: 1px solid gray"
        />-
        <input
        id="phone3"
          type="text" 
                  maxlength="4"
          style="width:50px; border: 0px; border-bottom: 1px solid gray"
        />
      </p>
      <p></p>
      <input id="findIdBtn" type="button" style="font-size: 9pt" value="Confirm" />
    </div>
    
