<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
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
</script>
</head>
<body>


<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="qnaView">
	<h3>결제</h3>
	<div class="qnaBoard">
		<h2>결제 정보 입력</h2>
		<form action="payment.pay" method="post" name="frm">
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
					<td class="subject"><label>예약자 이름</label></td>
					<td class="value"> ${mem.mKorName} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약자 연락처</label></td>
					<td class="value"> ${mem.mPh1} </td>
				</tr>
				<tr>
					<td class="subject"><label>예약 인원</label></td>
					<td class="value"> ${rfplist[0].rsv.rvNumPerson} </td>
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
						${pay.payDcMeans}
					</td>
					<c:if test="${pay.payDcMeans eq 'coupon'}">
						<input type="hidden" name="cNum" id="cNum" value="${cNum}">
					</c:if>
				</tr>
				
				<tr>
					<td class="subject"><label>할인 금액</label></td>
					<td class="value" id="dcPrice"> ${pay.payDcPrice} </td>
				</tr>
				<tr>
					<td class="subject"><label>최종 상품 금액</label></td>
					<td class="value" id="totalPrice"> ${pay.payTotalPrice}  </td>
				</tr>
				<tr>
					<td class="subject"><label>결제 수단</label></td>
					<td class="value"> 
 						${pay.payMeans} 
					</td>
				</tr>
				<tr>
					<th colspan="2">
						결제 정보 입력 및 확인
					</th>
				</tr>
				<c:if test="${pay.payMeans eq 'card'}">
					<tr>
						<td class="subject"><label>카드사</label></td>
						<td class="value"> 
	 						<select name="cardCompany">
							    <option value="KB국민카드">국민</option>
							    <option value="현대카드">현대</option>
							    <option value="우리카드">우리</option>
							    <option value="신한카드">신한</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="subject"><label>카드 번호</label></td>
						<td class="value"> 
	 						<input type="text" name="cardNum1" size="4" maxlength="4">
	 						<input type="text" name="cardNum2" size="4" maxlength="4">
	 						<input type="text" name="cardNum3" size="4" maxlength="4">
	 						<input type="text" name="cardNum4" size="4" maxlength="4">
						</td>
					</tr>
					<tr>
						<td class="subject"><label>유효 기간</label></td>
						<td class="value"> 
	 						M<input type="text" name="cardValidityM" size="2" maxlength="2"> &nbsp;
	 						D<input type="text" name="cardValidityD" size="2" maxlength="2">
						</td>
					</tr>
					<tr>
						<td class="subject"><label>CVC</label></td>
						<td class="value"> 
	 						<input type="text" name="cardCVC" size="3" maxlength="3">
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'virtual'}">
					<tr>
						<td class="subject"><label>입금 계좌 번호</label></td>
						<td class="value"> 
							국민 : 1234-5678-912-34 &nbsp; OO투어
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'phone'}">
					<tr>
						<td class="subject"><label>통신사</label></td>
						<td class="value"> 
	 						<select name="telleCompany">
							    <option value="SKT">SKT</option>
							    <option value="KT">KT</option>
							    <option value="LG U+">LG U+</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="subject"><label>핸드폰 번호</label></td>
						<td class="value"> 
	 						<input type="text" name="phoneNum1" size="3" maxlength="3" value="010"> - 
	 						<input type="text" name="phoneNum2" size="4" maxlength="4"> - 
	 						<input type="text" name="phoneNum3" size="4" maxlength="4">
						</td>
					</tr>
					<tr>
						<td class="subject"><label>명의자 이름</label></td>
						<td class="value"> 
	 						<input type="text" name="phoneOwner" size="10" maxlength="10">
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'kakaoPay'}">
					<tr>
						<td class="value" colspan="2"> 
							만들기 애매
						</td>
					</tr>
				</c:if>
				<c:if test="${pay.payMeans eq 'toss'}">
					<tr>
						<td class="value" colspan="2"> 
							만들기 애매
						</td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<input type="hidden" name="payMeans" value="${pay.payMeans}">
			<input type="hidden" name="rvNum" value="${rfplist[0].rsv.rvNum}">
			<div class="btn">
				<input type="submit" value="결제">
			</div>
		</form>
	</div>
</div>
<!-- foot부분 -->
	<%@ include file="../frame/footer.jsp" %>




</body>
</html>