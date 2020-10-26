<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.idSearch {width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
</style>
</head>
<body>


	<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>

	
	<!-- 변동부분 -->
	<div class="idSearch" align="center">
		<div class="idSearchTop">
			<h2>ID찾기</h2>
			가입시 입력한 이메일 또는 핸드폰 번호를 통해서<br/>
			아이디를 찾을 수 있습니다.
		</div>
		<form action="idEmailCheck.mem" name="idEmail_frm" method="post" style="width:500px">
			<input type="hidden" name="" value="">
			<fieldset>
			<legend><h3>이메일로 찾기</h3></legend>
				<p>
					<label>이름 : </label>
					<input type="text" name="mKorName" id="mKorName">
				</p>
				<p>
					<label>이메일 : </label>
					<input type="text" name="email" id="email" style="width:100px">
					@
					<select name="emailChoice">
						<option value="선택">선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</p>
				<button type="submit">아이디 찾기</button>
				<button type="reset">취소</button>
			</fieldset>		
		</form>
	</div>
	
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>