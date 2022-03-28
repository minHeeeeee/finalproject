<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/component/nav.css" />
    <link rel="stylesheet" href="/index.css" />
    <link rel="stylesheet" href="login.css" />
    <script
      src="https://kit.fontawesome.com/cd631a71a1.js"
      crossorigin="anonymous"
    ></script>
    <title>Login</title>
  </head>
  <body>
    <style>
      ul{
        margin: 0px;
        font-size: 0.8rem;
        font-weight: bold;
      }
    </style>
    <jsp:include page="/component/nav.jsp" />
    <div id="empty"></div>
    <main id="login_main">
      <div id="login_middle">
        <form action="#">
          <input type="text" placeholder="ID" />
          <input type="password" value="1234" />
          <button type="submit">Login</button>
          <div>
            <p>Forgotten <span>ID</span> or <span>Password</span></p>
            <span onclick="location.href='/page/register.jsp'">New Customer</span>
          </div>
          <section id="login_api">
            <span>Login with</span>
            <a id="naver">Naver</a>
            <a id="kakao">Kakao Talk</a>
          </section id="login_api">
        </form>
      </div>
    </main>
    <jsp:include page="/component/footer.jsp" />
    <script src="/component/nav.js"></script>
  </body>
</html>
