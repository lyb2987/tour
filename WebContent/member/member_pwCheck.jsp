<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
   .pwFind {width:1200px; margin: 0 auto; text-align: center;}
   .pwFindTop {margin-top :150px; margin-bottom: 150px;}
   .pwFindTop > h2 {font-size: 20px;}
   fieldset {width:500px; height:auto; margin: 0 auto;}
   fieldset > h3 {margin-top: 3px; }
</style>
</head>
<body>


<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>


<!-- 변동부분 -->
	<div class="pwFind">
		<div class="pwFindTop">
			<h2>비밀번호 찾기</h2>
			<div class="pw_check">
				<form action="#" name="pwPh_Check" method="post">
					<input type="hidden" name="mId" value="mId">
					<fieldset>
					<h3>비밀번호 찾기</h3>
					<c:if test="${empty mId }">
						<h5>회원가입시 사용한 비밀번호는 <strong>${mPw }</strong>입니다.</h5>
					</c:if>
					<c:if test="${!empty mId }">
						<h5>가입된 아이디가 없습니다.</h5>
					</c:if>
						<button type="button" onclick = "javascript:location.href='../member/member_login.jsp';">로그인 화면으로 돌아가기</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>