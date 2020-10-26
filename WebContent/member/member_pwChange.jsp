<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.page{width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.MYPAGE{width:1200px; margin: 0 auto;}
	.MYPAGE h3{font-size: 30px;}
	
	.list_tab{ overflow: hidden; margin-top: 20px; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9}
	.list_tab li{float: left; width:20%;height: 50px;line-height:50px; text-align: center; font-size: 20px;}
	.centerDiv > form > input {border: 1px solid #d9d9d9; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#submit").prop('disabled', true);
	});
	
	function pwCheck(){
		var changemPw = $("#changemPw").val();
		var checkmPw = $("#checkmPw").val();
		
		if(checkmPw == changemPw){
			$("#chkval").val("1");
			$("#submit").prop('disabled', false);
			alert("비밀번호 변경버튼이 활성화 되었습니다.");
		}
	}
	
</script>
<style type="text/css">
   .contentDiv{width: 1200px; margin-top :60px; margin: 0 auto;}
</style>
</head>
<body>
<%@ include file="../frame/header.jsp" %>

<!-- 마이페이지 부분 -->
<div class="page">
	<div class="MYPAGE" >
		<h3>마이페이지</h3>
		<div class="MYPAGE_wrap">
	    	<ul class="list_tab">
	        	<li class="on">
	            	<span class="txt_link">${logId}님</span>
				</li>
				<li class="on">
				   <a href="memberView.mem">
				      <span class="txt_link">내 정보 조회</span>
				   </a>
				</li>
				<li>
				   <a href="memberCheckPwForm.mem?ud=u">
				      <span class="txt_link">내 정보 수정</span>
				   </a>
				</li>
				<li>
				   <a href="memberChangePwForm.mem">
				      <span class="txt_link">비밀번호 변경</span>
				   </a>
				</li>
				<li>
				   <a href="memberCheckPwForm.mem?ud=d">
				      <span class="txt_link">회원 탈퇴</span>
				   </a>
				</li>
			</ul>
		</div>
	</div>

	<div class="contentDiv"  style="">
		<div class="leftAndCenterDiv">
			<div class="centerDiv" align='center'>
				<form action="memberPwChange.mem" method="post" name="frm">
					비밀번호 : <input type="password" name = "mPw" id = "mPw" /><br />
					<br />
					변경할 비밀번호 : <input type="password" name = "changemPw" id = "changemPw" /><br />
					비밀번호 확인 : <input type="password" name = "checkmPw" id = "checkmPw" /> <input type="button" name="checkPws" onclick="pwCheck();" value="비밀번호 확인"><br />
					<br />
					<input type="hidden" value="0" name="chkval" id="chkval">
					<input type="submit" value="변경" name="submit" id="submit"/>
					<input type="button" value="취  소" onclick = "javascript:history.back();" />	
				</form>
			</div>
			<div id="leftMarginDiv">
				&nbsp;
			</div>
		</div>
		
		<div id="rightMarginDiv">
			&nbsp;
		</div>
	</div>
</div>
<br />

	<%@ include file="../frame/footer.jsp" %>


</body>
</html>