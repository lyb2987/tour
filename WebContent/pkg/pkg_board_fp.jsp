<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 인원수</title>
<style type="text/css">
   .contentDiv{width: 1200px; margin-top :60px; margin: 0 auto;}
    .contentDiv > h3 {font-size: 30px; text-align:center;}
    
    .centerDiv > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
    
    .personNum {margin-top :20px; margin-bottom: 20px; font-size: 16px; text-align:center;}
    .personNum > input {margin-top:10px; background: none; font-size: 16px;}
    .price {margin-top :20px; margin-bottom: 20px; font-size: 16px; text-align:center;}
    .price > p {font-weight: bold;}
    
    .btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	
	function personNumUp(num){
		if(num >= 4){
			alert("한팀의 최대 인원은 4명입니다.");
			return false;
		}
		location.href="packagePersonNumUp.pkg?personNum="+num+"&pNum=${dto.pNum}";
	}
	
	function personNumDown(num){
		if(num <= 1){
			alert("인원수는 1보다 작을수 없습니다.");
			return false;
		}
		location.href="packagePersonNumDown.pkg?personNum="+num+"&pNum=${dto.pNum}";
	}
	
	$(function(){
		
	});
</script>
</head>
<body>

<c:if test="${personNumber eq null}">
	<c:set var="personNum" value="1" ></c:set>
</c:if>
<c:if test="${personNumber ne null}">
	<c:set var="personNum" value="${personNumber}" ></c:set>
</c:if>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="contentDiv">
	<h3>예약</h3>
	<div class="centerDiv">
		<h2> 예약 : 2. 인원 수  </h2>
		<form action="../rsv/reservationForm.rsv" method="post" name="frm">
			<div class="personNum">
				<p>인원수</p>
				<input type="button" value="-" onclick="personNumDown(${personNum});">&nbsp; ${personNum} &nbsp; 
				<input type="button" value="+" onclick="personNumUp(${personNum});">
			</div>
			<div class="price">
				금액
				<p><fmt:formatNumber value="${totalPrice}" type="currency"/></p>
				<input type="hidden" value="${dto.pNum}" name="pNum">
				<input type="hidden" value="${personNum}" name="personNum">
				<input type="hidden" value="${totalPrice}" name="totalPrice">
			</div>
			<div class="btn">
				<input type="submit" value="다음">
			</div>
		</form>
	</div>
</div>

<br />
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>





</body>
</html>