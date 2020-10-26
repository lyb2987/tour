<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 조회</title>
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
	
	function reseravtionCancle(rvNum){
		var chk = confirm("예약을 정말 취소하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			location.href="reservationCancle.rsv?rvNum="+rvNum;
	}
	
	function cehckPayment(rvNum){
		location.href="../pay/checkPayment.pay?rvNum="+rvNum;
	}
</script>
</head>
<body>


<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>예약 정보</h3>
	<div class="qnaBoard">
		<h2>예약 정보 조회</h2>
			<form action="../pay/paymentForm.pay" method="get" name="frm">
				<table>
					<tr>
						<td class="subject"><label>예약 번호</label></td>
						<td class="value"> ${rfpList[0].rsv.rvNum} </td>
					</tr>
					<tr>
						<td class="subject"><label>예약 상태</label></td>
						<td class="value"> ${rfpList[0].rsv.rvStatus} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약 인원</label></td>
						<td class="value"> ${rfpList[0].rsv.rvNumPerson} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약자 아이디</label></td>
						<td class="value"> ${mem.mId} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약자 이름</label></td>
						<td class="value"> ${mem.mKorName} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약자 여권번호</label></td>
						<td class="value"> ${mem.mPassPortNum} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약자 영문 이름</label></td>
						<td class="value"> ${mem.mFirstName} / ${mem.mLastName} </td>
					</tr>
					<tr>
						<td class="subject" ><label>예약자 연락처</label></td>
						<td class="value"> ${mem.mPh1} </td>
					</tr>
					<c:if test="${rfpList[0].fp.fpPassportNum ne null}">
						<c:forEach items="${rfpList}" var="list" varStatus="cnt">
							<tr>
								<td class="subject" ><label>동승자${cnt.count} 여권번호</label></td>
								<td class="value">${list.fp.fpPassportNum}</td>
							</tr>
							<tr>
								<td class="subject" ><label>동승자${cnt.count} 이름</label></td>
								<td class="value">${list.fp.fpKorName}</td>
							</tr>
							<tr>
								<td class="subject" ><label>동승자${cnt.count} 영문 이름</label></td>
								<td class="value">${list.fp.fpEngName}</td>
							</tr>
							<tr>
								<td class="subject" ><label>동승자${cnt.count} 연락처</label></td>
								<td class="value">${list.fp.fpPh1}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td class="subject" ><label for='pName'>패키지 명</label></td>
						<td class="value">${rfpList[0].pkg.pName}</td>
					</tr>
					<tr>
						<td class="subject" ><label for='pDestination'>여행지</label></td>
						<td class="value"> ${rfpList[0].pkg.pDestination}</td>
					</tr>
					<tr>
						<td class="subject"><label for='pPeriod'>여행 날짜</label></td>
						<td class="value">  ${rfpList[0].pkg.pPeriod} </td>
					</tr>
					<tr>
						<td class="subject"><label for='pFlight'>항공편</label></td>
						<td class="value"> ${rfpList[0].pkg.pFlight}</td>
					</tr>
				 	<tr>
						<td class="subject"><label for='pPrice'>총 금액</label></td>
						<td class="value"> ${rfpList[0].rsv.rvTotalPrice}</td>
					</tr>
				</table>
				<input type="hidden" name="rvNum" value="${rfpList[0].rsv.rvNum}"/>
			<div class="btn">	
				<c:if test="${rfpList[0].rsv.rvStatus eq '결제 대기'}">
					<input type='submit' value='결제' />&nbsp;&nbsp;
				</c:if>
				<c:if test="${rfpList[0].rsv.rvStatus eq '결제 완료'}">
					<input type='button' value='결제내역 확인' onclick="cehckPayment(${rfpList[0].rsv.rvNum});"/>&nbsp;&nbsp;
				</c:if>
				<input type='button' value='예약 취소' onclick="reseravtionCancle(${rfpList[0].rsv.rvNum});"/>&nbsp;&nbsp;
			</div>	
		</form>
	</div>
</div>
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>




</body>
</html>