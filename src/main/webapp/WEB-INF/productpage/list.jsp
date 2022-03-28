<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input id="categoryInput" type="hidden" value=${param.category}>
<input id="pgInput" type="hidden" value=${param.pg}>
<div class="col-12" style="display: grid;
grid-template-columns: 200px;
padding: 20px;
grid-template-rows: 50px auto 50px;"
>
    <div id="categoryNameDiv">
	    <div></div>
	    <div></div>
    </div>
    <div id="categoryListDiv">
    	<ul id="categoryName">
    	</ul>
    </div>
    
    <div id="productListDiv"></div>
    <div id="pagingDiv"></div>
</div>


<script type="text/javascript" src="../js/list.js"></script>