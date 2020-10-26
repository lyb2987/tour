<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="reset.css" />
<style type="text/css">
.triangle {display:inline-block; width:0; height:0; border-style:solid; border-width:15px;}
	.triangle.left {border-color:transparent rgba(229, 35, 109, 1) transparent transparent;}
	.triangle.right {border-color:transparent transparent transparent rgba(229, 35, 109, 1);}

    .mySlides {display:none;}
    
    .contentDiv{width: 100%; background-color:#c8f6ff ;}
    .contentDivWrap{width: 1200px; height: 510px; margin: 0 auto; padding: 50px 0; }
    
    .searchForm span{font-size: 20px; font-weight:500}
    .searchForm h3{font-size: 20px;}
    .searchForm{width: 400px;display: block;float: left; margin-top: 50px}
    .searchForm input[type="text"]{;padding-left: 10px; margin: 20px 0;}
    .search{width: 300px; height: 35px}
    
    .start{float: left;margin-right: 10px; /*border: 1px solid rgba(229, 35, 109, 1)*/ }
    .start >li{width: 145px; height: 25px;background-color: #fff;line-height: 25px; }
    .start >li> a{padding-left: 20px}
    .start >li >ul{background-color: #fff;display: none}
    .start >li >ul>li{width: 145px; height: 25px}
    .start >li >ul>li>a{padding-left: 10px}
    
    
    #calender{float: left; width: 145px; height: 25px}
    
    .have{width: 145px;height: 50px ;float: left;border: 1px solid  rgba(0, 0, 0, 0.2);box-sizing: border-box;margin: 20px 10px 20px 0;padding: 10px; }
    .have span{margin-left: 40px; font-size:12px; width: 120px;height: 30px; color:  rgba(0, 0, 0, 0.3);line-height: 30px;}
    
     .we{width: 145px;height: 50px ;float: left;border: 1px solid  rgba(0, 0, 0, 0.2);box-sizing: border-box;margin: 20px 10px 20px 0;padding: 10px 0 10px 40px; }
    .we span{font-size:12px; width: 120px;height: 30px; color:  rgba(0, 0, 0, 0.3);line-height: 16px;}
    
   .banner{ width: 800px;display: block;float: left; position: relative;}
    .banner li{position: absolute; top: 0; left: 0}
    .banner li img{width: 620px; height:410px}
    #searchChk{width: 300px; height: 35px ;background-color: #333; color: #fff;}
    
     .contentDiv2 { width: 100%; }
    .banner2 { width: 1200px; height: 300px; margin: 0 auto; padding: 50px 0;}
    .banner2Text > span {font-size: 24px; font-weight: bold; }
    .banner2List {margin-top: 50px; margin-bottom: 50px;}
    .banner2List > ul > li {float: left; width: 20%; }
    .item_title {font-size: 16px; font-weight: bold; text-align: center;}
    .item_text {text-align: center;}
    .img > img {width: 80%; height: 165px; margin-left: 10%; margin-right: 10%; border-radius: 50%;}
</style>

</head>

<body>
    <!-- header부분 -->
    <%@ include file="../frame/header.jsp" %>

    <!-- 변동부분 -->
    <div class="contentDiv">
        <div class="contentDivWrap">

            <div class="searchForm">
                <span>고객님,</span><br />
                <h3>어떤 여행을 꿈꾸시나요?</h3>
                <form action="../pkg/packageBoardSearchMain.pkg" method="post" name="searchFrom">
                    <input type="text" name="search" id="search" class="search" placeholder="어디로 떠나세요?">
                    <ul class="start">
                        <li><a href ="#">인천/김포 출발</a>
                            <ul class="startdeth2">
                                <li><a href=#>서울(인천/김포)</a></li>
                                <li><a href=#>부산</a></li>
                                <li><a href=#>대구</a></li>
                                <li><a href=#>청주</a></li>
                                <li><a href=#>광주(무안)</a></li>
                                <li><a href=#>제주</a></li>
                                <li><a href=#>양양</a></li>
                                <li><a href=#>강원</a></li>
                            </ul>
                        </li>
                    </ul>
                    <input type="date" id="calender" name="calender">
                    <div class="have"><span>항공권은 있어요</span></div>
                    <div class="we"><span>우리끼리만 <br/>여행할래요</span></div>

                    <button id="searchChk">패키지검색</button>
                </form>
            </div>

            <div class="banner">
                <ul>
                    <li>
                    <a href="#"><img class="mySlides" src="../images/img1.jpg" style="width:100%"></a>
                    <a href="#"><img class="mySlides" src="../images/img2.jpg" style="width:100%" ></a>
                    <a href="#"><img class="mySlides" src="../images/img3.jpg" style="width:100%"></a>
                    <a href="#"><img class="mySlides" src="../images/img4.jpg" style="width:100%"></a>
                    <!-- <a  style="position:absolute; top:45%;left:0" --> 
                    <span class="triangle right" style="position:absolute;top:45%;right:0" onclick="plusDivs(1)"></span>
					<span class="triangle left" style="position:absolute;top:45%;left:0" onclick="plusDivs(-1)"></span>
                </ul>


            </div>
        </div>
        <!--contentDivWrap-->
    </div>
    <!--contentDiv-->
    <div class="contentDiv2">
	    <div class="banner2">
	       	<div class="banner2Text">
	       		<span>주목! 지금 HOT한 여행지</span>
	       	</div>
	       	<div class="banner2List">
		      	<ul>
		      		<li>
		      			<a href="#">
		      				<span class="img">
		      					<img src="../images/osaka.jpg"/>
		      				</span>
		      				<p class="item_title">일본</p>
		      				<p class="item_text">일본 오사카</p>
		      			</a>
		      		</li>
		      		<li>
		      			<a href="#">
		      				<span class="img">
		      					<img src="../images/hollywood.jpg"/>
		      				</span>
		      				<p class="item_title">LA</p>
		      				<p class="item_text">미국 LA</p>
		      			</a>
		      		</li>
		      		<li>
		      			<a href="#">
		      				<span class="img">
		      					<img src="../images/jeju.jpeg"/>
		      				</span>
		      				<p class="item_title">제주도</p>
		      				<p class="item_text">한국 제주도</p>
		      			</a>
		      		</li>
		      		<li>
		      			<a href="#">
		      				<span class="img">
		      					<img src="../images/pari.jpg"/>
		      				</span>
		      				<p class="item_title">파리</p>
		      				<p class="item_text">프랑스 파리</p>
		      			</a>
		      		</li>
		      		<li>
		      			<a href="#">
		      				<span class="img">
		      					<img src="../images/russia.jpg"/>
		      				</span>
		      				<p class="item_title">모스크바</p>
		      				<p class="item_text">러시아 모스크바</p>
		      			</a>
		      		</li>
		      	</ul>
		      </div>
		</div>
	</div>

    <!-- foot부분 -->
    <%@ include file="../frame/footer.jsp" %>
<script>
var myIndex = 0;
carousel();

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function carousel () {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); 
}
 		
    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mySlides");
        if (n > x.length) {slideIndex = 1}
        if (n < 1) {slideIndex = x.length} ;
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex-1].style.display = "block";
    }

</script>

</body>

</html>
