<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/orderdetail.css" />
<div id="orderdetailDiv" class="col-12 col-lg-6">
	<h3>
		<center>QUICK ORDER</center>
	</h3>
	<div id="quickorderList"></div>
	<!-- 
	<div class="youcartDiv">
		<div class="col-2">
			<img src="" />
		</div>
		<div class="youcartName col-6">
			<p style="margin: 0px 0px 10px 20px">아크테릭스 GAMMA LT HOODY-BLACK</p>
			<span>XL</span>
		</div>
		<div class="col-2">
			<input type="number" min="1" value="1" style="border:none;width:80%;text-align: center;">
		</div>
		<div class="col-2">금액</div>
	</div> 
	-->
	<div id="carttotal">
		<label id="totalamount">TOTAL AMOUNT</label> 
		<span id="total"
			style="font-size: 20pt">토탈금액</span>
		<div id="totallabel">
			<label>Subtotal</label> <span id="subtotal">value</span> <br /> <label>Shipping</label>
			<span id="shipping">value</span>
		</div>
	</div>
<div id="orderinformation">
		<h3>
			<center>주문자 정보</center>
		</h3>
		<label style="color: gray">이름</label><br /> <input type="text"
			id="name" name="name" value="${memUser_InfoDTO.name }" readonly
			style="width: 25%; border: 0px; border-bottom: 1px solid gray" /> <br />
		<label style="color: gray">우편번호</label><br /> <input type="text"
			id="zipcode" name="zipcode" readonly value="${memUser_InfoDTO.zipcode}" style=
			"width: 10%; border: 0px; border-bottom: 1px solid gray" />
		<button id="search">SEARCH</button>
		<br /> <label style="color: gray">주소</label><br /> <input
			type="text" id="addr1" name="addr1" readonly value="${memUser_InfoDTO.addr1}"
			style="width: 80%; border: 0px; border-bottom: 1px solid gray" /> <input
			type="text" id="addr2" name="addr2" value="${memUser_InfoDTO.addr2}"
			style="width: 80%; border: 0px; border-bottom: 1px solid gray" /> <br />
		<label for="phone" style="color: gray">전화</label>
		<p></p>
		<select id="tel1" name="tel1" style="height: 30px">
			<option value="02" selected>02</option>
			<option value="031">031</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="041">041</option>
			<option value="042">042</option>
			<option value="043">043</option>
			<option value="044">044</option>
			<option value="051">051</option>
			<option value="052">052</option>
			<option value="053">053</option>
			<option value="054">054</option>
			<option value="055">055</option>
			<option value="061">061</option>
			<option value="062">062</option>
			<option value="063">063</option>
			<option value="064">064</option>
			<option value="0502">0502</option>
			<option value="0503">0503</option>
			<option value="0504">0504</option>
			<option value="0505">0505</option>
			<option value="0506">0506</option>
			<option value="0507">0507</option>
			<option value="0508">0508</option>
			<option value="0508">0508</option>
			<option value="070">070</option>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - <input type="text" name="tel2" value="${tel2}"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" /> - <input
			type="text" name="tel3" value="${tel3}"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />

		<p></p>
		<label for="phone2" style="color: gray">휴대전화</label>
		<p></p>
		<select id="tel2" name="phone1" style="height: 30px; width: 55px">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - <input type="text" id="phone2" name="phone2"   value="${phone2}"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" /> - <input
			type="text" id="phone3" name="phone3" value="${phone3}"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />
		<p></p>
		<label for="email" style="color: gray">이메일</label>
		<p></p>
		<input type="text" id="email" name="email" value="${memUser_InfoDTO.email}"
			style="width: 50%; border: 0px; border-bottom: 1px solid gray" /><!--  @
		<input type="text" id="email" name="email"
			style="width: 25%; border: 0px; border-bottom: 1px solid gray" /> <select
			id="email" name="email" style="height: 30px; width: 200px">
			<option value="">==이메일 선택==</option>
			<option value="naver">naver.com</option>
			<option value="daum">daum.net</option>
			<option value="nate">nate.com</option>
			<option value="hotmail">hotmail.com</option>
			<option value="empas">empas.com</option>
			<option value="gmail">gmail.com</option>
			<option value="choice">직접입력</option>
		</select> -->
	</div>

	<div id="shippinginformation">
		<h3>
			<center>배송지 정보</center>
		</h3>
		<label style="color: gray">이름</label><br /> <input type="text"
			id="name" name="name" value="${memUser_InfoDTO.name }"
			style="width: 25%; border: 0px; border-bottom: 1px solid gray" /> <br />
		<label style="color: gray">우편번호</label><br /> <input type="text"
			id="zipcode" name="zipcode" readonly value="${memUser_InfoDTO.zipcode }"
			style="width: 10%; border: 0px; border-bottom: 1px solid gray" />
		<button>SEARCH</button>
		<br /> <label style="color: gray">주소</label><br /> <input
			type="text" id="addr1" name="addr1" readonly value="${memUser_InfoDTO.addr1 }"
			style="width: 80%; border: 0px; border-bottom: 1px solid gray" /> <input
			type="text" id="addr2" name="addr2" value="${memUser_InfoDTO.addr2 }"
			style="width: 80%; border: 0px; border-bottom: 1px solid gray" /> <br />
		<label for="phone" style="color: gray">전화</label>
		<p></p>
		<select id="tel1" name="tel1" style="height: 30px">
			<option value="02" selected>02</option>
			<option value="031">031</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="041">041</option>
			<option value="042">042</option>
			<option value="043">043</option>
			<option value="044">044</option>
			<option value="051">051</option>
			<option value="052">052</option>
			<option value="053">053</option>
			<option value="054">054</option>
			<option value="055">055</option>
			<option value="061">061</option>
			<option value="062">062</option>
			<option value="063">063</option>
			<option value="064">064</option>
			<option value="0502">0502</option>
			<option value="0503">0503</option>
			<option value="0504">0504</option>
			<option value="0505">0505</option>
			<option value="0506">0506</option>
			<option value="0507">0507</option>
			<option value="0508">0508</option>
			<option value="0508">0508</option>
			<option value="070">070</option>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - <input type="text" name="tel2" value="${tel2 }"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" /> - <input
			type="text" name="tel3" value="${tel3 }"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />

		<p></p>
		<label for="phone2" style="color: gray">휴대전화</label>
		<p></p>
		<select id="tel2" name="phone1" style="height: 30px; width: 55px">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - <input type="text" id="phone" name="phone2" value="${phone2 }"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" /> - <input
			type="text" id="phone1" name="phone3" value="${phone3 }"
			style="width: 50px; border: 0px; border-bottom: 1px solid gray" />

		<p></p>
		<label style="color: gray">배송메세지</label> <br />
		<textarea> </textarea>
	</div>

	<div id="point">
		<h3 style="margin-bottom: 80px">
			<center>적립금 사용</center>
		</h3>

		<input id="mileageInput" type="number" value="0" min=0 max=${memUser_InfoDTO.mileage}
			style="width: 12%; border: 0px; border-bottom: 1px solid gray"  /> <span
			style="margin-left: 10px">total:${memUser_InfoDTO.mileage }</span>
	</div>

	<div id="payment">
		<h3>
			<center>결제 정보</center>
		</h3>
		<div id="leftright">
			<div id="leftDiv">
				<label>총 결제 금액</label> <span id="lastTotal">금액</span>
			</div>
			<div id="rightDiv">
				<label>결제 방법</label> <input type="radio" checked /> <span>이니시스
					결제</span>
			</div>
		</div>
		<button id="checkoutBtn">Checkout Now</button>
	</div>
</div>

<script type="text/javascript" src="../js/quickorder.js"></script>
