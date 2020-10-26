<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.contentDiv {width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script>
	
	function midChk(){
		if($("#mId").val() == ""){
	           alert("아이디를 입력해주세요.");
	           $("#mId").focus();
	           return false;
	        }
	        open("memberIdConfirm.mem?mId="+$("#mId").val(),"아이디 확인",
	        "width=300,height=200,lef=200,top=300");
	}

   
</script>
</head>
<body>

       <%@ include file="../frame/header.jsp" %>

   <div class="contentDiv"  style="">
      <div class="leftMarginDiv" style="width:10%; flaot:left; background-color: red;">
      </div>

      <!-- 회원가입 -->
      <form action='memberOk.mem' method='post' name='frm' id="frm">
      <input type="hidden" name = "num" value="1" id="mIdChk" />
      <div class='memberTab'>
      
      <table width = '600' align = 'center' border = '1' >
         <caption><strong>회원 가입</strong></caption>
         <colgroup>
             <col width="25%" />
            <col width="75%" />
          </colgroup>
         <tfoot>
         <tr>
            <th colspan = 2>
               <input type='submit' value='가입완료' />&nbsp;&nbsp;
               <input type='reset' value='다시 입력' />&nbsp;&nbsp;
               <input type='button' value='가입 안함' /></th>
         </tr>
         </tfoot>
         <tbody>
         <tr>
            <th colspan= '2'>사용자 ID와 비밀번호 입력</th>
         </tr>
         <tr>
            <th ><label for=mId>사용자 ID</label></th><!-- id:#userId1, .userId2 -->
            <td ><input type='text' name='mId' id='mId' class='mId' size='30' maxlength='10' autofocus="autofocus" />
            <input type="button" id="idChk" onclick="midChk();" value="아이디 중복 확인"></td>
         </tr>
         <tr>
            <th ><label for='mPw'>비밀번호</label></th>
            <td ><input type='password' name='mPw' id='mPw' size='15' maxlength='12'/></td>
         </tr>
         <tr>
            <th><label for='mPwCon'>비밀번호확인</label></th>
            <td><input type='password' name='mPwCon' id='mPwCon' size='15' maxlength='12'/></td>
         </tr>
         <tr>
            <th colspan= '2'>여권 정보</th>
         </tr>
         <tr>
            <th><label for='mPassPortNum'>여권번호</label></th>
            <td><input type ='text' name='mPassPortNum' id='mPassPortNum' size='15' maxlength='12'></td>
         </tr>
         <tr>
            <th><label for='mPassPortEnd'>여권 만료일</label></th>
            <td><input type='date' name='mPassPortEnd' id='mPassPortEnd' placeholder='2000-01-01'></td>
         </tr>
         <tr>
            <th><label for='mLastName'>성(LAST NAME)</label></th>
            <td><input type ='text' name='mLastName' id='mLastName' size='15' maxlength='12'></td>
         </tr>
         <tr>
            <th><label for='mFirstName'>이름(FIRST NAME)</label></th>
            <td><input type ='text' name='mFirstName' id='mFirstName' size='15' maxlength='12'></td>
         </tr>
         <tr>
            <th colspan= '2'>회원 기본 정보</th>
         </tr>
         <tr>
            <th><label for='mKorName'>사용자 한글이름</label></th>
            <td><input type ='text' name='mKorName' id='mKorName' size='15' maxlength='12'></td>
         </tr>
          <tr>
            <th><label for='mBirth'>생년원일</label></th>
            <td><input type='date' name='mBirth' id='mBirth' placeholder='1999-12-12'></td>
         </tr>
          <tr>
            <th>성별</th>   
            <td><input type='radio' name='mGender' id='mGender' value='M' /> 남자 &nbsp;&nbsp;&nbsp;&nbsp; 
            <input type='radio' name='mGender' id='mGender' value='F' />여자 </td>
         </tr>
         <tr>
            <th colspan= '2'>사용자 연락처</th>
         </tr>
          <tr>
            <th><label for='mEmail'>사용자 이메일</label></th>
            <td><input type='email' name='mEmail' id='mEmail'/></td>
         </tr>
         <tr>
            <th><label for='mAddr'>사용자 주소</label></th>
            <td><input type='text' name='mAddr' id ='mAddr' /></td>
         </tr>
         <tr>
            <th ><label for='mPh1'>연락처 1</label></th>
            <td><input type='text' name='mPh1' id ='mPh1' placeholder='123-123-1234 ,123-1234-1234' size= '26' maxlength='13' /></td>
         </tr>
         <tr>
            <th><label for='mPh2'>연락처 2</label></th>
            <td><input type='text' name='mPh2' id ='mPh2' placeholder='123-123-1234 ,123-1234-1234' size= '26' maxlength='13' /></td>
         </tr>
         <tr>
            <th colspan= '2'>선택사항</th>
         </tr>
         <tr>
            <th>선호하는 여행 스타일</th>
            <td>
               <input type="checkbox" value="계확여행" name="chk1" />계획여행
               <input type="checkbox" value="자유여행" name="chk1" />자유여행
               <input type="checkbox" value="패키지여행" name="chk1" />패키지여행
               <input type="checkbox" value="패키지" name="chk1" />패키지
               <input type="checkbox" value="패키지" name="chk1" />패키지
            </td>
         </tr>
         <tr>
            <th>가고 싶은 대륙</th>
            <td>
               <input type="checkbox" value="ASIA" name="chk2" />아시아
               <input type="checkbox" value="EUROPE" name="chk2" />유럽
               <input type="checkbox" value="NorthAmerica" name="chk2" />북아메리카
               <input type="checkbox" value="SouthAmerica" name="chk2" />남아메리카
               <input type="checkbox" value="Africa" name="chk2" />아프리카
               <input type="checkbox" value="Oceania" name="chk2" />오세아니아
            </td>
         </tr>
         <tr>
            <th>가고 싶은 나라</th>
            <td>
               <input type="checkbox" value="USA" name="chk3" />일본
               <input type="checkbox" value="CHINA" name="chk3" />중국
               <input type="checkbox" value="TAIWAN" name="chk3" />대만
               <input type="checkbox" value="HONGKONG" name="chk3" />홍콩
               <input type="checkbox" value="THAILAND" name="chk3" />태국
               <input type="checkbox" value="VIETNAM" name="chk3" />베트남
               <input type="checkbox" value="SINA" name="chk3" />싱가포르
            </td>
         </tr>
         </tbody>
      </table>
      </div>
      </form>

      <div id="rightMarginDiv" style="width:10%; flaot:right; background-color: red;">
      </div>
   </div>

      <%@ include file="../frame/footer.jsp" %>


</body>
</html>