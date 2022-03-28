<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div id="findPwdResultDiv">
      <h3><center>FIND PassWord</center></h3>
     
      <ul>
        <li>
          <label for="name" style="color: gray">Name</label><br />
          <div id="findname">${memName}</div>
          <input type="hidden" value="${memId}" id="user_id">
        </li>

        <li id="radiofind">
          <label for="searchOption" style="color: gray">${memOption}</label><br/>
          <input type="hidden" value="${memOption}" id="memOption">
          <input type="radio" style="color: gray" checked/>
          <span id="searchkeyword">${memKeyword}</span>
          <input type="hidden" value="${memKeyword}" id="memKeyword">
        </li>

      </ul>
      <br>

      <input
        id="rePwdBtn" type="button" name="pwdbtn2"
        style="font-size: 9pt"
        value="임시비밀번호 전송"; />
        
      <input
        id="cancel" type="button"name="cancelbtn" style="font-size: 9pt"
        value="취소"
        onclick = "location.href = 'login' " />
    </div>
    
   
  
  

