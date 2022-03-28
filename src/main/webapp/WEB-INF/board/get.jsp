<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<!-- <meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/component/nav.css" />
<link rel="stylesheet" href="/index.css" />
<link rel="stylesheet" href="help.css" /> -->
<script src="https://kit.fontawesome.com/cd631a71a1.js"
	crossorigin="anonymous"></script>
<title>환영합니다</title>
</head>
<body>
<style>
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.row{
	list-style: none;
    position: relative;
    margin: 15px 0 0 0;
    border-top: 1px solid #d7d5d5;
    box-sizing: border-box;
    color: #353535;
    line-height: 140%;
}

.comment-list-button {
    float: right;
    position: relative;
    margin-top: -20px;
}

.comment-list-button a {
    margin-right: 10px;
    
}
.button-text-small {
    float: none !important;
    display: inline-block !important;
    font-size: 9px;
    text-transform: uppercase;
    cursor: pointer;
    border: 0;
}

#written{
	font-size:10pt;
	color:gray;
}

.board-contents{
	border-top:2px solid black;
	padding:20px 0px 50px

	
}


.button-box button{
	border:none;
	float:right;
	background-color:white;
}

#h4subject{
	margin:30px 0px
}

.reply fieldset{
	border:2px solid #c0bfbf;
	background-color:#f9fafb;
	width:100%;
	padding:20px 70px 20px 20px ;
	

	
}

fieldset #replyer{
	background-color:#f9fafb;
	border:0px;
	border-bottom:1px solid gray;
}
fieldset #replyer:focus{
	outline:none;
	
}


#QNA{
	width:70%;

	margin:auto;
	margin-top:30px;
	
}
	
#newContent{
	width:100%;
}

#newContent:focus{
	outline:none;
}
	
	


</style>
	


<div id="help_main">
	<div id="QNA">
		<h4 class="QNA_board_title">상품 Q&A</h4>
		<input type="hidden" value="${map}">
		<input type="hidden" value="${boardDTO}">
		<div class="clearfix"></div>
			
			<form id="boardForm" action="" method="post">
				<input type='hidden' name='board_category_num' value='${map.board_category_num}'>
				<input type='hidden' id="board_num" name='board_num' value='${map.board_num}'>
				<input type='hidden' name='pageNum' value='${map.pageNum}'>
				<input type='hidden' name='amount' value='${map.amount}'>
				<input type="hidden" id="reply" value='${boardDTO.reply}'>
				<div>
					<h4 id="h4subject">
						${boardDTO.subject}
						<span id="written" style="margin-left:20px">Written by ${boardDTO.name}</span>
					
					<span style="float:right; font-size:10pt"><fmt:formatDate pattern="yyyy-MM-dd"	value="${boardDTO.logtime}" /><span></h4>
					<div class="clearfix"></div>
					<div class="board-detail-contents">
						<div class="board-contents">
							<p>${boardDTO.content}</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</form>
			
		<div class="button-box ">
			<button id='replyBtn'>REPLY</button>
			<button id='editBtn'>EDIT</button>
			<button id='deleteBtn'>DELETE</button>
			<button id='listBtn'>BACK TO LIST</button>
		</div>
		<div class="clearfix"></div>
		
		<!-- 리플부분 -->
		<div class="reply">
			<form id="replyForm" action="" method="post">
				<input id="board_num" name="board_num" type="hidden" value="${map.board_num}">
				
				<div>
					<div>
						<fieldset>
						
							<p>
								<strong style="margin:20px">Write a Comment</strong>
								<span style="display:block">
									이름 : 
									<input id="replyer" name="replyer" type="text"  >
								</span>
								
								
							</p>
							<div class="view">
								<textarea id="newContent"name="content" rows="10" cols="80" style = "background-color:transparent">
								</textarea>
								<br>
								<a class="confirm" href="#">Confirm</a>
							</div>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
		
		
		<div id="replyList">
			<ul class="boardComment">
				
				<div id="json"></div>
				
			</ul>
		</div>
		
		
		<form id="replyUpdateForm" action="#" method="post" style="display: none;">
			<input id="reply_num" name="reply_num" type="text" value="">
			<div class="board-commentform">
				<fieldset>
					<legend>Edit A Comment</legend>
					<p>
						<strong>Edit A Comment</strong>
						<span>
							"이름 : "
							<input id="updateReplyer" name="replyer" type="text">
						</span>
						
						
						
					</p>
					<div class="view">
						<textarea id="updateContent"style="background-color:blue;"name="content" rows="10" cols="50"></textarea>
						<br>
						<span class="submit">
							<a id="replyUpdateBtn" href="">수정</a>
							<a id="cancelBtn" href="">취소</a>
						</span>
					</div>
				</fieldset>
			</div>
			
		</form>
	</div>
</div> <!-- end #help_main -->
	
	
	

<!-- <script src="/WEB-INF/component/nav/nav.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
let replyUpdateForm = $("#replyUpdateForm");

let viewReplyUpdateForm = function(board_num, reply_num){
	console.log("click");
	console.log($(".row" + reply_num));
	
	$(".row" + reply_num).append(replyUpdateForm);
	$("#reply_num").val(reply_num);
	//$("#commentUpdateForm").show();
	$("#replyUpdateForm").toggle();
}	


let deleteReply = function(reply_num){
	console.log("delete click");
	console.log("reply_num : " + reply_num);
	$.ajax({
		type: 'post',
		url: '/reply/delete',
		data: {"reply_num": reply_num},
		success: function(){
			alert(reply_num + "번 댓글이 삭제되었습니다.");
			showList();
		},
	}); 
}

function showList(){ 
	$.ajax({
		type: 'post',
		url: '/reply/list',
		data: {board_num: $("#board_num").val()},
		//contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		success: function(result){
			//console.log(result);
			let str = "";
			$("#json").text(result.length);
			$.each(result, function(index, items){
				str += "<li class='row"+items.reply_num+"'>";
					str += "<div class='commentTop'>"
						str += "<strong class='name'>" + items.replyer + "</strong>";
						str += "<span class='date'>" + items.replyDate + "</span>";
					str += "</div>"; 	
					str += "<span class='comment-list-button'>";
						str += "<a id='editForm' class='button-text-small' onclick='javascript:viewReplyUpdateForm(" + "\""+items.board_num + "\""+ ", " + "\""+ items.reply_num + "\""+ ")'>EDIT</a>";
						str += "<a id='replyDelete' class='button-text-small' onclick='javascript:deleteReply("+ "\"" +items.reply_num + "\""+")'>DELETE</a>";
					str += "</span>";
					str += "<div class='comment'>";
						str += "<span class='comment_contents'>" + items.content + "</span>";
					str += "</div>"
				str += 	"</li>";
		
			}); //end each
			
			$(".boardComment").html(str);
		},
		
	});
}; // end showList()


$("#cancelBtn").on("click", function(e){
	e.preventDefault();
	$("#replyUpdateForm").hide();
});



let boardForm = $("#boardForm");
let replyForm = $("#replyForm");
//덧글 등록
$("#replyBtn").on("click", function(e){
	e.preventDefault();
	boardForm.attr("action", "/board/replyWriteForm");
	boardForm.submit();
});


//글 수정
$("#editBtn").on("click", function(e){
	e.preventDefault();
	boardForm.attr("action", "/board/modifyForm");
	boardForm.submit();
});

//글 삭제
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	
	if($("#reply").val() > 0) {
		alert("답글이 있는 글은 삭제할 수 없습니다.");
	} else {
		if(confirm("게시물을 삭제하시겠습니까?")){
			boardForm.attr("action", "/board/delete");
			boardForm.submit();
			alert("게시물이 삭제되었습니다.");
		}
	}
	
	//boardForm.attr("action", "/board/delete");
	//boardForm.submit();
});

//목록으로
$("#listBtn").on("click", function(e){
	e.preventDefault();
	boardForm.attr("action", "/board/list");
	boardForm.submit();
});	


//리플작성
$(".confirm").on("click", function(e){
	e.preventDefault();
	
	$.ajax({
		type: 'post',
		url: '/reply/write',
		data: replyForm.serialize(),
		success: function(){
			alert("댓글이 등록되었습니다.");
			$("#replyer").val("");
			$("#newContent").val("");
			showList();
		},
	});
});

//리플 수정
$("#replyUpdateBtn").on("click", function(e){
	e.preventDefault();
	console.log("replyUpdateBtn_click");
	$.ajax({
		type: 'post',
		url: '/reply/update',
		data: replyUpdateForm.serialize(),
		success: function(){
			alert("댓글이 수정되었습니다.");
			$("#updateReplyer").val("");
			$("#updateContent").val("");
			showList();
		},
	});
	
});

//리플 삭제
$("#replyDelete").click(function(e){
	e.preventDefault();
	console.log("replyDelete_click");
	$.ajax({
		type: 'post',
		url: '/reply/delete',
		data: replyUpdateForm.serialize(),
		success: function(){
			alert("댓글이 삭제되었습니다.");
			showList();
		},
	});
	
});

$(function(){
	showList();
});	
	

	
</script>
</body>
</html>
