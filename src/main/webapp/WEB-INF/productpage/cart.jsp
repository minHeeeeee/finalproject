
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/cart.css" />
<div id="cartok">
	<div id="top" class="col-12">
		<h3>SHOPPING CART</h3>
	</div>
	<div id="mid" class="col-12 col-sm-6">
		<!-- 
    <div class="product">
      <div class="detail">
        <div class="img"></div>
        <div class="detailDiv">
          <a href="#"> 더뮤지엄비지터 </a>
          <span> OS </span>
          <span> 158,000원 </span>
          <div class="number">
            <a href="#">Down</a>
            <span>1</span>
            <a href="#">Up</a>
          </div>
        </div>
      </div>
      <span class="remove">remove</span> 
      -->
	</div>
	<div id="side" class="col-12 col-sm-6">
		<div id="total">
			<label id="totallabel" style="color: black">TOTAL AMOUNT</label> <br />
			<span id="totalvalue" style="color: black; font-size: 25pt">value</span>
			<br /> <label class="gray">Subtotal</label> <span id="subtotalvalue">value원</span>
			<br /> <label class="gray">Shpping</label> <span id="shippingvalue">value원</span>
			<br /> <br /> <a href="/checkout"
				style="font-size: 30px; font-weight: bold">CHECK OUT</a>
			<hr>
		</div>
		<div id="neverpay"></div>
	</div>
	<div id="noCart" style="display: none">
		<p>
			Your cart is empty. <a href="/list?category=men">Go Shopping</a>
		</p>
	</div>
</div>

<script type="text/javascript" src="../js/cart.js"></script>