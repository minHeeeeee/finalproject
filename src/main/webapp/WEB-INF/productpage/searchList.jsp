<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="prd" value="${requestScope.product_name}">

<div>
<div id="searchResultDiv"></div>
<div id="searchListsDiv" style="display:flex; flex-wrap:wrap">
            </div>
<div id="searchPagingDiv"></div>
</div>
<script type="text/javascript" src="../js/searchList.js"></script>