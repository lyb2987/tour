<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.review{width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
	.review h3{font-size: 30px;}
	.reviewWrite{text-align:right;}
	.board1 {overflow: hidden; margin-top: 20px; margin-bottom: 20px;}
	.reviewPaging{text-align:center; margin-bottom: 20px;}
	
	
	.list_Top > li {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.list_Bottom > li {border-bottom: 1px solid #d9d9d9}
	.list > .list1 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2a {float: left; width:15%; height: 50px; line-height:50px; text-align:left;}
	.list > .list3 {float: left; width:30%; height: 50px; line-height:50px; text-align:center;}
	.list > .list3a {float: left; width:30%; height: 50px; line-height:50px; text-align:left;}
	.list > .list4 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list5 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list6 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list7 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
</style>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="review" align="center">
	<h3>후기 게시판</h3>
	<div class="reviewWrite">
		<a href="reviewBoardWrite.rv">+</a>
	</div>
	<div class="board1">
	<c:if test="${!empty list }">
		<ul class="list_Top list">
			<li class="list1">
				<p>번호</p>
			</li>
			<li class="list2">
				<p>페키지명</p>
			</li>
			<li class="list3">
				<p>후기 제목</p>
			</li>
			<li class="list4">
				<p>별점</p>
			</li>
			<li class="list5">
				<p>작성자</p>
			</li>
			<li class="list6">
				<p>작성일</p>
			</li>
			<li class="list7">
				<p>조회수</p>
			</li>
		</ul>
		<c:forEach items="${list }" var="dto" varStatus="cnt">
		<ul class="list_Bottom list">
			<li class="list1">
				<p>${cnt.count }</p>
			</li>
			<li class="list2a">
				<p>${dto.reviewPkgName }</p>
			</li>
			<li class="list3a">
				&nbsp;▶
				<a href="reviewBoardView.rv?num=${dto.reviewNum }">
					${dto.reviewSubject }
				</a>
			</li>
			<li class="list4">
				<p>${dto.reviewScore }</p>
			</li>
			<li class="list5">
				<P>${dto.reviewName }</P>
			</li>
			<li class="list6">
				<p>${dto.reviewDate }</p>
			</li>
			<li class="list7">
				<p>${dto.readCount }</p>
			</li>
		</ul>
		</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<ul class="list_Top list">
			<li class="list1">
				<p>번호</p>
			</li>
			<li class="list2">
				<p>페키지명</p>
			</li>
			<li class="list3">
				<p>후기 제목</p>
			</li>
			<li class="list4">
				<p>별점</p>
			</li>
			<li class="list5">
				<p>작성자</p>
			</li>
			<li class="list6">
				<p>작성일</p>
			</li>
			<li class="list7">
				<p>조회수</p>
			</li>
		</ul>
		<ul>
			<li>등록된 후기가 없습니다.</li>
		</ul>
		</c:if>
	</div>
	<br>
	<div class="reviewPaging" align="center">
		<%@ include file="/include/includePage.jsp" %>
	</div>
</div>

<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>

	
</body>
</html>