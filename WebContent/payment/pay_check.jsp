<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 확인 페이지</title>
<style type="text/css">
	.qnaView{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaView > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	th {padding-top: 5px; padding-bottom: 5px;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<link rel="stylesheet" type="text/css" href="../css/frame.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>


<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>결제</h3>
	<div class="qnaBoard">
		<h2>결제 확인</h2>
		<table>
				<tr>
					<td class="subject"><label>결제 금액</label></td>
					<td class="value"> 
						${pay.payTotalPrice}
					</td>
				</tr>
				<c:if test="${pay.payMeans eq 'card'}">
					<tr>
						<td class="subject"><label>카드사</label></td>
						<td class="value"> 
							${cardCompany}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>카드 번호</label></td>
						<td class="value"> 
							${cardNum}
						</td>
					</tr>	
					<tr>
						<td class="subject"><label>카드 유효기간</label></td>
						<td class="value"> 
							${cardValidity}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>카드 CVC</label></td>
						<td class="value"> 
							${cardCVC}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>결제 상태</label></td>
						<td class="value"> 
							O
						</td>
					</tr>					
				</c:if>
				<c:if test="${pay.payMeans eq 'virtual'}">
					<tr>
						<td class="subject"><label>결제 상태</label></td>
						<td class="value"> 
							O
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'phone'}">
					<tr>
						<td class="subject"><label>통신사</label></td>
						<td class="value"> 
	 						${telleCompany}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>핸드폰 번호</label></td>
						<td class="value"> 
	 						${PhoneNum}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>명의자 이름</label></td>
						<td class="value"> 
	 						${phoneOwner}
						</td>
					</tr>
					<tr>
						<td class="subject"><label>결제 상태</label></td>
						<td class="value"> 
							O
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'kakaoPay'}">
					<tr>
						<td class="subject"><label>결제 상태</label></td>
						<td class="value"> 
							O
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'toss'}">
					<tr>
						<td class="subject"><label>결제 상태</label></td>
						<td class="value"> 
							O
						</td>
					</tr>
				</c:if>
			</table>
	</div>
</div>
<!-- foot부분 -->
	<%@ include file="../frame/footer.jsp" %>





</body>
</html>