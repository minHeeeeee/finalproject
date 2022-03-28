<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/address.css" />
  <input id="user_id" type="hidden" value="${memUser_InfoDTO.user_id}">
  <form id="addressForm" name="addressForm">
  <div id="addressDiv">
    <div id="addbook">
      <h3><center>ADDRESS BOOK</center></h3>
    </div>
    <div id="content">
      <!-- <input id="checkbox" name="checkbox" type="checkbox" value="" />
      <div id="address1">
        <span>${memId}</span>
          <span>${memName}</span>
        <span>${memZipcode}</span>
        <span>${memAddr1}</span>
        <span>${memAddr2}</span>
        <span>0${memPhone}</span>
      </div>

      <a href="/user/addressEdit">EDIT</a> -->
    </div>

    <div id="addBtn">
      <input type="button" id="DELETEbtn" value="DELETE" />
      <input type="button" id="ADDBtn" value="ADD NEW ADDRESS"  onclick="location.href='/addressNew'"/>
    </div>
  </div>
  <script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.6.0.min.js"
></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="../js/address.js"></script>
</form>

