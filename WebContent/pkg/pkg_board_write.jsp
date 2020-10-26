<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패키지 등록</title>
<style type="text/css">
	.pkg {width: 1200px; margin-top :60px; margin: 0 auto;}
	.pkg > h3 {font-size: 30px; text-align:center;}
   
	.Write > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
   
	table{width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { height: 40px; font-size: 14px;}
	.value > input {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value > textarea {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value > select {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value1 > input {margin-left: 15px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$('#pDestination').on("change", function() {
		console.log("ㅎㅇ");
	});
</script>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->>
<div class="pkg">
	<h3>
		<a href="packgaeBoard.pkg">패키지 상품</a>
	</h3>
	<div class="Write">
		<h2>패키지 등록</h2>
		<form action="pkgWritePro.pkg" method="post" name="frm" enctype="multipart/form-data">
			<table >
				<colgroup>
				    <col width="25%" />
					<col width="75%"  />
			    </colgroup>
				<tr>
					<td class="subject">
						패키지 명
					</td><!-- id:#userId1, .userId2 -->
					<td class="value">
						<input type='text' name='pName' id='pName' />
					</td>
				</tr>
				<tr>
					<td class="subject">
						상품 이미지
					</td>
					<td class="value1">
						<input type="file" name="pImages" id="pImages" >
					</td>
				</tr>
				<tr>
					<td class="subject">
						여행지
					</td>
					<td class="value">
						<select name='pDestination' id='pDestination' class="pDestination">
							<!-- 아시아 -->
							<option value="선택">선택하세요</option>
							<option value="">-----아시아-----</option>
							<option value="아시아 한국">한국</option>
							<option value="아시아 일본">일본</option>
							<option value="아시아 중국">중국</option>
							<option value="아시아 홍콩">홍콩</option>
							<option value="아시아 동남아 태국">태국</option>
							<option value="아시아 동남아 베트남">베트남</option>
							<option value="아시아 동남아 필리핀">필리핀</option>
							<option value="아시아 동남아 캄보디아">캄보디아</option>
							<option value="아시아 기타지역 인도">인도</option>
							<option value="아시아 기타지역 사우디아라비아">사우디아라비아</option>
							<option value="아시아 기타지역 카타르">카타르</option>
							<!-- 오세아니아, 아프리카 -->
							<option value="">-----오세아니아-----</option>
							<option value="오세아니아 호주">호주</option>
							<option value="오세아니아 뉴질랜드">뉴질랜드</option>
							<option value="">-----아프리카-----</option>
							<option value="아프리카 이집트">이집트</option>
							<option value="아프리카 케냐">케냐</option>
							<option value="기타지역 아프리카 남아프리카공화국">남아프리카공화국</option>
							<option value="기타지역 아프리카 모로코">모로코</option>
							<option value="기타지역 아프리카 가나">가나</option>
							<!-- 유럽 -->
							<option value="">-----서유럽-----</option>
							<option value="서유럽 영국">영국</option>
							<option value="서유럽 독일">독일</option>
							<option value="서유럽 프랑스">프랑스</option>
							<option value="서유럽 스위스">스위스</option>
							<option value="서유럽 벨기에">벨기에</option>
							<option value="서유럽 네덜런드">네덜란드</option>
							<option value="">-----북유럽-----</option>
							<option value="북유럽 노르웨이">노르웨이</option>
							<option value="북유럽 스웨덴">스웨덴</option>
							<option value="북유럽 덴마크">덴마크</option>
							<option value="북유럽 핀란드">핀란드</option>
							<option value="">-----남유럽-----</option>
							<option value="남유럽 이탈리아">이탈리아</option>
							<option value="남유럽 그리스">그리스</option>
							<option value="남유럽 포르투갈">포르투갈</option>
							<option value="남유럽 스페인">스페인</option>
							<option value="">-----동유럽-----</option>
							<option value="동유럽 러시아">러시아</option>
							<option value="동유럽 헝가리">헝가리</option>
							<option value="동유럽 폴란드">폴란드</option>
							<option value="동유럽 체코">페코</option>
							<option value="동유럽 오스트리아">오스트리아</option>
							<!-- 아메리카 -->
							<option value="">-----아메리카-----</option>
							<option value="아메리카 미국">미국</option>
							<option value="아메리카 캐나다">캐나다</option>
							<option value="아메리카 멕시코">멕시코</option>
							<option value="아메리카 아르헨티나">아르헨티나</option>
							<option value="아메리카 기타지역 브라질">브라질</option>
							<option value="아메리카 기타지역 볼리비아">볼리비아</option>
							<option value="아메리카 기타지역 칠레">칠레</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="subject">
						여행 날짜
					</td>
					<td class="value">
						<input type ='text' name='pPeriod' id='pPeriod' placeholder='2000-01-01~2000-01-01'/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						최대인원
					</td>
					<td class="value">
						<input type='text' name='pMP' id='pMP'/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						패키지 상세내용
					</td>
					<td class="value">
						<textarea rows="10" cols="50" name='pContent'></textarea>
					</td>
				</tr>
			 	<tr>
					<td class="subject">
						패키지 금액
					</td>
					<td class="value">
						<input type='text' name='pPrice' id='pPrice' />
					</td>
				</tr>
			 	<tr>
					<td class="subject">
						항공편
					</td>
					<td class="value">
						<select name='pFlight' id='pFlight' class="pFlight">
							<option value="선택">선택하세요</option>
							<option value="대한항공">대한항공</option>
							<option value="아시아나항공">아시아나항공</option>
							<option value="제주항공">제주항공</option>
							<option value="이스타항공">이스타항공</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="subject">
						호텔
					</td>
					<td class="value">
						<select name='pHotel' id ='pHotel' class="pHotel">
							<option value="선택">선택하세요</option>
							<option value="3성급">3성급</option>
							<option value="4성급">4성급</option>
							<option value="5성급">5성급</option>
							<option value="6성급">6성급</option>
							<option value="7성급">7성급</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="subject">
						렌트카
					</td>
					<td class="value">
						<select name='pLentCar' id ='pLentCar' class="pLentCar">
							<option value="선택">선택하세요</option>
							<option value="오빠차뽑았다널데리러가">오빠차뽑았다널데리러가</option>
							<option value="꼬마자동차">꼬마자동차</option>
							<option value="타요">타요</option>
							<option value="스피드레이서">스피드레이서</option>
							<option value="분노의질주">분노의질주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="subject">
						여행자 보험
					</td>
					<td class="value">
						<select name='pInsurance' id ='pInsurance' class="pInsurance">
							<option value="선택">선택하세요</option>
							<option value="삼성화제 여행자보험">삼성화제 여행자보험</option>
							<option value="한화생명 여행자보험">한화생명 여행자보험</option>
							<option value="삼성행명 여행자보험">삼성행명 여행자보험</option>
						</select>
						<input type="hidden" name='pAgree' id ='pAgree' value="ok"/>
					</td>
				</tr>
			</table>
			<div class="btn">
				<input type='submit' value='패키지 등록' />&nbsp;&nbsp;
				<input type='reset' value='다시 입력' />&nbsp;&nbsp;
			</div>
		</form>
	</div>
</div>
<br />
<!-- foot부분 -->

<%@ include file="../frame/footer.jsp" %>

			

</body>
</html>