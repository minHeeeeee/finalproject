<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/component/nav.css" />
<link rel="stylesheet" href="/index.css" />
<link rel="stylesheet" href="help.css" />
<script src="https://kit.fontawesome.com/cd631a71a1.js"
	crossorigin="anonymous"></script>
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
	<%-- <jsp:include page="/component/nav.jsp" /> --%>
	<div id="empty"></div>
	<div id="help_main">
		<div id="QNA">
			<h3 class="QNA_board_title">상품 Q&A</h3>
			
			
			<form id="boardReplyForm" action="/board/boardReplyWrite" method="post">
				<input type="text" name="board_num" value="${boardDTO.board_num}">
				<input type="text" name="group_num" value="${boardDTO.group_num}">
				<input type="text" name="layer" value="${boardDTO.layer}">
				<input type="text" name="orders" value="${boardDTO.orders}">
				<input type="text" name="board_category_num" value="${boardDTO.board_category_num}">
				
				<div>
					<ul class="form-submit-board">
						<li>
							<label>subject</label>
							<input type="text" name="subject" value="답변입니다">
							<span class="label-box"></span>
						</li>
						<li>
							<label>user_name</label>
							<input type="text" id="user_name" name="user_name" value="">
							<span class="label-box"></span>
						</li>
						<li>
							<label>Content</label>
							<div id="content">
								<textarea id="content" name="content" rows="40" cols="150">
									[ Original Message ]
									${boardDTO.content}
								</textarea>
								<div class="toolbar">
									<span class="fr-counter">문자(조회수넣을까?) : </span>
								</div>
							</div>
						</li>
					</ul>
					<div id="botton box">
						<span class="" >
							<a href="/page/help">이전화면으로</a>
						</span>
						<span>
							<button type="submit">글쓰기</button>
						</span>
					</div>
				</div>
			</form>


		</div>

	</div> <!-- end #help_main -->
	<%-- <jsp:include page="/component/footer.jsp" /> --%>
	<script src="/WEB-INF/component/nav/nav.js"></script>
</body>
</html>
