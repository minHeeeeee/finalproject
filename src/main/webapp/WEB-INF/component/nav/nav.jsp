<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 첫번째 div  -->
  <div id="first" class="nav_div">
    <span>SS 22 NEW ARRIVAL</span>
    <a href="http://localhost:3000">관리자페이지</a>
  </div>

  <div id="second_large" class="nav_div">

	  <div>
	    <a href="/" >THE C SHOP</a>
	  </div>
	  
	  <div id="secondmenu">
	    <span><a href="/list?category=men">MEN</a>
	    </span>
	    <span><a href="/list?category=women">WOMEN</a>
	    </span>    
	    <span><a href="/list?category=lifeStyle">LIFE STYLE</a>
	    </span>   
	    <!-- <span><a href="/list?category=sale">SALE</a>
	    </span> -->
	    <span><a href="/brands">BRANDS</a>
	    </span>
	    <span><a href="/board/list?board_category_num=7">POST</a>
	    </span>
	  </div>
	
	  <div>
	    <a href="/board/list?board_category_num=5">HELP</a>
	    <button class="search"style="border: 0; background-color: white;"><i class="fa-solid fa-magnifying-glass"></i></button>
	    <c:if test="${empty sessionScope.memUser_InfoDTO}">
	    	<a href="/login">LOGIN</a>
	    </c:if>
	    <c:if test="${not empty sessionScope.memUser_InfoDTO }">
			<a class="account" id="account">ACCOUNT</a>
		</c:if>
		<div id="account_drop" >
			<ul>
				<li><a href="/account">ACCOUNT DETAIL</a></li>
				<li><a href="">ORDER HISTORY</a></li>
				<li><a href="/addresses">ADDRESSES</a></li>
				<li><a href="/board/list?board_category_num=7">HELP</a></li>
				<li><a class="logoutBtn">LOGOUT</a></li>
			</ul>
		</div>
	    <button class="cart"style="border: 0; background-color: white;"><img src="https://img.icons8.com/material/24/000000/favorite-cart.png"/></button>
	    <!-- <button id="cart"style="border: 0; background-color: white;"><img src="https://img.icons8.com/material/24/000000/clear-shopping-cart--v1.png"/></button>-->
	  </div>
    </div>
  
  <div id="third_large">
  
  </div>
  
  <div id="second_small" class="nav_div">

  <div>
  	<button id="menu"style="border: 0; background-color: white;"><i class="fa-solid fa-bars"></i></button>
 </div>
  
  <div>
    <a href="/" >THE C SHOP</a>
  </div>

  <div>
    <button class="search" style="border: 0; background-color: white;" ><i class="fa-solid fa-magnifying-glass"></i></button>
    <button class="cart"style="border: 0; background-color: white;"><img src="https://img.icons8.com/material/24/000000/favorite-cart.png"/></button>
    <!-- <button id="cart"style="border: 0; background-color: white;"><img src="https://img.icons8.com/material/24/000000/clear-shopping-cart--v1.png"/></button> -->
  </div>
</div>

<div id="third_small">
	<div>
		<div><a href="/list?category=men">MEN</a>
		</div>
		<div><a href="/list?category=women">WOMEN</a>
		</div>    
		<div><a href="/list?category=lifeStyle">LIFE STYLE</a>
		</div>   
		<!-- <div><a href="/list?category=sale">SALE</a>
		</div> -->
		<div><a href="/brands">BRANDS</a>
		</div>
		<div><a href="/board/list?board_category_num=7">POST</a>
		</div>
	</div>
	<hr>
	
	<div id="small_menu">
	<c:if test="${empty sessionScope.memUser_InfoDTO}">
	<div><a href="/login">LOGIN</a>
	</div>
	<div><a href="/join">CREATE ACCOUNT</a>
	</div>
	<div><a href="#">ORDERS</a>
	</div>
</c:if>
<c:if test="${not empty sessionScope.memUser_InfoDTO }">
	<div><a href="/account">ACCOUNT DETAIL</a>
	</div>
	<div><a href="#">ORDER HISTORY</a>
	</div>
	<div><a href="/addresses">ADDRESSES</a>
	</div>	
	<div><a class="logoutBtn">LOGOUT</a>
	</div>
</c:if>
	</div>
</div>
<div id="fourth" class="sticky" >
<form action="/searchList" method="post" style="width:90%">
<input name="product_name" id="keyword" type="text" placeholder="SEARCH" list="options">
</form>
<a href="#" id="searchCloseBtn">close</a>
</div>