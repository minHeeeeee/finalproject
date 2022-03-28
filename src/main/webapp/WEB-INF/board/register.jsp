<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/component/nav.css" />
    <link rel="stylesheet" href="/index.css" />
    <link rel="stylesheet" href="register.css" />
    <script
      src="https://kit.fontawesome.com/cd631a71a1.js"
      crossorigin="anonymous"
    ></script>
    <title>Login</title>
  </head>
  <body>
    <style>
      ul {
        margin: 0px;
        font-size: 0.8rem;
        font-weight: bold;
      }
    </style>
 <%--    <jsp:include page="/component/nav.jsp" /> --%>
    <div id="empty"></div>
    <div id="register_main">
      <form action="#">
        <label for="id">아이디</label>
        <input name="id" type="text" />
        <label for="pw">비밀번호</label>
        <input name="pw" type="text" />
        <label for="pw2">비밀번호 확인</label>
        <input name="pw2" type="text" />
      </form>
    </div>
    <%-- <jsp:include page="/component/footer.jsp" /> --%>
    <script src="/WEB-INF/component/nav/nav.js"></script>
  </body>
</html>
