<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.idFind {width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
</style>
</head>
<body>


<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>

	
<!-- 변동부분 -->
	<div class="idFind" align="center">
		<div class="idFindTop">
			<h2>아이디 찾기</h2>
		</div>
		<div class="id_check">
			<form action="#" name="idPh_Check" method="post" style="width:500px">
				<fieldset>
				<h3>아이디 찾기</h3>
				<c:if test="${!empty mId }">
					<h5>회원가입시 사용한 아이디는 <strong>${mId }</strong>입니다.</h5>
					<button type="button" onclick = "javascript:location.href='../member/member_pwFind.jsp';">비밀번호 찾으로 가기</button>
					<button type="button" onclick = "javascript:location.href='../member/member_login.jsp';">로그인 화면으로 돌아가기</button>
				</c:if>
				<c:if test="${empty mId }">
					<h5>가입된 아이디가 없습니다.</h5>
					<button type="button" onclick = "javascript:location.href='../member/member_login.jsp';">로그인 화면으로 돌아가기</button>
				</c:if>
				</fieldset>
			</form>
		</div>
	</div>
	
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>