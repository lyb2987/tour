<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.idSearch {width:1200px; margin: 0 auto; text-align: center;}
	.idSearchTop {margin-top :150px; margin-bottom: 150px; font-size: 13px;}
	.idSearchTop > h2 {font-size: 20px;}
	fieldset {width:500px; height:auto; margin: 0 auto;}
	fieldset > h3 {margin-top: 3px; }
	.phNum {width:60px; border: 1px solid #d9d9d9;}
	.name { border: 1px solid #d9d9d9;}
	p {margin-top: 5px; margin-bottom: 5px;}
	.btn {width: 70px; height: 20px;}
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
			<br/>
				<div class="phInfo">
					<form action="idPhCheck.mem" name="idPh_frm" method="post">
						<input type="hidden" name="" value="">
						<fieldset>
						<h3>휴대폰으로 ID 찾기</h3>
							<p>
								<label>이름 : </label>
								<input type="text" name="mKorName" id="mKorName" class="name">
							</p>
							<p>
								<label>휴대폰 번호 : </label>
								<select name="firstPhNum">
									<option value="선택">선택하세요</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
								</select>
								 - 
								<input type="text" name="middlePhNum" id="middlePhNum" class="phNum" >
								 - 
								<input type="text" name="lastPhNum" id="lastPhNum" class="phNum">
							</p>
							<input type="submit" value="아이디 찾기" class = "btn">
							<input type="reset" value="취소" class = "btn">
						</fieldset>
					</form>
				</div>
		</div>
	</div>
	
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>