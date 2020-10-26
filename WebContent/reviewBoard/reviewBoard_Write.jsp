<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.review{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.review > h3 {font-size: 30px; text-align:center;}
	
	.Write > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table{width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { height: 40px; font-size: 14px;}
	.value > input {margin-left: 15px; border: 1px solid #d9d9d9;}
	.value > textarea {margin-left: 15px; border: 1px solid #d9d9d9;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
	
	.rating .rate_radio + label {position: relative;display: inline-block;margin-left: -4px;z-index: 10;width: 60px;height: 60px;background-image: url('../images/starrate.png');background-repeat: no-repeat;background-size: 60px 60px;cursor: pointer;background-color: #f0f0f0;}
	.rating .rate_radio:checked + label {background-color: #ff8;}
	
	.wrap{ max-width: 480px;  margin: 0 auto; /* 화면 가운데로 */ background-color: #fff;  height: 100%; padding: 20px;box-sizing: border-box;}
	.reviewform textarea{ width: 100%; padding: 10px; box-sizing: border-box;}
	.rating .rate_radio { position: relative; display: inline-block;  z-index: 20;  opacity: 0.001;  width: 60px;  height: 60px; background-color: #fff; cursor: pointer;  vertical-align: top; display: none;}
	.rating .rate_radio + label {  position: relative;  display: inline-block;  margin-left: -4px; z-index: 10; width: 60px;  height: 60px;  background-image: url('../images/starrate.png'); background-repeat: no-repeat;background-size: 60px 60px;cursor: pointer;background-color: #f0f0f0;}
	.rating .rate_radio:checked + label {background-color: #ff8;}

	.warning_msg {display: none;position: relative;text-align: center;background: #ffffff;line-height: 26px;width: 100%;color: red;padding: 10px;box-sizing: border-box;border: 1px solid #e0e0e0;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	//별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();//별점 인스턴스 생성
	document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	    })
	});
	document.querySelector('#save').addEventListener('click', function(e){
	    //별점 선택 안했으면 메시지 표시
	    if(rating.rate == 0){
	        rating.showMessage('rate');
	        return false;
	    }
	});
</script>
</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
	<div class="review">
		<h3>
			<a href="reviewBoardList.rv">후기 게시판</a>
		</h3>
		<div class="Write">
			<h2>후기 작성</h2>
			<form action="reviewBoardWritePro.rv" method="post" name="frm">
			<table>
				<tr>
					<td class="subject">
						<p>작성자</p>
					</td>
					<td class="value">
						<input name="reviewName" type="text" value=""/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						<p>비밀번호</p>
					</td>
					<td class="value">
						<input name="reviewPass" type="password" maxlength="10" value=""/> 				
					</td>
				</tr>
				<tr>
					<td class="subject">
						<p>별점</p>
					</td>
					<td class="value">
						<div class="rating">
			                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
			                <input type="checkbox" name="reviewScore1" id="rating1" value="1" class="rate_radio" title="1점">
			                <label for="rating1"></label>
			                <input type="checkbox" name="reviewScore2" id="rating2" value="2" class="rate_radio" title="2점">
			                <label for="rating2"></label>
			                <input type="checkbox" name="reviewScore3" id="rating3" value="3" class="rate_radio" title="3점" >
			                <label for="rating3"></label>
			                <input type="checkbox" name="reviewScore4" id="rating4" value="4" class="rate_radio" title="4점">
			                <label for="rating4"></label>
			                <input type="checkbox" name="reviewScore5" id="rating5" value="5" class="rate_radio" title="5점">
			                <label for="rating5"></label>
			            </div>
					</td>
				</tr>
				<tr>
					<td class="subject">
						<p>패키지명</p>
					</td>
					<td class="value">
						<input name="reviewPkgName" type="text" value=""/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						<p>후기제목</p>
					</td>
					<td class="value">
						<input name="reviewSubject" type="text" value=""/>
					</td>
				</tr>
				<tr>
					<td class="subject">
						<p>후기내용</p>
					</td>
					<td class="value">
						<textarea name="reviewContent" cols="67" rows="15"></textarea>
					</td>
				</tr>
			</table>
			<div class="btn">
				<a href="javascript:frm.submit();">[등록]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</div>
			</form>
		</div>
	</div>

<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>
</body>
</html>