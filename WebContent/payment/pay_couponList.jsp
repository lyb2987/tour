<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul{list-style: none;}
	.list_Top > li {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.list_Bottom > li {border-bottom: 1px solid #d9d9d9}
	.list > .list1 {float: left; width:10%; height: 50px; line-height:50px; text-align:center;}
	.list > .list2 {float: left; width:60%; height: 50px; line-height:50px; text-align:center;}
	.list > .list3 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
	.list > .list4 {float: left; width:15%; height: 50px; line-height:50px; text-align:center;}
</style>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	
	
	$("#btn").click(function(){
		var selected = $('input[name=coupon]:checked').val();
		var sp = selected.split('/');
		var cNum = sp[0];
		var cDcPrice = sp[1];
		var cName = sp[2];
		
		var rvTotalPrice = ${rfplist[0].rsv.rvTotalPrice};
		var dcPrice = (rvTotalPrice / 100) * cDcPrice;
		var totalPrice = rvTotalPrice - dcPrice;
		
		$(opener.document).find("#dcPrice").html("");
		$(opener.document).find("#dcPrice").html(dcPrice);
		$(opener.document).find("#totalPrice").html("");
		$(opener.document).find("#totalPrice").html(totalPrice);
		$(opener.document).find("#htotalPrice").html(totalPrice);
		$(opener.document).find("#cNum").val(cNum);
		$(opener.document).find("#couponP").html("");
		$(opener.document).find("#couponP").html(cName);
		$(opener.document).find("#hdcPrice").val(dcPrice);
		window.close();
		
	});	
});
</script>
</head>
<body>
<div align="center">
	<h4> 쿠폰 선택 </h4> 
	<ul class="list_Top list">
		<li class="list1">
			<p>쿠폰 번호</p>
		</li>
		<li class="list2">
			<p>쿠폰 이름</p>
		</li>
		<li class="list3">
			<p>할인율</p>
		</li>
		<li class="list4">
			<p>선택</p>
		</li>
	</ul>
	<c:forEach items="${clist}" var="dto">
		<ul class="list_Bottom list">
				<li class="list1">
					${dto.cNum}
				</li>
				<li class="list2">
					${dto.cName}
				</li>
				<li class="list3">
					${dto.cDcPrice }%
				</li>
				<li class="list4">
					<input type="radio" name="coupon" id="coupon" value="${dto.cNum}/${dto.cDcPrice}/${dto.cName}">
				</li>
			</ul>
	</c:forEach>
 	<input type="button" value="적용"  id = "btn"/>
</div>
</body>
</html>