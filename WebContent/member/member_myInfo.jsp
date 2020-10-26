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
   
	.contentDiv{width:900px; margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.contentDiv > h3 {margin-top:20px ; margin-bottom:20px; font-size: 20px;}
	
	.list > ul {float: left; width:50%; height: auto; line-height:30px; border-bottom: 1px solid #d9d9d9;}
	.list > ul > li {float: left; font-size: 16px;}
	.subject {font-weight: bold;}
	.value { margin-left: 15px;}
	.btn {text-align: center; font-size: 16px;}
	.btn > input {width: 100px; height: 30px; margin-top: 20px; margin-bottom: 20px;}

</style>
<script type="text/javascript">
	function modify(){
		var chk = confirm("회원 정보를 수정하시겠습니까?");
		if(chk == false){
			return false;
		}
		else{
			location.href="memberCheckPwForm.mem?ud=u";
		}
	}
	function couponProvision(){
	      var chk = confirm("쿠폰을 지급하시겠습니까?");
	      if(chk == false){
	         return false;
	      }
	      else{
	         location.href="memberCpProvision.mem?mId=${dto.mId}";
	      }
	   }

</script>
</head>
<body>

   	<%@ include file="../frame/header.jsp" %>

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
	
	<!-- 내 정보페이지 -->
	<div class="contentDiv">
		<h3>내 정보 조회</h3>
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
					<p>가입일</p>
				</li>
				<li class="value">
					<fmt:formatDate value="${dto.mRegister }" type="date" pattern="yyyy-MM-dd"/>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>여권번호</p>
				</li>
				<li class="value">
					<p>${dto.mPassPortNum }</p>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>여권만료일</p>
				</li>
				<li class="value">
					<fmt:formatDate value="${dto.mPassPortEnd }" type="date" pattern="yyyy-MM-dd"/>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>이메일</p>
				</li>
				<li class="value">
					<p>${dto.mEmail }</p>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>주소</p>
				</li>
				<li class="value">
					<p>${dto.mAddr }</p>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>전화번호1</p>
				</li>
				<li class="value">
					<p>${dto.mPh1 }</p>
				</li>
			</ul>
			<ul>
				<li class="subject">
					<p>전화번호2</p>
				</li>
				<li class="value">
					<p>${dto.mPh2 }</p>
				</li>
			</ul>
		</div>
		<div class="btn">
			<c:if test="${logId eq 'admin'}">
            <input type="button" name="couponProvision" id ="couponProvision" onclick="couponProvision();" value="쿠폰 지급" >
        	</c:if>
			<input type="button" name="modify" id ="modify" onclick="modify();" value="회원 정보 수정" >
			<input type="button" value="나가기" onclick = "javascript:history.back();" />
		</div>
	</div>
</div>

	<%@ include file="../frame/footer.jsp" %>

</body>
</html>