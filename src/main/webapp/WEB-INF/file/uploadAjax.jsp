<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
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
</style>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>	

<div class="uploadResult">
	<ul>
	
	</ul>
</div>

<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>

<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script type="text/javascript">

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

$("#uploadBtn").on("click", function(e){
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
	formData.append("product_number", "1122");

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
			$(".uploadDiv").html(cloneObj.html());
			
		},
	});
});


let uploadResult = $(".uploadResult ul");

function showUploadedFile(uploadResultArr){
	let str = "";
	
	$(uploadResultArr).each(function(i, obj){
		console.log(obj.uploadPath);
		console.log(obj.uuid);
		console.log(obj.fileName);
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
		console.log("fileCallPath : " + fileCallPath);
		str +="<li>" 
			str +="<a href=\"javascript:showImage(\'" + fileCallPath + "\')\">"
				str +="<img src='/file/display?fileName=/" + fileCallPath + "'>";
			str +="</a>";
			str +="<span data-file=\'" + fileCallPath + "\' data-type='image'> X </span>";
		str +="</li>";
		console.log(str);
	});
	uploadResult.append(str);
}
	

//이미지 클릭시 확대
function showImage(fileCallPath){
	//alert(fileCallPath);
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/file/display?fileName=/" + fileCallPath + "'>")
					.animate({width: '100%', height: '100%'}, 0);
}

//확대 이미지 가리기
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 0);
	$(".bigPictureWrapper").hide();
});


//삭제버튼 클릭 이벤트
$(".uploadResult").on("click", "span", function(e){
	let targetFile = $(this).data("file");
	console.log("targetFile : " + targetFile);
	
	$.ajax({
		url: 'deleteFile',
		data: {fileName: targetFile},
		dataType: 'text',
		type: 'POST',
		success: function(result){
			alert(result);
		},
	});
});

</script>


</body>



</html>