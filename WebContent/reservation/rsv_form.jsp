<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인 및 동승자 정보 입력</title>
<style type="text/css">
   	.qnaView{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaView > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>예약</h3>
	<div class="qnaBoard">
		<h2>동승자 정보 입력</h2>
		<form action="reservationPro.rsv" method="post" name="frm">
			<table >
				<tr>
					<td class="subject"><label>예약자 아이디</label></td>
					<td class="value"> ${mem.mId} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 이름</label></td>
					<td class="value"> ${mem.mKorName} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 여권번호</label></td>
					<td class="value"> ${mem.mPassPortNum} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 영문 이름</label></td>
					<td class="value"> ${mem.mFirstName} / ${mem.mLastName} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 연락처</label></td>
					<td class="value"> ${mem.mPh1} </td>
				</tr>
				<c:forEach begin="2" end="${personNum}" var="cnt">
					<tr>
						<td class="subject"><label>동승자${cnt -1} 여권번호</label></td>
						<td class="value"><input type ='text' name='fpPassportNum${cnt -1}' id='fpPassportNum${cnt -1}'/> </td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt -1} 이름</label></td>
						<td class="value"><input type ='text' name='fpKorName${cnt -1}' id='fpKorName${cnt -1}'/></td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt -1} 영문 이름</label></td>
						<td class="value"><input type ='text' name='fpEngName${cnt -1}' id='fpEngName${cnt -1}'/></td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt -1} 연락처</label></td>
						<td class="value"><input type ='text' name='fpPh1${cnt -1}' id='fpPh1${cnt -1}'/></td>
					</tr>
				</c:forEach>
				<tr>
					<td class="subject"><label for='pName'>패키지 명</label></td>
					<td class="value">${pkg.pName}</td>
				</tr>
				<tr>
					<td class="subject"><label for='pDestination'>여행지</label></td>
					<td class="value"> ${pkg.pDestination}</td>
				</tr>
				<tr>
					<td class="subject"><label for='pPeriod'>여행 날짜</label></td>
					<td class="value">  ${pkg.pPeriod} </td>
				</tr>
				<tr>
					<td class="subject"><label for='pFlight'>항공편</label></td>
					<td class="value"> ${pkg.pFlight}</td>
				</tr>
			 	<tr>
					<td class="subject"><label for='pPrice'>총 금액</label></td>
					<td class="value"> ${totalPrice}</td>
				</tr>
			</table>
			
			<input type="hidden" name="mId" value="${mem.mId}"/>
			<input type="hidden" name="personNum" value="${personNum}"/>
			<input type="hidden" name="pNum" value="${pkg.pNum}"/>
			<input type="hidden" name="pPrice" value="${pkg.pPrice}"/>
			<input type="hidden" name="totalPrice" value="${totalPrice}"/>
			
			<div class="btn">
				<input type='submit' value='예약 확인' />&nbsp;&nbsp;
			</div>
		</form>
	</div>
</div>
	
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>



</body>
</html>