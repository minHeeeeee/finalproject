<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<!-- <meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/component/nav.css" />
<link rel="stylesheet" href="/index.css" />
<link rel="stylesheet" href="help.css" />
 -->
 <script src="https://kit.fontawesome.com/cd631a71a1.js" crossorigin="anonymous"></script>
<title>modify</title>
</head>
<body>
<style>
ul {
	margin: 0px;
	font-size: 0.8rem;
	font-weight: bold;
}


.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background:rgba(255,255,255,0.5);
}

.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img{
	width: 600px;
}

.prvBtn{


width:80px;
border:2px solid black;
display:inline-block;
padding:3px;



}

.modBtn{
background-color: white;
border:2px solid black;

}

#updateFile{
background-color: white;

}
</style>

	<div id="empty"></div>
	<div id="help_main">
		<div id="QNA">
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

			<c:choose>
				<c:when test="${map.board_category_num eq '7'}">
					<form id="boardModifyForm" action="/board/modify" method="post">
						<input type="hidden" id="board_num" name="board_num" value="${boardDTO.board_num}">
						<input type="hidden" name="board_category_num" value="${boardDTO.board_category_num}"> 
						
						<div>
							<ul class="form-submit-board">
								<li>
									<label>subject</label> 
										<input type="text" id="subject" name="subject" value="${boardDTO.subject}">
									<span class="label-box"></span>
								</li>
								<li>
									
										<input type="hidden" id="user_name" name="user_name" value="${boardDTO.user_name}"> 
									<span class="label-box"></span>
								</li>
								<li>
									<label>Content</label>
									<div id="content">
										<textarea id="content" name="content" rows="40" cols="150">
										${boardDTO.content}
										</textarea>
										
									</div>
								</li>
							</ul>
							
							<div class="uploadDiv">
								<input id="updateFile" type="file" name="uploadFile" style="border-color: black solid 2px; " multiple>
							</div>	
							
							<div class="uploadResult">
								<ul>
								
								</ul>
							</div>
							
							<div class="bigPictureWrapper">
								<div class="bigPicture">
								</div>
							</div>
							
							
							<div id="botton box">
								<span class=""> 
									<a class="prvBtn" href="/page/help" >이전화면</a>
								</span> 
								<span>
									<button class="modBtn" type="submit" formmethod="post" >수정하기</button>
								</span>
							</div>
						</div>
					</form>
				</c:when>


				
				<c:otherwise>
					<form id="boardModifyForm" action="/board/modify" method="post">
						<!-- 
						<input id="product_num" name="product_num" type="hidden">
						<input id="category_num" name="product_num" type="hidden">
						<input onabort="order_id" name="order_id" type="hidden">
						
						 -->
						<input type="hidden" name="board_category_num" value="${map.board_category_num}"> 
						<input type="hidden" id="board_num" name="board_num" value="${map.board_num}" >
						<input type="text" name="pageNum" value="${map.pageNum}">
						<input type="text" name="amount" value="${map.amount}">
						<div>
							<ul class="form-submit-board">
								<li>
									<label>subject</label>
									<select id="subject" name="subject">
										<option value="사이즈문의입니다.">사이즈문의입니다.</option>
										<option value="재고문의입니다.">재고문의입니다.</option>
										<option value="배송문의입니다.">배송문의입니다.</option>
										<option value="재입고문의입니다.">재입고문의입니다.</option>
										<option value="기타문의입니다.">기타문의입니다.</option>
									</select>
									<span class="label-box"></span>
								</li>
								<li>
									<input type="hidden" id="user_name" name="user_name" value="${boardDTO.user_name}">
									<span class="label-box"></span>
								</li>
								<li>
									<label>Content</label>
									<div id="content">
										<textarea id="content" name="content" rows="40" cols="150">${boardDTO.content}</textarea>
										<div class="toolbar">
											<span class="fr-counter">문자(조회수넣을까?) : </span>
										</div>
									</div>
								</li>
							</ul>
							<div id="botton box">
								<span class="" >
									<a class="prvBtn"  href="/page/help" style="border:1px solid black; ">이전화면</a>
								</span>
								<span>
									<button class="modBtn" type="submit" formmethod="post" style="background-color: write;">수정하기</button>
								</span>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>

	</div> <!-- end #help_main -->
	
	<!-- <script src="/WEB-INF/component/nav/nav.js"></script> -->
	
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	let board_num = $("#board_num").val();
	console.log(board_num);
	(function(){
		$.ajax({
			type: 'post',
			url: '/board/getFileList',
			data: {board_num: $("#board_num").val()},
			dataType: 'json',
			success: function(arr){
				console.log(arr);
				showUploadedFile(arr);
			},
		});
	})();
});






//수정하기 버튼 클릭시 이벤트
$("button[type='submit']").on("click", function(e){
	e.preventDefault();
	console.log("submit cliecked");
	let str = ""
	$(".uploadResult ul li").each(function(i, obj) {
		let jobj = $(obj);
		console.log(jobj);

		str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].linked_number' value='"+jobj.data("linked_number")+"'>";
	    console.log(str);
	});
	
	$("#boardModifyForm").append(str).submit();
});


//let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
let regex = new RegExp("(.*?)\.(png|bmp|jpeg|jpg)$");
let maxSize = 1024 * 1024 * 5; //5MB

function checkExtension(fileName, fileSize) {
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}

	if (!regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
}

let cloneObj = $(".uploadDiv").clone();

$("input[type='file']").change(function(e){
	let formData = new FormData();
	let inputFile = $("input[name='uploadFile']");
	
	let files = inputFile[0].files;
	
	//add file to formdata
	for (let i = 0; i < files.length; i++) {
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		
		formData.append("uploadFile", files[i]);
	}
	formData.append("board_num", $("#board_num").val());

	$.ajax({
		url: '/file/uploadAjaxAction',
		processData: false, // data 파라미터로 전달된 데이터를 Query String으로 변환하지 않음. 파일전송시에는 이렇게 해야함
		contentType: false, // //contentType의 default는 application/x-www-form-urlencoded; charset=UTF-8, 파일전송시에는 false로 해줘야 함
		data: formData,
		type: 'post',
		dataType: 'json',
		
		success: function(result) {
			console.log(result);
			showUploadedFile(result);	
			//$(".uploadDiv").html(cloneObj.html());
		},
	});
});


let uploadResult = $(".uploadResult ul");

function showUploadedFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0) {return;}
	
	
	let str = "";
	
	$(uploadResultArr).each(function(i, obj){
		console.log(obj.uploadPath);
		console.log(obj.uuid);
		console.log(obj.fileName);
		aaa = obj.uploadPath;
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
		let originPath = obj.uploadPath + "\\" +obj.uuid + "_" + obj.fileName;
		originPath = originPath.replace(new RegExp(/\\/g), "/");
		
		// "\"를 "/"으로 수정 
		aaa = aaa.replace(new RegExp(/\\/g), "/");
		console.log("fileCallPath : " + fileCallPath);
		console.log("originPath : " + originPath);
		console.log("aaa : " + aaa);
		//str +="<li data-path='" +  obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_number='" + obj.uploadPath +"'>";
		str +="<li data-path='" +  aaa + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_number='" + obj.uploadPath +"'>";
		str +="<div>"
			str +="<span>" + obj.fileName +"</span>"
			str +="<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'> X </button><br>";
			str +="<a href=\"javascript:showImage(\'" + originPath + "\')\">"
				str +="<img src='/file/display?fileName=/" + fileCallPath + "'>";
			str +="</a>";
		str +="</div>"
	str +="</li>";
		console.log(str);
	});
	uploadResult.append(str);
}

//이미지 클릭시 확대
function showImage(fileCallPath){
	console.log(fileCallPath)
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/file/display?fileName=/" + fileCallPath + "'>")
					.animate({width: '100%', height: '100%'}, 0);
}

//확대 이미지 가리기
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 0);
	$(".bigPictureWrapper").hide();
});

//x삭제버튼 클릭 이벤트
$(".uploadResult").on("click", "button", function(e){

	let targetFile = $(this).data("file");
	console.log("targetFile : " + targetFile);
	
	if(confirm("파일을 제거하시겠습니까?")){
		let targetLi = $(this).closest("li");
		targetLi.remove();
	}
	
	
	
});
</script>

</html>
