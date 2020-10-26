<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/reset.css" />
<style type="text/css">
   .main > h1 {font-size: 32px; margin-top: 10px;}
    .header{width: 100%; height: 100px;font-size: 16px;}
    .header_wraper{width: 100%; height:50px; font-size: 16px; background-color: rgba(229, 35, 109, 1);}
    .header_wraper >ul{width: 1200px; margin: 0 auto; position: relative}
    .header_wraper >ul>li{float: left;width: 16.6%;line-height: 50px;}
    .header_wraper >ul>li>a{color: #fff;text-align: center;display: block}
     .header_wraper >ul>li>ul{width: 100%;position: absolute;top: 50px; left: 50px;display: none;}
    .header_wraper >ul>li>ul>li{float: left;width: 20%;}
    .header_wraper >ul>li>ul>li>a{text-align: center; display: block;line-height: 50px}
    .header_wraper >ul> li >ul.width333 >li{width: 33.33%}

</style>
</head>
<body>

<div class="main" align="center">
<h1>
	<a href="../main/main.main">
		<img src="../images/hot-air-balloon-32.png" alt='logo' title='logo' />
		우리들 투어
	</a>
</h1>
 <div align="right">
 <c:if test="${empty logId}">
<h5>
   <a href="../member/memberLogin.mem">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
   <a href="../member/memberAgree.mem">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
   <a href="#">고객센터</a>&nbsp;&nbsp;
</h5>
</c:if>
<c:if test="${!empty logId}">
 <c:if test="${logId ne 'admin'}">
    <h5>
    <a href="../member/LogoutPro.mem">로그아웃</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="../member/MyPage.mem">마이페이지</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="../rsv/myReservation.rsv">예약확인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="#">고객센터</a>&nbsp;&nbsp;
 </h5>
 </c:if>
 <c:if test="${logId eq 'admin'}">
    <h5>
    <a href="../pkg/packgaeBoard.pkg">패키지 관리</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="../member/memberList.mem">회원 관리</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="../member/LogoutPro.mem">로그아웃</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="../rsv/myReservation.rsv">예약확인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
    <a href="#">고객센터</a>&nbsp;&nbsp;
 </h5>
 </c:if>
</c:if>
</div>
</div>
<!--메인 검색, 메뉴-->
<div class="header">
	<div class="header_wraper">
		<ul>
			<li class="header_all">
				<a href="../pkg/packgaeBoard.pkg">전체 패키지 상품</a>
			</li>
			<li><a href="../pkg/packageBoardSearch.pkg?dst=아시아">한국·일본·중국·동남아</a>
				<ul class="deth2">
					<li><a href="../pkg/packageBoardSearch.pkg?dst=한국">한국</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=일본">일본</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=중국">중국</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=동남아">동남아</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=기타지역">기타지역</a></li>
				</ul>
			</li>
			<li><a href="../pkg/packageBoardSearch.pkg?dst=오세아니아">오세아니아·아프리카</a>
				<ul class="deth2">
					<li><a href="../pkg/packageBoardSearch.pkg?dst=호주">호주</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=뉴질랜드">뉴질랜드</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=이집트">이집트</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=케냐">케냐</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=기타지역">기타지역</a></li>
				</ul>
			</li>
			<li><a href="../pkg/packageBoardSearch.pkg?dst=유럽">유럽</a>
				<ul class="deth2">
					<li><a href="../pkg/packageBoardSearch.pkg?dst=서유럽">서유럽</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=남유럽">남유럽</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=북유럽">북유럽</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=동유럽">동유럽</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=기타지역">기타지역</a></li>
				</ul>
			</li>
			<li><a href="../pkg/packageBoardSearch.pkg?dst=아메리카">아메리카</a>
				<ul class="deth2">
					<li><a href="../pkg/packageBoardSearch.pkg?dst=미국">미국</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=캐나다">캐나다</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=멕시코">멕시코</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=아르헨티나">아르헨티나</a></li>
					<li><a href="../pkg/packageBoardSearch.pkg?dst=기타지역">기타지역</a></li>
				</ul>
			</li>
			<li class ="board"><a href="../qna/qnaBoardList.qna">게시판</a>
				<ul class="deth2 width333">
					<li><a href="../qna/qnaBoardList.qna">자유 게시판</a></li>
					<li><a href="../faq/faqBoardList.faq">FAQ 게시판</a></li>
					<li><a href="../rv/reviewBoardList.rv">후기 게시판</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('.header_wraper >ul >li').on({
		mouseenter: function() {
		$(this).parents().find('.header').css('background-color', 'rgb(255, 178, 207)')
		$(this).find('ul').css('display', 'block')
		     
		},

		mouseleave: function() {
		$(this).parents().find('.header').css('background', 'none')
		$(this).find('ul').css('display', 'none')
		}
	})
	
	$('.header_wraper >ul >li.header_all').on({
		mouseenter: function() {
		$(this).parents().find('.header').css('background', 'none')
		    
		},
		mouseleave: function() {
		   
		}
	})
})
</script>
</body>
</html>