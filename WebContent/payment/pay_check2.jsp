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
				<th colspan="2">
					예약 정보 및 결제 정보
				</th>
			</tr>
			<tr>
				<td class="subject"><label>예약 번호</label></td>
				<td class="value"> 
					${rfplist[0].rsv.rvNum}
				</td>
			</tr>
			<tr>
				<td class="subject"><label>예약 상태</label></td>
				<td class="value"> 
					${rfplist[0].rsv.rvStatus}
				</td>
			</tr>
			<tr>
				<td class="subject"><label>결제 금액</label></td>
				<td class="value"> 
					${pay.payTotalPrice}
				</td>
			</tr>
			<tr>
				<td class="subject"><label>결제 수단</label></td>
				<td class="value"> 
					<c:if test="${pay.payMeans eq 'card'}">
						카드
					</c:if>
					<c:if test="${pay.payMeans eq 'virtual'}">
						무통장 입금
					</c:if>
					<c:if test="${pay.payMeans eq 'phone'}">
						핸드폰
					</c:if>
					<c:if test="${pay.payMeans eq 'kakaoPay'}">
						카카오페이
					</c:if>
					<c:if test="${pay.payMeans eq 'toss'}">
						토스
					</c:if>
				</td>
			</tr>
				<tr>
					<td class="subject"><label>결제 상태</label></td>
					<td class="value"> 
						O
					</td>
				</tr>					
		</table>
	</div>
</div>
<br />
<!-- foot부분 -->
	<%@ include file="../frame/footer.jsp" %>





</body>
</html>