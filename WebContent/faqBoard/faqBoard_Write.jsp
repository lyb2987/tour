<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .faqWrite{width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
   .faqWrite > h3 {font-size: 30px; text-align:center;}
	
	.Write > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table{width:600px; height: auto; margin: 0 auto; }
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { height: 40px; font-size: 14px;}
	.value > textarea {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value > select {margin-left: 15px; border: 1px solid #d9d9d9;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>
	
<!-- 변동부분 -->
	<div class="faqWrite">
		<h3>
			<a href="faqBoardList.faq">FAQ 게시판</a>
		</h3>
		<div class="Write">
			<h2>FAQ 작성</h2>
			<form action="faqBoardWritePro.faq" method="post" name="frm">
				<table >
					<tr>
						<td class="subject">
							<div align="center">카테고리</div>
						</td>
						<td class="value">
							<select name="faqCategory">
								<option value="선택">선택하세요</option>
								<option value="package">패키지FAQ</option>
								<option value="common">일반FAQ</option>
								<option value="payment">예매/결제FAQ</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center">질문 내용</div>
						</td>
						<td class="value">
							<textarea name="faqContent" cols="67" rows="15"></textarea>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center">질문 답변</div>
						</td>
						<td class="value">
							<textarea name="faqAnswer" cols="67" rows="15"></textarea>
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