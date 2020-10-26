<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
   .pwFind{width:1200px; margin: 0 auto; text-align: center;}
	.pwFindTop {margin-top:150px; margin-bottom: 150px; font-size: 13px;}
	.pwFindTop > h2 {font-size: 20px;}
	fieldset {width:500px; height:auto; margin: 0 auto;}
	fieldset > h3 {margin-top: 3px; }
	.phNum {width:60px; border: 1px solid #d9d9d9;}
	.pw { border: 1px solid #d9d9d9;}
	p {margin-top: 5px; margin-bottom: 5px;}
</style>
</head>
<body>


<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>

	
<!-- 변동부분 -->
	<div class="pwFind">
		<div class="pwFindTop">
			<h2>PW찾기</h2>
			아이디와 핸드폰번호를 통해서<br/>
			비밀번호를 찾을 수 있습니다.<br/>
			<div class="pwInfo">
				<form action="pwFindPro.mem" name="idPh_frm" method="post">
					<fieldset>
					<h3>비밀번호 찾기</h3>
						<p>
							<label>이름 : </label>
							<input type="text" name="mKorName" id="mKorName" class="pw">
						</p>
						<p>
							<label>아이디 : </label>
							<input type="text" name="mId" id="mId" class="pw">
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
							<input type="text" name="middlePhNum" id="middlePhNum" class="phNum">
							 - 
							<input type="text" name="lastPhNum" id="lastPhNum" class="phNum">
						</p>
						<button type="submit" class = "btn">비밀번호 찾기</button>
						<button type="reset" class = "btn">취소</button>
					</fieldset>
				</form>
			</div>
		</div>
	<br/>
	</div>
	
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>