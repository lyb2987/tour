<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();		
	}
</script>
<style type="text/css">
	.qnaModify {width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaModify > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.value { height: 40px; font-size: 14px;}
	.value > input {margin-left: 15px;  border: 1px solid #d9d9d9;}
	.value > textarea {margin-left: 15px; border: 1px solid #d9d9d9;}
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function qnaModify() {
		var chk = confirm("게시물를 수정하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			$("#modifyform").submit();
	}
</script>
</head>
<body>
<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

	
<!-- 변동부분 -->
	<div class="qnaModify" align="center">
		<h3>
			<a href="qnaBoardList.qna">자유 게시판</a>
		</h3>
		<div class="qnaBoard">
			<h2>게시물 수정</h2>
			<form action="qnaBoardModifyPro.qna" method="post" name="modifyform" id="modifyform">
			<input type="hidden" name="qnaNum" value="${dto.qnaNum }">
				<table>
					<tr>
						<td class="subject">
							제 목
						</td>
						<td class="value">
							<input name="qnaSubject" maxlength="100" value="${dto.qnaSubject }">
						</td>
					</tr>
					<tr>
						<td class="subject">
							내 용
						</td>
						<td class="value">
							<textarea name="qnaContent" rows="15" cols="67">${dto.qnaContent }</textarea>
						</td>
					</tr>
					<tr>
						<td class="subject">
							비밀번호
						</td>
						<td class="value">
							<input name="qnaPass" type="password">
						</td>
					</tr>
					</table>
				<div class="btn">
					<a onclick="qnaModify();">[수정]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</div>
			</form>
		</div>
	</div>
	
<!-- foot부분 -->
		<%@ include file="../frame/footer.jsp" %>

</body>
</html>