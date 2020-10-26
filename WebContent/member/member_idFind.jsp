<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.idFind {width:1200px;  margin: 0 auto; text-align: center;}
	.idFindTop {margin-top:150px; margin-bottom: 150px;}
	.idFindTop > h2 {font-size: 20px;}
	fieldset {width:500px; height:auto; margin: 0 auto;}
	fieldset > h3 {margin-top: 3px; }
</style>
</head>
<body>


	<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>

	
	<!-- 변동부분 -->
	<div class="idFind">
		<div class="idFindTop">
			<h2>ID찾기</h2>
			가입시 입력한 이메일 또는 핸드폰 번호를 통해서<br/>
			아이디를 찾을 수 있습니다.<br/>
			<div class="phInfo">
				<form action="idPhFind.mem" name="idPh_frm" method="post">
					<fieldset>
					<h3>휴대폰번호로 ID 찾기</h3>
						<p>
							휴대폰번호로 아이디를 찾으려면 여기를 눌러주세요.
						</p>
						<button type="submit">아이디 찾기</button>
					</fieldset>
				</form>
			</div>
		<br/>
			<div class="eMailInfo">
				<form action="idEmailFind.mem" name="idEmail_frm" method="post">
					<fieldset>
					<h3>이메일로 ID 찾기</h3>
						<p>
							이메일로 아이디를 찾으려면 여기를 눌러주세요.
						</p>
						<button type="submit">아이디 찾기</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
<!-- foot부분 -->
	
		<%@ include file="../frame/footer.jsp" %>

</body>
</html>