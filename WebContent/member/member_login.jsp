<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.contentDiv	{width:1200px; margin: auto;}
	.loginForm {margin-top: 150px; margin-bottom: 150px ;}
	.loginForm > h1 {text-align: center; font-size: 20px;}
	table {width:500px; height:150px; margin: 0 auto; text-align: center;}
	.btnLogin {width:100%; height:100%;}
	.user {width: 100%; height:100%;}
</style>
</head>
<body>
<%@ include file="../frame/header.jsp" %>

	<div class="contentDiv">
		<div class="loginForm">
			<h1>로그인</h1><br/>
			 <form action="LoginPro.mem" method="post" name="frm">
		        <table border='1'>
		            <colgroup>
		                <col width='25%'/>
		                <col width='50%'/>
		                <col width='25%'/>
		            </colgroup>
		            <tr>
						<td colspan="3">
							자동로그인<input type="checkbox" name="autologin" value="auto" >&nbsp;&nbsp;&nbsp;&nbsp;
							아이디 저장 <input type="checkbox" name="idStore" value="store" <c:if test="${!empty isId }"> checked </c:if> >
						</td>
					</tr>
		            <tr>
		                <td >아이디 </td>
		                <td>
		                	<input type='text' name='mId' class="user" value="${isId}"/>
		                </td>
		                <td rowspan='2'>
		                	<input type="submit" class="btnLogin" value="로그인">
		                </td>
		            </tr>
		            <tr>
		                <td >비밀번호 </td>
		                <td>
		                	<input type='password' name='mPw' class="user"/>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="3">
		                    <a href="idFind.mem">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
		                    <a href="pwFind.mem">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;
		                    <a href="memberAgree.mem">회원가입</a>
		                </td>
		            </tr>
		        </table>
		     </form>
		</div>
	</div>
	
		<%@ include file="../frame/footer.jsp" %>


</body>
</html>