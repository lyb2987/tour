<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style type="text/css">
	.qnaList {width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
	.qnaList h3 {font-size: 30px; text-align:center;}
	.qnaWrite {text-align:right;}
	.board1 {overflow: hidden; margin-top: 20px; margin-bottom: 20px;}
	.qnaPaging {text-align:center;}
	
	.list_Top > li {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.list_Bottom > li {border-bottom: 1px solid #d9d9d9}
	.list > .list1 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2 {float: left; width:45%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2a {float: left; width:45%; height: 50px; line-height:50px; text-align:left;}
	.list > .list3 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list4 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list5 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
</style>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>
	
<!-- 변동부분 -->
	<div class="qnaList">
		<h3>회원 리스트</h3>
		<div class="qnaWrite">
			<a href="qnaBoardWrite.qna">+</a>
		</div>
		<div class="board1">
		<c:if test="${!empty list }">
			<ul class="list_Top list">
				<li class="list1">
					<p>번호</p>
				</li>
				<li class="list2">
					<p>회원 아이디</p>
				</li>
				<li class="list3">
					<p>한글 이름</p>
				</li>
				<li class="list4">
					<p>영어 이름</p>
				</li>
				<li class="list5">
					<p>가입일</p>
				</li>
			</ul>
			<c:forEach items="${list }" var="dto" varStatus="cnt">
			<ul class="list_Bottom list">
				<li class="list1">
					${cnt.count }
				</li>
				<li class="list2a">
					&nbsp;
					<a href="memberView.mem?mId=${dto.mId}">
						${dto.mId}
					</a>
				</li>
				<li class="list3">
					${dto.mKorName}
				</li>
				<li class="list4">
					${dto.mLastName} / ${dto.mFirstName}
				</li>
				<li class="list5">
					${dto.mRegister}
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
		<div class="qnaPaging">
			<%@ include file="/include/includePage.jsp" %>
		</div>
	</div>
<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>

</body>
</html>