<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 약관동의</title>
<style type="text/css">
   .contentDiv{width: 1200px; margin-top :60px; margin: 0 auto;}
    .contentDiv > h3 {font-size: 30px; text-align:center;}
    
    .centerDiv > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
    
    table{width:900px; height: auto; margin: 0 auto;}
    .btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function agreeChk(){
		
		if($("input:checkbox[name=agree]").is(":checked") == true){
			location.href="packageNoP.pkg?pNum=${dto.pNum}";
		}
		else if($("input:checkbox[name=agree]").is(":checked") == false){
			alert("약관동의 후 진행해 주세요!");
		}
	}
</script>
</head>
<body>


<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
<div class="contentDiv">
	<h3>예약</h3>
	<div class="centerDiv" >
		<h2> 예약 : 1. 약관 동의 </h2>
		<table>
			<tr>
				<th>
					<h4>여행사 약관 동의</h4>
				</th>
			</tr>
			<tr>
				<td>
					● 계약금규정<br>
					· 계약금은 국외여행 표준약관에 의거 하여 예약일 기준 3일 이내에 상품가격의 10%를 결제하셔야 합니다.<br>
					· 계약금 입금이 지연될 경우 예약이 취소될수 있습니다.<br>
					· 계약금은 항공, 호텔, 현지 사정에 따라 금액이 변동 될수 있으며, 상황에 따라 결제시한이 당겨질수도 있습니다.<br>
					· 계약금 결제 이후 취소료 규정 적용 기간에 취소 시 취소 수수료가 계약금 금액 보다 클 시 추가 취소 수수료를 부담하셔야합니다.<br>
					· 취소료 규정 적용 기간에 예약 시 계약금은 취소료 규정 배상 금액 만큼으로 변경 됩니다.<br>
					ex) 여행 개시 8일전 예약 시 : 취소료 부과 금액인 총 상품가격의 20% 를 계약금으로 결제계좌<br>
					<br><br>
					● 여행 취소료 규정<br>
					▶ 인터넷상에서 예약/결제 취소 및 변경은 불가능 하오니, 예약/결제 취소나 여행자정보 변경을 원하시면 반드시 예약담당자에게 연락하여 주시기 바랍니다.<br>
					<br><br>
					▶여행자의 여행계약 해제 요청 시 여행약관에 의거하여 취소료가 부과됩니다◀<br>
					제16조(여행출발 전 계약해제)<br>
					- 여행개시 30일전까지( ～30) 통보 시 - 계약금 환급<br>
					- 여행개시 20일전까지(29～20) 통보 시 - 여행요금의 10% 배상<br>
					- 여행개시 10일전까지(19～10) 통보 시 - 여행요금의 15% 배상<br>
					- 여행개시 8일전까지( 9～ 8) 통보 시 - 여행요금의 20% 배상<br>
					- 여행개시 1일전까지( 7～ 1) 통보 시 - 여행요금의 30% 배상<br>
					- 여행 당일 통보 시 - 여행요금의 50% 배상<br>
					(※공정거래위원회 고시 제2014-4호 소비자분쟁해결기준에 의한것으로 제15조의 변경사항은 2014년 3월21일 여행상품예약자부터 적용)<br>
					<br><br>
					● 최저출발인원 미 충족 시 계약해제<br>
					· 당사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.<br>
					· 당사는 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급 받은 계약금 환급 외에 다음 각 목의 금액을 여행자에게 배상하여야 합니다.<br>
					- 여행개시 7일전까지 여행계약 해제 통지시 : 계약금 환급<br>
					- 여행출발 1일전까지 통지시 : 여행요금의 30%<br>
					- 여행출발 당일 통지시 : 여행요금의 50%<br>
					<br><br>
					● 취소위약금 증빙 제공 및 차액환급 안내<br>
					고객님은 상기 취소료에 대해 증빙을 요청할 수 있으며, 취소료 규정과 증빙(인건비 포함)에서 차액이 있는 경우 이를 환급합니다.<br>
					<br><br>
					증빙제공 및 환급규정<br>
					고객은 계약 취소와 관련하여 취소수수료(여행사 인건비 포함) 부가 내역에 대한 구체적인 증빙과 설명을 여행사에 요구할 수 있으며, 여행사는 관련 설명과 증빙을 제시하고, 취소수수료 규정과 차액이 있는 경우 이를 환 급합 니 다.
				</td>
			</tr>
			<tr>
				<td>
              			<input type="checkbox" value="agree" name="agree" /> 동의 
				</td>
			</tr>
		</table>
		<div class="btn">
			<input type="button" value="다음" onclick="agreeChk();">
		</div>
	</div>
</div>
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>





</body>
</html>