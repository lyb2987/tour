<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 목록</title>
<style type="text/css">
   	.pkgList{width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
	.pkgList h3{font-size: 30px;}
	.pkgWrite{text-align:right;}
	
	.list_Count >li {float: right;}
	.list_Top {overflow: hidden;margin-top: 20px;border-top: 1px solid #d9d9d9;border-bottom: 1px solid #d9d9d9}
	.list_Top >li {float: left; width:20%; height: 50px; line-height:50px; text-align:center;}
	.list_Bottom {overflow: hidden; border-bottom: 1px solid #d9d9d9}
	.list_Bottom > li {float: left; width:20%; height: 50px; line-height:50px; text-align:center;}
	
	.list > .list1 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2 {float: left; width:20%; height: 50px; line-height:50px; text-align:center;}
	.list > .list3 {float: left; width:40%; height: 50px; line-height:50px; text-align:center;}
	.list > .list3a {float: left; width:40%; height: 50px; line-height:50px; text-align:left;}
	.list > .list4 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list5 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.pkgPaging {text-align:center; margin-top :15px; margin-bottom: 20px;}
</style>

</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="pkgList"  align="center">
	<h3> 패키지 상품 목록 </h3>
		<div class="pkgWrite">
			<a href="pkgWriteForm.pkg">+</a>
		</div>
		<div class="centerDiv">
			<c:if test="${!empty list }">
				<ul class="list_Top list">
					<li class="list1">
						<p>번호</p>
					</li>
					<li class="list2">
						<p>여행지</p>
					</li>
					<li class="list3">
						<p>패키지명</p>
					</li>
					<li class="list4">
						<p>여행기간</p>
					</li>
					<li class="list5">
						<p>현재인원 / 최대인원</p>
					</li>
				</ul>
			<c:forEach items="${list }" var="dto" varStatus="cnt">
			<ul class="list_Bottom list">
				<li class="list1">
					${dto.pNum}
				</li>
				<li class="list2">
					${dto.pDestination }
				</li>
				<li class="list3a">
					<a href="pkgDetail.pkg?pNum=${dto.pNum}">
						${dto.pName}
					</a>
				</li>
				<li class="list4">
					${dto.pPeriod}
				</li>
				<li class="list5">
					${dto.pCP} / ${dto.pMP}
				</li>
			</ul>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<ul class="list_Top">
					<li class="list1">
						<p>번호</p>
					</li>
					<li class="list2">
						<p>여행지</p>
					</li>
					<li class="list3">
						<p>패키지명</p>
					</li>
					<li class="list4">
						<p>여행기간</p>
					</li>
					<li class="list5">
						<p>현재인원 / 최대인원</p>
					</li>
				</ul>
		</c:if>
		<c:if test="${logId eq 'admin'}">
		</c:if>
		<div class="pkgPaging">
			<%@ include file="/include/includePage.jsp" %>
		</div>
	</div>
</div>

<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>
</body>
</html>