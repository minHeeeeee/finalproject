<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/addressNew.css" />
<form id="addressEditForm" name="addressEditForm">


	<div id="addressEditDiv">
<h3>
	<center>NEW ADDRESS</center>
</h3>
		<input type="hidden" id="user_id" name="user_id" value=${memUser_InfoDTO.user_id}>
		<label for="address" style="color: gray">배송지명</label><br /> <input
			type="text" id="addressname" name="addr_name"
			style="width: 100%; border: 0px; border-bottom: 1px solid gray">
		<p></p>

		<label for="name" style="color: gray">이름</label><br /> <input
			type="text" id="name" name="user_name"
			style="width: 100%; border: 0px; border-bottom: 1px solid gray" />

		<p></p>
		<div id="postDiv">
			<div id="post1">
				<label for="post" style="color: gray">우편번호</label><br /> <input
					type="text" id="zipcode" name="zipcode" readonly
					style="width: 100%; border: 0px; border-bottom: 1px solid gray" />
			</div>
			<div id="post2">
				<label for="postbtn" style="color: gray">우편번호/주소</label>
				<button id="postbtn"
					style="border: 0px; background-color: white; font-weight: bold; font-size: 9pt; color: black; padding: 0; cursor: pointer; margin-top: 10px;"
					onclick="checkPost(); return false;">우편번호 검색</button>
			</div>
		</div>
		<p></p>
		<p></p>

		<label for="address" style="color: gray">주소1(지번/도로명)</label><br /> <input
			type="text" id="addr1" name="addr1" readonly
			style="width: 100%; border: 0px; border-bottom: 1px solid gray" />
		<p></p>
		<label for="address2" style="color: gray">주소2(동/호수등)</label><br /> <input
			type="text" id="addr2" name="addr2"
			style="width: 100%; border: 0px; border-bottom: 1px solid gray" />
		<p></p>
		<label for="phone2" style="color: gray">휴대전화번호</label>
		<p></p>
		<select id="tel2" name="phone1" style="height: 30px; width: 55px">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> — <input type="text" id="phone" name="phone2"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />
		— <input type="text" id="phone1" name="phone3"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />
		<p></p>
		<input type="checkbox" value=""> 기본배송지로 저장

		<div id="btn">
			<input type="button" id="cancelBtn" value="CANCEL"
				onclick="location.href='addresses'"> <input
				type="button" id="saveBtn" value="SAVE">

		</div>
	</div>
</form>

<script type="text/javascript" src="../js/addressNew.js"></script>

