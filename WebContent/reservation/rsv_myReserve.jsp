<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약 정보</title>
<style type="text/css">
	.qnaList {width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
	.qnaList h3 {font-size: 30px; text-align:center;}
	.qnaWrite {text-align:right;}
	.board1 {overflow: hidden; margin-top: 20px; margin-bottom: 20px;}
	.qnaPaging {text-align:center; margin-bottom: 20px;}
	
	.list_Top > li {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.list_Bottom > li {border-bottom: 1px solid #d9d9d9}
	.list > .list1 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2 {float: left; width:45%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2a {float: left; width:45%; height: 50px; line-height:50px; text-align:left;}
	.list > .list3 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list4 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list5 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
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
<div class="qnaList">
	<h3>내 예약 정보</h3>
	<div class="qnaWrite">
		<a href="qnaBoardWrite.qna">+</a>
	</div>
	<div class="board1">
	<c:if test="${!empty rfpList }">
		<ul class="list_Top list">
			<li class="list1">
				<p>예약 번호</p>
			</li>
			<li class="list2">
				<p>상품 명</p>
			</li>
			<li class="list3">
				<p>목적지</p>
			</li>
			<li class="list4">
				<p>여행 기간</p>
			</li>
			<li class="list5">
				<p>여약 상태</p>
			</li>
		</ul>
		<c:forEach items="${rfpList}" var="list" varStatus="cnt">
		<ul class="list_Bottom list">
			<li class="list1">
				${list.rsv.rvNum}
			</li>
			<li class="list2a">
				<a href="reservationDetail.rsv?rvNum=${list.rsv.rvNum}">
					${list.pkg.pName}
				</a>
			</li>
			<li class="list3">
				${list.pkg.pDestination}
			</li>
			<li class="list4">
				${list.pkg.pPeriod}
			</li>
			<li class="list5">
				${list.rsv.rvStatus}
			</li>
		</ul>
		</c:forEach>
	</c:if>
	<c:if test="${empty rfpList }">
		<ul class="list_Top list">
			<li class="list1">
				<p>번호</p>
			</li>
			<li class="list2">
				<p>제목</p>
			</li>
			<li class="list3">
				<p>작성자</p>
			</li>
			<li class="list4">
				<p>작성일</p>
			</li>
			<li class="list5">
				<p>조회수</p>
			</li>
		</ul>
	</c:if>
	</div>
</div>

<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>




</body>
</html>