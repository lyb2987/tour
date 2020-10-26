<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약최종 확인 페이지</title>
<style type="text/css">
   .qnaView{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaView > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { margin-left: 15px; height: 40px; font-size: 14px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	function paymentPackage(rvNum){
		var chk = confirm("결제 페이지로 이동하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			location.href="../pay/paymentForm.pay?rvNum=${rsv.rvNum}";
		
	}
	function reservationDetail(rvNum){
		var chk = confirm("예약 상세 페이지로 이동하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			location.href="reservationDetail.rsv?rvNum=${rsv.rvNum}";
		
	}
	
</script>
</head>
<body>


<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>예약</h3>
	<div class="qnaBoard">
		<h2>예약 확인</h2>
		<form action="reservationPro.rsv" method="post" name="frm">
			<table>
				<tr>
					<td class="subject"><label>예약 번호</label></td>
					<td class="content"> ${rsv.rvNum} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약 진행상태</label></td>
					<td class="content"> ${rsv.rvStatus} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 아이디</label></td>
					<td class="content"> ${mem.mId} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 이름</label></td>
					<td class="content"> ${mem.mKorName} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 여권번호</label></td>
					<td class="content"> ${mem.mPassPortNum} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 영문 이름</label></td>
					<td class="content"> ${mem.mFirstName} / ${mem.mLastName} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 연락처</label></td>
					<td class="content"> ${mem.mPh1} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약 인원</label></td>
					<td class="content"> ${rsv.rvNumPerson} </td>
				</tr>
				<c:forEach items="${fplist}" var="fp" varStatus="cnt">
					<tr>
						<td class="subject"><label>동승자${cnt.count} 여권번호</label></td>
						<td class="content"> ${fp.fpPassportNum}</td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt.count} 이름</label></td>
						<td class="content"> ${fp.fpKorName}</td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt.count} 영문 이름</label></td>
						<td class="content"> ${fp.fpEngName}</td>
					</tr>
					<tr>
						<td class="subject"><label>동승자${cnt.count} 연락처</label></td>
						<td class="content"> ${fp.fpPh1}</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="subject"><label for='pName'>패키지 명</label></td>
					<td class="content">${pkg.pName}</td>
				</tr>
				<tr>
					<td class="subject"><label for='pDestination'>여행지</label></td>
					<td class="content"> ${pkg.pDestination}</td>
				</tr>
				<tr>
					<td class="subject"><label for='pPeriod'>여행 날짜</label></td>
					<td class="content">  ${pkg.pPeriod} </td>
				</tr>
				<tr>
					<td class="subject"><label for='pFlight'>항공편</label></td>
					<td class="content"> ${pkg.pFlight}</td>
				</tr>
			 	<tr>
					<td class="subject"><label for='pPrice'>총 금액</label></td>
					<td class="content"> ${rsv.rvTotalPrice}</td>
				</tr>
			</table>
			<div class="btn">
				<input type='button' value='결제' onclick="paymentPackage(${rsv.rvNum});"/>&nbsp;&nbsp;
				<input type='button' value='예약 정보 조회' onclick="reservationDetail(${rsv.rvNum});"/>&nbsp;&nbsp;
			</div>
		</form>
	</div>
</div>
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>




</body>
</html>