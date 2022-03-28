<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div id="loginDiv">
      <div id="login">
        <input id="user_id" style="width: 100%; border: 0px; border-bottom: 2px solid black"
          type="text"placeholder="ID" />
        
        <br />
        <input
          id="user_pwd"  type="password"
          style="width: 100%; border: 0px; border-bottom: 2px solid black"
          placeholder="Password"
        /><br />
        <input id="bt" type="button" value="Login" />
        
        <br />
      </div>

      <div id="login2">
        <span
          >Forgotten <a onclick="location.href='findId'">ID</a> or
          <a onclick="location.href='findPwd'">Password</a></span>
        <span><a onclick="location.href='/join'">New Customer</a></span>
      </div>

      <div id="login3">
        <span>Login with </span>&nbsp;&nbsp;
        <div id="naver_id_login"></div>
        
        <span><a id="naver">Naver</a></span>&nbsp;&nbsp;
        <span><a id="kakao">Kakao Talk</a></span>
      </div>
    </div>
     
    <!-- 카카오로그인 -->
	<script type="text/javascript" src="../js/login.js"></script>
	<!-- 네이버로그인 -->
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  

<!-- 네이버 스크립트 -->
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

   <script type="text/javascript" src="../js/naver.js"></script> -->
