<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div id="editDiv" >
    <form id="editForm" name="editForm">
      <div id="write">
      <p>Edit Account</p>
        <label for="id" style="color: gray">아이디</label><br />
        <input
          type="text"
          id="user_id"
          name="user_id"
         value="${memUser_InfoDTO.user_id}"
         readonly
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <input type="hidden" name="check" id="check" value="" />
        <div id="idDiv"></div>
        <p></p>

        <label for="pwd" style="color: gray">비밀번호</label><br />

        <input
          type="password"
          id="user_pwd"
          name="user_pwd"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <div id="pwdDiv"></div>
        <p style="font-size: 10pt">
          (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
        </p>

        <label for="pwdck" style="color: gray">비밀번호확인</label><br />

        <input
          type="password"
          id="pwdck"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <div id="pwdckDiv"></div>
        <p></p>

        <label for="name" style="color: gray">이름</label><br />

        <input
          type="text"
          id="name"
          name="name"
        value="${memUser_InfoDTO.name}"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />

        <p></p>

        <label for="post" style="color: gray">우편번호</label><br />

        <input
          type="text"
          id="zipcode"
          name="zipcode"
          readonly
          value="${memUser_InfoDTO.zipcode}"
          style="width: 25%; border: 0px; border-bottom: 1px solid gray"
        />
        <input
          id="postbtn"
          type="button"
          style="
            border: 0px;
            background-color: white;
            font-weight: bold;
            font-size: 9pt;
          "
          value="우편번호검색"
          onclick="checkPost()"
        />
        <p></p>

        <p></p>

        <label for="address" style="color: gray">주소</label><br />

        <input
          type="text"
          id="addr1"
          name="addr1"
          readonly
          value="${memUser_InfoDTO.addr1}"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <p></p>
        <input
          type="text"
          id="addr2"
          name="addr2"
         value="${memUser_InfoDTO.addr2}"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <p></p>
        <label for="phone" style="color: gray">전화</label>
        <p></p>
        <select id="tel1" name="tel1" style="height: 30px"value=${tel1}>
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
        </select>
        -
        <input
          type="text"
          name="tel2"
        		  value="${tel2}"
          style="width: 13%; border: 0px; border-bottom: 1px solid gray"
        />
        -
        <input
          type="text"
          name="tel3"
        		  value="${tel3}"
          style="width: 13%; border: 0px; border-bottom: 1px solid gray"
        />

        <p></p>
        <label for="phone2" style="color: gray">휴대전화</label>
        <p></p>
        <select id="tel2" name="phone1" style="height: 30px; width: 55px" value=${phone1}>
          <option value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="018">018</option>
          <option value="019">019</option>
        </select>
        -
        <input
          type="text"
          id="phone"
          name="phone2"
        		  value="${phone2}"
          style="width: 13%; border: 0px; border-bottom: 1px solid gray"
        />
        -
        <input
          type="text"
          id="phone1"
          name="phone3"
          value="${phone3}"
          style="width: 13%; border: 0px; border-bottom: 1px solid gray"
        />
        <p></p>
        <label for="email" style="color: gray">이메일</label>
        <p></p>
        <input
          type="text"
          id="email"
          name="email"
         value="${memUser_InfoDTO.email}"
          style="width: 100%; border: 0px; border-bottom: 1px solid gray"
        />
        <div id="emailDiv"></div>

        <input type="button" id="editbtn" value="Edit Account " />
        <input type="button" id="deletebtn" value="Delete Account " />
      </div>
    </form>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
