<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="detailDiv" style="display: flex; flex-wrap: wrap; justify-content: center;">
	<input type="hidden" id="product_number" value="${param.seq}">
	<div id="detailImg" class="col-12 col-sm-7"
		style="display: flex; flex-wrap: wrap"></div>
	<div id="detailProductDiv" class="col-12 col-sm-5">
		<div id="productNameDiv"></div>
		<div id="sizeSelectDiv">
			SIZE<br> <select id="sizesSelect" name="size"
				style="width: 100%">
				<option value="">[필수]옵션을 선택해 주세요</option>
				<option value="">---------------------</option>
				<option value="">SIZE</option>
			</select>
		</div>
		<div id="orderDiv">
			<div id="addCart" style="float: right; cursor: pointer">ADD TO
				CART</div>
		</div>
		<div>
			<div id="quickorder" style="float: right; cursor: pointer">quick
				order</div>
		</div>
		<div id="detailContent">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-bs-target="#details" data-toggle="tab">DETAILS</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-target="#size"
					data-toggle="tab">SIZE MEASUREMENT</a></li>
				<li class="nav-item"><a class="nav-link"
					data-bs-target="#shipping" data-toggle="tab">SHIPPING & RETURN</a>
				</li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane active container" id="details"></div>
				<div class="tab-pane container" id="size">
					<table>
						<tr id="product_size">
							<th>SIZE(CM)</th>
						</tr>
						<tr id="product_length">
							<td>기장[LENGTH]</td>
						</tr>
						<tr id="product_shoulder">
							<td>어깨[SHOULDER]</td>
						</tr>
						<tr id="product_chest">
							<td>가슴[CHEST]</td>
						</tr>
						<tr id="product_sleeve">
							<td>소매[SLEEVE]</td>
						</tr>
						<tr id="product_waist_width">
							<td>허리[WAIST WIDTH]</td>
						</tr>
						<tr id="product_thigh_width">
							<td>허벅지[THIGH WIDTH]</td>
						</tr>
						<tr id="product_ankle_circumference">
							<td>밑단[ANKLE CIRCUMFERENCE]</td>
						</tr>
						<tr id="product_front_rise">
							<td>밑위[FRONT RISE]</td>
						</tr>
						<tr id="product_cap_length">
							<td>챙길이[CAP LENGTH]</td>
						</tr>
						<tr id="product_cap_circumference">
							<td>챙둘레[CAP CIRCUMFERENCE]</td>
						</tr>
						<tr id="product_detail" style="border-style: none;">
						</tr>
					</table>
				</div>
				<div class="tab-pane container" id="shipping">

					<pre>Delivery
배송 방법 : 택배
배송 지역 : 전국지역
배송 비용 : 2,500원
배송 기간 : 2일 ~ 3일
배송 안내 :
ㆍ 배송사 CJ택배 (1588-1255)
ㆍ 총 구매금액 5만원 이상 무료배송이며, 5만원 미만 주문시 배송료 2500원이 부과됩니다.
ㆍ 무통장 입금건 경우 입금 기한은 24시간이며, 경과시 자동취소 됩니다.
ㆍ 제주도, 도서, 산간지역은 항공료나 해상운송료에 따라 추가 운임비가 발생할 수 있으며, 평균 배송일보다 1~2일정도 더 소요될수 있습니다.
ㆍ 배송은 오후 1시 이전 결제 완료건에만 당일 출고 도와드리고 있습니다.(주말 또는 공휴일 제외)
ㆍ 주문량이 많아 물량이 밀려있을때에는 다음날 배송 되실수 있는 점 양해 부탁드리겠습니다.
ㆍ 상품 준비 도중 시스템 오류나 제품상 문제로 상품의 발송이 지연되거나 품절이 될 수 있습니다.


Exchange & Returns
(1) 교환 환불 규정 안내
ㆍ 상품 수령 후 7일 이내 교환 및 환불 요청 가능합니다.
ㆍ 반송 주소지 (전북 전주시 완산구 전주객사4길 53 1층 더엑스샵)
ㆍ 타 점 배송의 경우 배송된 매장으로 보내주셔야 합니다.
ㆍ 휴대폰 결제시에는 주문하신 날짜의 매월 초일부터 말일까지 환불이 가능하지만
말일이 지나면 결제취소가 안되어 현금환불로 가능합니다. (휴대폰결제 수수료 3.5% 제외 후 환불처리)

(2) 교환 환불 불가 사항
ㆍ제품 수령후 7일이내 교환 및 환불 요청을 안한경우(반품수거가 2일경과시 반품매장 카카오톡 연락 필히 요망)
ㆍ교환 및 반품이 불가능함을 따로 명시한 경우 고객님에 의한 상품, 라벨, 택 들이 멸실, 훼손 또는 오염되었을 경우
ㆍ고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 감소한 경우(상품의 사용, 착용, 수선, 세탁 등)

(3) 교환 환불 신청 방법
ㆍ 교환 및 반품 접수는 카카오톡으로 접수 부탁드리겠습니다.
ㆍ 네이버 페이 주문건 네이버 마이페이지 접속후 교환&반품 신청후 택배 자동수거 요청(CJ 택배)


(4) 환불안내
ㆍ환불시 반품 확인여부를 확인한 후 영업일로 평일 3일 이내(주말제외)에 결제 금액을 환불해 드립니다.
ㆍ신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.
ㆍ체크카드, 네이버페이 결제건은 영업일기준 3일정도 소요되어 입금처리됩니다.
ㆍ무통장 입금건은 고객님 계좌를 필히 적어 주어야 환불진행이 빠릅니다.
ㆍ모니터의 해상도에 따라 화면에서 보시는 것과 약간의 색감차이, 사이즈는 재는 기준에 따라 오차는 발생하기에 교환 및 환불은 가능하지만 배송비는 고객님이 부담하셔야 합니다.
</pre>
				</div>
			</div>
		</div>
	</div>
	<form id='actionForm' action="/board/list" method='post'>
					<input type='hidden' name='board_category_num' value='4'>
					<input id="board_num" type='hidden' name='board_num' value="">
					<input type='hidden' name='pageNum' value='1'>
					<input type='hidden' name='amount' value='10'>
					
				</form>
	<div id="reviewBoardDiv" class="col-12 col-lg-9">
		<div>Review
		<span>
		<a id="moveWriteForm" style="display:none">WRITE</a>
		<a id="moveListForm">VIEW ALL</a>
		</span>
		</div>
		<div id="nothingContent">
			<p>게시물이 없습니다.</p>
		</div>
		<div id="reviewTableDiv">
			<table id="reviewTable" class="col-12">
				<tr>
					<th class="col-1">No</th>
					<th class="col-8">Subject</th>
					<th class="col-1">Writer</th>
					<th class="col-2">Date</th>
				</tr>
			</table>
		</div>
		
	</div>
	<script type="text/javascript" src="../js/detail.js"></script>