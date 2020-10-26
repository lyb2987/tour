<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.page{width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.MYPAGE{width:1200px; margin: 0 auto;}
	.MYPAGE h3{font-size: 30px;}
	
	.list_tab{ overflow: hidden; margin-top: 20px; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9}
	.list_tab li{float: left; width:20%;height: 50px;line-height:50px; text-align: center; font-size: 20px;}
	
	.contentDiv{width:900px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.contentDiv > h3 {margin-top:20px ; margin-bottom:20px; font-size: 20px;}
	
	.list > ul {float: left; width:50%; height: auto; line-height:30px; border-bottom: 1px solid #d9d9d9;}
	.list > ul > li {float: left; font-size: 16px;}
	.subject {font-weight: bold;}
	.value { margin-left: 15px;}
	.modify {border: 1px solid #d9d9d9;}
	.btn {text-align: center; font-size: 16px;}
	.btn > input {width: 100px; height: 30px; margin-top: 20px; margin-bottom: 20px;}
</style>
</head>
<body>

<div class="topDiv" >
   	<%@ include file="../frame/header.jsp" %>
</div>

<!-- 마이페이지 부분 -->
<div class="page">
	<div class="MYPAGE" >
		<h3>마이페이지</h3>
		<div class="MYPAGE_wrap">
	    	<ul class="list_tab">
	        	<li class="on">
	            	<span class="txt_link">${logId}님</span>
				</li>
				<li class="on">
				   <a href="memberView.mem">
				      <span class="txt_link">내 정보 조회</span>
				   </a>
				</li>
				<li>
				   <a href="memberCheckPwForm.mem?ud=u">
				      <span class="txt_link">내 정보 수정</span>
				   </a>
				</li>
				<li>
				   <a href="memberChangePwForm.mem">
				      <span class="txt_link">비밀번호 변경</span>
				   </a>
				</li>
				<li>
				   <a href="memberCheckPwForm.mem?ud=d">
				      <span class="txt_link">회원 탈퇴</span>
				   </a>
				</li>
			</ul>
		</div>
	</div>

	<!-- 내 정보 수정 페이지 -->
	<div class="contentDiv">
		<h3>내 정보 수정</h3>
		<form action="memberInfoModifyPro.mem" method="post" name="frm">
			<div class="list">
				<ul>
					<li class="subject">
						<p>아이디</p>
					</li>
					<li class="value">
						<p>${dto.mId }</p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>이름</p>
					</li>
					<li class="value">
						<p>${dto.mKorName}</p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>영어이름(LastName / FirstName)</p>
					</li>
					<li class="value">
						<p>${dto.mLastName} / ${dto.mFirstName }</p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>생년월일</p>
					</li>
					<li class="value">
						<fmt:formatDate value="${dto.mBirth }" type="date" pattern="yyyy-MM-dd"/>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>성별</p>
					</li>
					<li class="value">
						<c:if test="${dto.mGender == 'M'}">남자</c:if>
						<c:if test="${dto.mGender == 'F'}">여자</c:if> 
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*비밀번호 확인</p>
					</li>
					<li class="value">
						<input class="modify" type="password" id="mPw" name ="mPw" />
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*여권번호</p>
					</li>
					<li class="value">
						<p><input type="text" class="modify" id ="passport" name ="mPassPortNum" value = "${dto.mPassPortNum }"/></p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*여권 만료일</p>
					</li>
					<li class="value">
						<p><input type="date" pattern="yyyy-MM-dd" class="modify" id ="passport" name ="mPassPortEnd" value = "${dto.mPassPortEnd }"/></p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*이메일</p>
					</li>
					<li class="value">
						<p><input type ="text" class="modify" id ="email" name ="mEmail" value = "${dto.mEmail }"/></p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*주소</p>
					</li>
					<li class="value">
						<p><input type ="text" class="modify" id ="addr" name ="mAddr"  value = "${dto.mAddr }"/></p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*전화번호1</p>
					</li>
					<li class="value">
						<p><input type ="text" class="modify" id ="memberPh1" name ="mPh1" value = "${dto.mPh1 }"/></p>
					</li>
				</ul>
				<ul>
					<li class="subject">
						<p>*전화번호2</p>
					</li>
					<li class="value">
						<p><input type ="text" class="modify" id ="memberPh2" name ="mPh2" value = "${dto.mPh2 }"/></p>
					</li>
				</ul>
			<div class="btn">
				<input type="submit" name="modify" id ="modify" value="수   정" >
				<input type="button" value="취  소" onclick = "javascript:history.back();" />
			</div>
		</div>
	</form>
	</div>
</div>
<div class="footDiv" style=" margin-top: 20px;">
	<%@ include file="../frame/footer.jsp" %>
</div>

</body>
</html>