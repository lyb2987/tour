<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 조회</title>
<style type="text/css">
   .contentDiv{width: 1200px; margin-top :60px; margin: 0 auto;}
   .contentDiv > h3 {font-size: 30px; text-align:center;}
   .centerDiv > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
   
   table{width:500px; height: auto; margin: 0 auto;}
	
	.list1 > img { width: 500px; height: 350px;}
	.table1 {width:500px; height: 350px; margin: 0 auto; border-top: none; border-bottom: none;}
	.list1 {height:50%; padding-left: 30px; font-size: 30px;}
	.list2 {height:5% ; text-align: right;}
	.list2 > p {font-size: 18px;}
	.list2 > span {font-size: 25px; font-weight: bold;}
	.list3 {height:5% ; padding-left: 30px; }
	.list4 {height:15%; text-align:center;}
	.item {width: 100px; height: 100px; color: #d9d9d9; margin-left:5px; margin-right:5px; font-size: 20px;}
	
	.content{width:800px; height: auto; border: 1px solid #d9d9d9; margin: 0 auto;}
	.content > p {width:600px; padding-top: 20px; padding-bottom: 20px; margin: 0 auto; font-size: 18px;}
	.table2 {width:600px; margin-top: 20px; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 14px;}
	.value {font-size: 14px; text-align: left;}
	.btn1 {width:800px; padding-top: 10px; padding-bottom: 10px; margin: 0 auto; text-align: center;}
	.btn1 > input {width:60px; height:30px; font-size: 16px;}
	.btn2 {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript">

	function modifyPackage(){
		var chk = confirm("패키지를 수정하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			location.href="packageModify.pkg?pNum=${dto.pNum}";
	}
	
	function deletePackage(){
		var chk = confirm("패키지를 삭제하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			location.href="packageDelete.pkg?pNum=${dto.pNum}";
	}
	
	function rsv(){
		location.href="packgeAgree.pkg?pNum=${dto.pNum}";
	}
</script>


</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="contentDiv" >
	<div class="centerDiv" >
		<table>
			<tr>
				<td class="list1">
			    	<img src="../pkg/upload/${dto.pImages }" />
			    </td>
				<td >
					<table class="table1">
						<tr>
							<td class="list1">
								${dto.pName}
							</td>
						</tr>
						<tr>
							<td class="list2">
								<p>성인 1인</p>
								<span>
									<fmt:formatNumber value="${dto.pPrice}" pattern="#,###" />원
								</span>
							</td>
						</tr>
						<tr>
							<td class="list3">
								<hr/>
							</td>
						</tr>
						<tr>
							<td class="list4">
								<span class="item">출발예정</span>
								<span class="item">항공예정</span>
								<span class="item">일정예정</span>
								<span class="item">호텔예정</span>
								<span class="item">가격예정</span>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<hr/>
		<h2>여행 세부사항</h2>
		<div class="content">
			<table class="table2">
				<tr>
					<td class="subject">
						항공편
					</td>
					<td class="value">
						${dto.pFlight }
					</td>
				</tr>
				<tr>
					<td class="subject">
						일정
					</td>
					<td class="value">
						${dto.pPeriod }
					</td>
				</tr>
				<tr>
					<td class="subject">
						여행도시
					</td>
					<td class="value">
						${dto.pDestination }
					</td>
				</tr>
				<tr>
					<td class="subject">
						예약 현황
					</td>
					<td class="value">
						${dto.pCP} / ${dto.pMP}
					</td>
				</tr>
			</table>
			<p>
				${fn:replace(dto.pContent,cn,br)}
			</p>
			
			<p>	
				<!-- 약관사항 -->
				<%@ include file="../agree/pkgAgree.jsp" %>
			</p>
		</div>
		<div class="btn1">
			<input type="button" value="예매" onclick="rsv();">
		</div>
		<div class="btn2">
			<c:if test="${logId eq 'admin' }">
				<button onclick="modifyPackage();">패키지 수정</button>  &nbsp;&nbsp;&nbsp; <button onclick="deletePackage();">패키지 삭제</button>
			</c:if>
		</div>
	</div>
</div>
<br />
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>


</body>
</html>