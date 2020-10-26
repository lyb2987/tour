<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.qnaWrite{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaWrite > h3 {font-size: 30px; text-align:center;}
	
	.Write > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table{width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { height: 40px; font-size: 14px;}
	.value > input {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value > textarea {margin-left: 15px; border: 1px solid #d9d9d9;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>
	
<!-- 변동부분 -->
	<div class="qnaWrite">
		<h3>
			<a href="qnaBoardList.qna">자유 게시판</a>
		</h3>
		<div class="Write">
			<h2>게시물 작성</h2>
			<form action="qnaBoardWritePro.qna" method="post" name="frm">
				<table >
					<tr>
						<td class="subject">
							<div align="center">작성자</div>
						</td>
						<td class="value">
							<input name="qnaName" type="text" maxlength="10" value=""/>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center">비밀번호</div>
						</td>
						<td class="value">
							<input name="qnaPass" type="password" maxlength="10" 
								value=""/>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center">제 목</div>
						</td>
						<td class="value">
							<input name="qnaSubject" type="text" maxlength="100" value=""/>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center">내 용</div>
						</td>
						<td class="value">
							<textarea name="qnaContent" cols="67" rows="15"></textarea>
						</td>
					</tr>
					</table>
				<div class="btn">
					<a href="javascript:frm.submit();">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</div>
			</form>
		</div>
	</div>
	
<!-- foot부분 -->
		<%@ include file="../frame/footer.jsp" %>

</body>
</html>