<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.contentDiv {width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.contentDiv > h3 {font-size: 30px; text-align:center;}
	
	table{width:700px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	th {font-size:20px; padding-top:10px; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	.value > input {margin-left: 15px; border: 1px solid #d9d9d9;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script>
	$(function(){
		$("#frm").submit(function(){
			if($("#mId").val() == "" || $("#mId").val() == null ){
				alert("아이디를 입력해 주세요");
				$("#mId").focus();
				return false;
			}
			if($("#mPw").val() == "" || $("#mPw").val() == null ){
				alert("비밀번호를 입력해 주세요");
				$("#mPw").focus();
				return false;
			}
			if($("#mPw").val() != $("#mPwCon").val() ){
				alert("비밀번호가 일치하지 않습니다.");
				$("#mPw").val("");
				$("#mPwCon").val("");
				$("#mPw").focus();
				return false;
			}
			if($("#mPassPortNum").val() == "" || $("#mPassPortNum").val() == null ){
				alert("여권번호를 입력해 주세요");
				$("#mPassPortNum").focus();
				return false;
			}
			if($("#mPassPortEnd").val() == "" || $("#mPassPortEnd").val() == null ){
				alert("여권번호 만료일을 선택해 주세요");
				$("#mPassPortEnd").focus();
				return false;
			}
			if($("#mLastName").val() == "" || $("#mLastName").val() == null ){
				alert("성(LastName)을 입력해 주세요");
				$("#mLastName").focus();
				return false;
			}
			if($("#mFirstName").val() == "" || $("#mFirstName").val() == null ){
				alert("이름(LastName)을 입력해 주세요");
				$("#mFirstName").focus();
				return false;
			}
			if($("#mKorName").val() == "" || $("#mKorName").val() == null ){
				alert("이름을 입력해 주세요");
				$("#mKorName").focus();
				return false;
			}
			if($("#mBirth").val() == "" || $("#mBirth").val() == null ){
				alert("생년월일을 선택해 주세요");
				$("#mBirth").focus();
				return false;
			}
			if(!$("input:radio[name='mGender']").is(":checked")){
				alert("사용자 성별을 선택하세요");
				$("input:radio[name='mGender']:radio[value='M']").attr("checked",true);
				return false;
			}
			if($("#mEmail").val() == "" || $("#mEmail").val() == null ){
				alert("이메일을 입력해 주세요");
				$("#mEmail").focus();
				return false;
			}
			if($("#mAddr").val() == "" || $("#mAddr").val() == null ){
				alert("주소를 입력해 주세요");
				$("#mAddr").focus();
				return false;
			}
			if($("#mPh1").val() == "" || $("#mPh1").val() == null ){
				alert("연락처를 입력해 주세요");
				$("#mPh1").focus();
				return false;
			}
			if($("#num").val() == 1){
				alert("중복체크를 해주세요");
				return false;
			}			
		});	

		$("#idChk").click(function(){
			if($("#mId").val() == ""){
				alert("아이디를 입력해주세요.");
				$("#mId").focus();
				return false;
			}
			open("memberConfirm.mem?mId="+$("#mId").val(),"아이디 확인",
			"width=300,height=200,lef=200,top=300");
		});
	});
</script>
</head>
<body>
<%@ include file="../frame/header.jsp" %>

<div class="contentDiv">
	<h3>회원가입</h3>
	<!-- 회원가입 -->
	<div class='memberTab'>
	<form action='memberOk.mem' method='get' name='frm' id="frm">
		<input type="hidden" name = "num" value="1" id="mIdChk" />
			<table  >
				<colgroup>
				    <col width="25%" />
					<col width="75%" />
			    </colgroup>
				<tbody>
				<tr>
					<th colspan= '2'>사용자 ID와 비밀번호 입력</th>
				</tr>
				<tr>
					<td class="subject">
						사용자 ID
					</td><!-- id:#userId1, .userId2 -->
					<td class="value">
						<input type='text' name='mId' id='mId' class='mId' autofocus="autofocus" />
						<input type="button" id="idChk" value="아이디 중복 확인">
					</td>
				</tr>
				<tr>
					<td class="subject">
						비밀번호
					</td>
					<td class="value">
						<input type='password' name='mPw' id='mPw' size='15' maxlength='12'/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						비밀번호확인
					</td>
					<td class="value">
						<input type='password' name='mPwCon' id='mPwCon' size='15' maxlength='12'/>
					</td>
				</tr>
				<tr>
					<th colspan= '2'>여권 정보</th>
				</tr>
				<tr>
					<td class="subject">
						여권번호
					</td>
					<td class="value">
						<input type ='text' name='mPassPortNum' id='mPassPortNum' size='15' maxlength='12'>
					</td>
				</tr>
				<tr>
					<td class="subject">
						여권 만료일
					</td>
					<td class="value">
						<input type='date' name='mPassPortEnd' id='mPassPortEnd' placeholder='2000-01-01'>
					</td>
				</tr>
				<tr>
					<td class="subject">
						성(LAST NAME)
					</td>
					<td class="value">
						<input type ='text' name='mLastName' id='mLastName' size='15' maxlength='12'>
					</td>
				</tr>
				<tr>
					<td class="subject">
						이름(FIRST NAME)
					</td>
					<td class="value">
						<input type ='text' name='mFirstName' id='mFirstName' size='15' maxlength='12'>
					</td>
				</tr>
				<tr>
					<th colspan= '2'>회원 기본 정보</th>
				</tr>
				<tr>
					<td class="subject">
						사용자 한글이름
					</td>
					<td class="value">
					<input type ='text' name='mKorName' id='mKorName' size='15' maxlength='12'>
					</td>
				</tr>
			 	<tr>
					<td class="subject">
						생년원일
					</td>
					<td class="value">
					<input type='date' name='mBirth' id='mBirth' placeholder='1999-12-12'>
					</td>
				</tr>
			 	<tr>
					<td class="subject">
						성별
					</td>	
					<td class="value">
						<input type='radio' name='mGender' id='mGender' value='M' /> 남자 &nbsp;&nbsp;&nbsp;&nbsp; 
						<input type='radio' name='mGender' id='mGender' value='F' />여자
						 </td>
				</tr>
				<tr>
					<th colspan= '2'>사용자 연락처</th>
				</tr>
			 	<tr>
					<td class="subject">
						사용자 이메일
					</td>
					<td class="value">
						<input type='email' name='mEmail' id='mEmail'/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						사용자 주소
					</td>
					<td class="value">
						<input type='text' name='mAddr' id ='mAddr' />
					</td>
				</tr>
				<tr>
					<td class="subject">
						연락처 1
					</td>
					<td class="value">
						<input type='text' name='mPh1' id ='mPh1' placeholder='123-123-1234 ,123-1234-1234' size= '26' maxlength='13' />
					</td>
				</tr>
				<tr>
					<td class="subject">
						연락처 2
					</td>
					<td class="value">
						<input type='text' name='mPh2' id ='mPh2' placeholder='123-123-1234 ,123-1234-1234' size= '26' maxlength='13' />
					</td>
				</tr>
				<tr>
					<th colspan= '2'>선택사항</th>
				</tr>
				<tr>
					<td class="subject">
						선호하는 여행 스타일
					</td>
					<td class="value">
						<input type="checkbox" value="계확여행" name="chk1" />계획여행
						<input type="checkbox" value="자유여행" name="chk1" />자유여행
						<input type="checkbox" value="패키지여행" name="chk1" />패키지여행
						<input type="checkbox" value="패키지" name="chk1" />패키지
						<input type="checkbox" value="패키지" name="chk1" />패키지
					</td>
				</tr>
				<tr>
					<td class="subject">
						가고 싶은 대륙
					</td>
					<td class="value">
						<input type="checkbox" value="ASIA" name="chk2" />아시아
						<input type="checkbox" value="EUROPE" name="chk2" />유럽
						<input type="checkbox" value="NorthAmerica" name="chk2" />북아메리카
						<input type="checkbox" value="SouthAmerica" name="chk2" />남아메리카
						<input type="checkbox" value="Africa" name="chk2" />아프리카
						<input type="checkbox" value="Oceania" name="chk2" />오세아니아
					</td>
				</tr>
				<tr>
					<td class="subject">
						가고 싶은 나라
					</td>
					<td class="value">
						<input type="checkbox" value="USA" name="chk3" />일본
						<input type="checkbox" value="CHINA" name="chk3" />중국
						<input type="checkbox" value="TAIWAN" name="chk3" />대만
						<input type="checkbox" value="HONGKONG" name="chk3" />홍콩
						<input type="checkbox" value="THAILAND" name="chk3" />태국
						<input type="checkbox" value="VIETNAM" name="chk3" />베트남
						<input type="checkbox" value="SINA" name="chk3" />싱가포르
						<!-- 
						<input type="checkbox" value="" name="chk3" />독일
						<input type="checkbox" value="" name="chk3" />프랑스
						<input type="checkbox" value="" name="chk3" />영국
						<input type="checkbox" value="" name="chk3" />이탈리아
						<input type="checkbox" value="" name="chk3" />스위스
						<input type="checkbox" value="" name="chk3" />스페인
						<input type="checkbox" value="" name="chk3" />포르투갈
						<input type="checkbox" value="" name="chk3" />러시아
						<input type="checkbox" value="" name="chk3" />터키
						<input type="checkbox" value="" name="chk3" />헝가리
						<input type="checkbox" value="" name="chk3" />크로아티아
						<input type="checkbox" value="" name="chk3" />미국
						<input type="checkbox" value="" name="chk3" />캐나다
						-->
					</td>
				</tr>
				</tbody>
			</table>
			<div class="btn">
				<input type='submit' value='가입완료' />&nbsp;&nbsp;
				<input type='reset' value='다시 입력' />&nbsp;&nbsp;
				<input type='button' value='가입 안함' />
			</div>
		</form>
	</div>
</div>

<%@ include file="../frame/footer.jsp" %>

</body>
</html>