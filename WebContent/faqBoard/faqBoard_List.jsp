<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
   .FAQ {width: 1200px; margin-top :60px; margin-bottom :60px; margin: 0 auto;}
   .FAQ h3 {font-size: 30px; text-align:center;}
   .faqWrite {text-align:right;}
   .FAQ_wrap{overflow: hidden; margin-top: 20px; margin-bottom: 20px; font-size: 20px;}
   .faqPaging {text-align:center; margin-bottom: 20px;}
   
	.list_tab > li {overflow: hidden; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9}
	.list_tab > li {float: left; width:25%; height: 50px; line-height:50px; text-align:center;}
	.list_faq > li {height: auto; border-bottom: 1px solid #d9d9d9;}
	
	.content{overflow: hidden; width: 1000px; margin: 0 auto;}
	.content span.content1{width:1000px;height:auto; margin: 0 auto; font-size:18px; font-weight: bold;}
	.content span.content2{height:auto; margin: 0 auto; font-size:14px;}
   /* .content1 {width :1000px; font-weight: bold; font-size: 16px;} */
   
</style>
</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>


<!-- 변동부분 -->
<div class="FAQ">
	<h3>자주묻는 질문</h3>
	<c:if test="${logId eq 'admin'}">
		<div class="faqWrite">
			<a href="faqBoardWrite.faq">+</a>
		</div>
	</c:if>
	<div class="FAQ_wrap">
		<ul id="categorySelect" class="list_tab">
			<li class="on">
				<a href="faqBoardList.faq">
					<span class="txt_link">ALL FAQ</span>
				</a>
			</li>
			<li class="on">
				<a href="faqPackageList.faq?FaqCategory=package">
					<span class="txt_link">패키지 FAQ</span>
				</a>
			</li>
			<li>
				<a href="faqCommonList.faq?FaqCategory=common">
					<span class="txt_link">일반 FAQ</span>
				</a>
			</li>
			<li>
				<a href="faqPaymentList.faq?FaqCategory=payment">
					<span class="txt_link">예약/결제 FAQ</span>
				</a>  
			</li>
		</ul>
		<c:forEach items="${list}" var="dto" varStatus="cnt">
		<ul class="list_faq">
			<li>
				<div class="content">
					<span class="content1">Q.</span>
					<span class="content1">${fn:replace(dto.faqContent,cn, br) }</span><br>
					<span class="content2">${fn:replace(dto.faqAnswer,cn, br) }</span>
				</div>
			</li>
		</ul>
		</c:forEach>
	</div>
	<div class="faqPaging" align="center">
		<%@ include file="/include/includePage.jsp" %>
	</div>
</div>
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>

</body>
</html>