<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지 : 할인</title>
<style type="text/css">
	.qnaView{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaView > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	th {padding-top: 5px; padding-bottom: 5px;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">

	var couponeExiste = false;
	var pointExiste = false;
	
	function dcNone(){
		$("#pointTr").remove();
		$("#pointInputTr").remove();
		$("#totalPriceP").remove();
		pointExiste = false;
		if(couponeExiste){
			$("#couponTr").remove();
			couponeExiste = false;
		}
		if(pointExiste){
			
		}
		$("#dcPriceP").remove();
		console.log("없음 선택");
		priceHtml = "<p name='dcPriceP' id='dcPriceP'>0</p>";
		$("#dcPrice").append(priceHtml);
		totalPriceHtml = "<p name='totalPriceP' id='totalPriceP'>${rfplist[0].rsv.rvTotalPrice}</p>" 
		$("#totalPrice").append(totalPriceHtml);
	}
	
	function dcCoupon(){
		$("#dcPriceP").remove();
		$("#pointTr").remove();
		$("#totalPriceP").remove();
		$("#pointInputTr").remove();
		pointExiste = false;
		if(couponeExiste){
			$("#couponTr").remove();
			couponeExiste = false;
		}
		else{
			var couponHtml = "";
			couponHtml += "<tr id='couponTr'>";
			couponHtml += "<td class='subject'>";
			couponHtml += "쿠폰 선택";
			couponHtml += "</th>";
			couponHtml += "<td class='value'>";
			couponHtml += "<a id='couponP' name='couponP'> 선택 안됨";
			couponHtml += "</a> &nbsp;";
			couponHtml += "<input type='button' id='couponSelectBtn' onclick='couponSelect();' value='쿠폰 선택'></td>";
			couponHtml += "<input type='hidden' id='cNum' name='cNum' value='0'></td>";
			couponHtml += "<input type='hidden' id='hdcPrice' name='hdcPrice' value='0'></td>";
			couponHtml += "</td>";
			couponHtml += "</tr>";
			$("#DcMeans").after(couponHtml);
			couponeExiste = true;
		}
	}
	
	function dcPoint(){
		$("#couponTr").remove();
		couponeExiste = false;
		$("#dcPriceP").remove();
		if(pointExiste){
			$("#pointTr").remove();
			$("#pointInputTr").remove();
			pointExiste = false;
		}
		else{
			var pointHtml = "";
			pointHtml += "<tr id='pointTr'>";
			pointHtml += "<td class='subject'>";
			pointHtml += "보유 포인트";
			pointHtml += "</td>";
			pointHtml += "<td class='value'>";
			pointHtml += "${mem.mPoint}";
			pointHtml += "</td>";
			pointHtml += "</tr>";
			pointHtml += "<tr id='pointInputTr'>";
			pointHtml += "<td class='subject'>";
			pointHtml += "사용할 포인트";
			pointHtml += "</td>";
			pointHtml += "<td class='value'>";
			pointHtml += "<input type='text' name='usePoint' id='usePoint'>";
			pointHtml += "<input type='button' name='usePointBtn' id='usePointBtn' value='포인트 적용' onclick='setPoint();'>";
			pointHtml += "</td>";
			pointHtml += "</tr>";
			console.log(pointHtml);
			$("#DcMeans").after(pointHtml);
			pointExiste = true;
		}
	}
	
	function setPoint(){
		$("#dcPriceP").remove();
		$("#totalPriceP").remove();
		var point =  parseInt($("#usePoint").val());
		var price = ${pay.payRvTotalPrice};
		var totalPrice = price - point;
		dcPriceHtml = "";
		totalPriceHtml = "";
		dcPriceHtml += "<p name='dcPriceP' id='dcPriceP'>" + point + "</p>";
		totalPriceHtml += "<p name='totalPriceP' id='totalPriceP'>" + totalPrice +  "</p>";
		$("#dcPrice").append(dcPriceHtml);
		$("#totalPrice").append(totalPriceHtml);
	}
	
	
	function couponSelect(){
		open("payCouponSelect.pay?rvNum=${rfplist[0].rsv.rvNum}","쿠폰 선택",
        "width=700,height=500,lef=700,top=500");
	}
	
	$(function(){
		
	});
</script>
</head>
<body>



<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>결제</h3>
	<div class="qnaBoard">
		<h2>할인 적용</h2>
		<form action="paymentPayMeans.pay" method="post" name="frm">
			<table>
				<tr>
					<th colspan="2">
						예약자 정보
					</th>
				</tr>
				<tr>
					<td class="subject"><label>예약 번호</label></td>
					<td class="value"> ${rfplist[0].rsv.rvNum} </td>
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
					<td class="subject" ><label>예약자 연락처</label></td>
					<td class="value"> ${mem.mPh1} </td>
				</tr>
				<tr>
					<td class="subject" ><label>예약 인원</label></td>
					<td class="value"> ${rfplist[0].rsv.rvNumPerson} </td>
				</tr>
				<tr>
					<th colspan="2">
						여행 패키지 정보
					</th>
				</tr>
				<tr>
					<td class="subject" ><label>패키지 명</label></td>
					<td class="value">${rfplist[0].pkg.pName}</td>
				</tr>
				<tr>
					<td class="subject" ><label>여행지</label></td>
					<td class="value"> ${rfplist[0].pkg.pDestination}</td>
				</tr>
				<tr>
					<td class="subject"><label>여행 날짜</label></td>
					<td class="value">  ${rfplist[0].pkg.pPeriod} </td>
				</tr>
				<tr>
					<td class="subject"><label>항공편</label></td>
					<td class="value"> ${rfplist[0].pkg.pFlight}</td>
				</tr>
			 	<tr>
					<td class="subject"><label>총 금액</label></td>
					<td class="value"> ${rfplist[0].rsv.rvTotalPrice}</td>
				</tr>
				<tr>
					<th colspan="2">
						결제 정보
					</th>
				</tr>
				<tr>
					<td class="subject"><label>상품 금액</label></td>
					<td class="value"> ${rfplist[0].rsv.rvNumPerson} * ${rfplist[0].rsv.rvPPrice} = ${rfplist[0].rsv.rvTotalPrice}</td>
				</tr>
				<tr id="DcMeans" >
					<td class="subject"><label>상품 할인 수단</label></td>
					<td class="value"> 
						<input type='radio' name='payDcMeans' id='payDcMeans' value='none'  onclick="dcNone();"/> 없음  &nbsp;
						<input type='radio' name='payDcMeans' id='payDcMeans' value='coupon' onclick="dcCoupon();" /> 쿠폰  &nbsp;
						<input type='radio' name='payDcMeans' id='payDcMeans' value='point' onclick="dcPoint();" /> 포인트  &nbsp;
					</td>
				</tr>
				
				<tr>
					<td class="subject"><label>할인 금액</label></td>
					<td class="value" id="dcPrice">  </td>
				</tr>
				<tr>
					<td class="subject"><label>최종 상품 금액</label></td>
					<td class="value" id="totalPrice"> </td>
				</tr>
				<tr>
					<td class="subject"><label>결제 수단</label></td>
					<td class="value"> 
 						<input type='radio' name='payMeans' id='payMeans' value='card' /> 신용카드 &nbsp;
						<input type='radio' name='payMeans' id='payMeans' value='virtual' /> 무통장입금 &nbsp;
						<input type='radio' name='payMeans' id='payMeans' value='phone' /> 휴대전화  &nbsp;
						<br />
						<input type='radio' name='payMeans' id='payMeans' value='kakaoPay' /> 카카오페이  &nbsp;
						<input type='radio' name='payMeans' id='payMeans' value='toss' /> 토스  &nbsp;
						<div></div>
					</td>
				</tr>
				</tbody>
			</table>
			<input type="hidden" name="rvNum" value="${rfplist[0].rsv.rvNum}">
			<input type="hidden" name="htotalPrice" value="${rfplist[0].rsv.rvTotalPrice}">
		<div class="btn">
			<input type="submit" value="다음">
		</div>
		</form>
	</div>
</div>
<!-- foot부분 -->

	<%@ include file="../frame/footer.jsp" %>

</body>
</html>