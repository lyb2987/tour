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
   
	.contentDiv{width:900px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
	.pwck {margin-top:100px; font-size:18px; text-align: center;}
	.pw {width:200px; height: 30px; font-size: 30px; border: 1px solid #d9d9d9;}
	.btn {text-align: center; font-size: 16px;}
	.btn > input {width: 100px; height: 30px; margin-top: 20px; margin-bottom: 100px;}
</style>
<script type="text/javascript">
</script>
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

	<!-- 비밀번호 변경 페이지 -->
	<div class="contentDiv">
		<div class="pwck">
			 <form action = "memberPwChk.mem" method="post" name="frm" >
				비밀번호 : <input type="password" name = "mPw" id = "pw" class="pw"/>
				<input type="hidden" name="ud" value="${ud}" />
				<div class="btn">
					<input type="submit" value="확인" />
					<input type="button" value="취  소" onclick = "javascript:history.back();" />
				</div>	
			</form>
		</div>

	</div>
</div>
<br />

	<%@ include file="../frame/footer.jsp" %>
</body>
</html>