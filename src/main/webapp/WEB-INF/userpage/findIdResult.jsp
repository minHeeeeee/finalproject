<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <div id="findIdResultDiv">
      <h3><center>FIND ID</center></h3>
     
      <ul>
        <li>
          <label for="name" style="color: gray">Name</label><br />
          <div id="findname">${memName}</div>
        </li>

        <li>
          <label for="searchOption" style="color: gray">${memOption}</label><br />
          <div id="searchKeyword">${memKeyword}</div>
        </li>
<br>
        <li id="radiofind" style="display:flex">
          <ul id="findid">
          
          </ul>
          <ul id="idOption">
          
          </ul>
        </li>
      </ul>
      <br>

      <input
        id="loginBtn" type="button" name="btn"
        style="font-size: 9pt"
        value="Login";
        onclick = "location.href = 'login' "
      />
      <input
        id="findPwdBtn" type="button"name="'btn" style="font-size: 9pt"
        value="find Password"
        onclick = "location.href = 'findPwd' "
      />
    </div>
    
   
  <script>
  function maskingId(findid) {
	  return findid.map(item=>{
		  console.log(item)
		  if (item == undefined || item === '') {
			  return '';
		  }
		  var pattern = /.{3}$/; // 정규식
		  return item.replace(pattern, "***");
	  })
	}
  	console.log(${memRank},${memSys})
    const id=maskingId(${memId})
    		console.log(id);
    		id.map((item,index)=>{
    	    $('#findid').append($('<li/>',{text:item}))
    		$('#idOption').append($('<li/>',{text:'('+${memRank}[index]+','+${memSys}[index]+'가입)'}))})
  </script>
  


