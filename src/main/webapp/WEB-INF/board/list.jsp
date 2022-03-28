<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link rel="stylesheet" href="/component/nav.css" />
<link rel="stylesheet" href="/index.css" />
<link rel="stylesheet" href="help.css" /> -->
<script src="https://kit.fontawesome.com/cd631a71a1.js" crossorigin="anonymous"></script>
<title>list</title>
</head>
<body>
<style>
ul {
	margin: 0px;
	/*  font-size: 0.8rem; */
	font-weight: bold;
}

li {
	margin-bottom:5px;
    display: list-item;
    text-align: -webkit-match-parent;
    list-style: none;
}
.alignright{
	text-align: right;
}
.floatleft{
	display:flex;
}

.col60 {
    width: 60%;
}

.col10 {
    width: 10%;
}
.col20 {
    width: 20%;
}

.col40 {
    width: 40%;
}

.col50 {
    width: 50%;
}
#moveWriteForm{
	margin-left:93.5%;
	border:1px solid black;
	background-color: black;
	color:white;
	padding:7px 15px;
}
</style>
	
	<div id="empty"></div>
	<div id="help_main" style="margin:100px auto">
		<input type="hidden" value="${pageDTO}">
		<input type="hidden" value="${board_category_num}">
		<input id="pageNum" type="hidden" value="${pageDTO.criteria.pageNum}">
		
		<div id="QNA" class="col-12 col-lg-8" style="margin:auto;">
			<c:if test="${board_category_num eq '1'}">
				<h3 class="QNA_board_title">공지</h3>
			</c:if>
			<c:if test="${board_category_num eq '2'}">
				<h3 class="QNA_board_title">2</h3>
			</c:if>
			<c:if test="${board_category_num eq '3'}">
				<h3 class="QNA_board_title">3</h3>
			</c:if>
			<c:if test="${board_category_num eq '4'}">
				<h3 class="QNA_board_title">리뷰</h3>
			</c:if>
			<c:if test="${board_category_num eq '5'}">
				<h3 class="QNA_board_title">상품 Q&A</h3>
			</c:if>
			<c:if test="${board_category_num eq '6'}">
				<h3 class="QNA_board_title">Q&A</h3>
			</c:if>

				<div class="board">
				<div class="boardSort">
				</div>
				
				<div style="margin:15px auto">
					<ul class="notice">
						<li class="list-item list-board-notice">
							<div class=" floatleft">
								<div class="col col110 floatleft">
									<i class="fa fa-plus-square-o"></i>
								</div>
								
								<div class="col col40 floatleft">
									
								</div>
								
								<div class="col col50 floatleft">
									<a href="#"></a>
								</div>
							</div>
						</li>
					</ul>	
					
					<c:forEach items="${list}" var="board">
						<ul class="helpUL">
							<li class="list-item">
								<div class=" floatleft">
									<div class=" col10">
										${board.board_num}
									</div>
									
									<div class=" col60">
										<c:if test="${board.layer > 0 }">
											<c:forEach begin="1" end="${board.layer}">
												&nbsp;&nbsp;
											</c:forEach>
											[RE]:
										</c:if>
										
										<a class="move" href='<c:out value="${board.board_num}" />'>
											<c:out value="${board.subject}" />
										</a> 
									</div>
								
									<div class=" col10 alignright">
										${board.name}
									</div>	
									<div class=" col20 alignright">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${board.logtime}"/>
									</div>	
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
				
				<a id="moveWriteForm" href="#">Write</a>
				
				<div class='pull-right'>
					<ul class="pagination" style="padding:60px 0px 20px ;justify-content: center">
						<c:if test="${pageDTO.prev}">
							<li class="paginate_button previous"><a
								href="${pageDTO.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
							<li class="paginate_button"> 
								<a href="${num}">${num}</a>							
							 <%-- ${pageDTO.criteria.pageNum == num ? "active":""} "> --%>
							</li>
						</c:forEach>

						<c:if test="${pageDTO.next}">
							<li class="paginate_button next"><a
								href="${pageDTO.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!-- end Pagination -->
				
				<form id='actionForm' action="/board/list" method='post'>
					<input type='hidden' name='board_category_num' value='${board_category_num}'>
					<input id="board_num" type='hidden' name='board_num' value="">
					<input type='hidden' name='pageNum' value='${pageDTO.criteria.pageNum}'>
					<input type='hidden' name='amount' value='${pageDTO.criteria.amount}'>
				</form>
			</div>


		</div>

	</div> <!-- end #help_main -->
	<!-- <script src="/WEB-INF/component/nav/nav.js"></script> -->
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			let actionForm = $("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click", function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($("#pageNum").val());
				actionForm.find("input[name='board_num']").val($(this).attr("href"));
				actionForm.attr("action", "/board/get");
				console.log(actionForm);
				actionForm.submit();
			});
			
			$("#moveWriteForm").on("click", function(e){
				e.preventDefault();
				actionForm.attr("action", "/board/writeForm");
				actionForm.submit();
			});
			
		});
		
		function boardWriteForm(board_category_num){
			let f = document.createElement('form');
		    
		    let obj1;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', 'board_category_num');
		    obj.setAttribute('value', board_category_num);
		    
		    
		    
		    f.appendChild(obj1);
		    
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/board/writeForm');
		    document.body.appendChild(f);
		    console.log(f);
		    f.submit();
		}
	</script>
	
</body>
</html>
