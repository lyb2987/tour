<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.qnaDelete{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaDelete h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table{width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	.pass {width:150px; border: 1px solid #d9d9d9;}
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function qnaDelete() {
		var chk = confirm("게시물을 삭제하시겠습니까?");
		if(chk == false){
			return ;
		}
		else
			$("#deleteForm").submit();
	}
</script>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
	<div class="qnaDelete">
		<h3>
			<a href="qnaBoardList.qna">자유 게시판</a>
		</h3>
		<div class="qnaBoard">
			<h2>게시물 삭제</h2>
			<form action="qnaBoardDeletePro.qna" method="post" name="deleteForm" id="deleteForm">
				<input type="hidden" name="qnaNum" value="${dto.qnaNum }">
				<table>
					<tr>
						<td class="subject">
							<div align="center"><strong>제 목&nbsp;&nbsp;</strong></div>
						</td>
						<td class="value">
							${dto.qnaSubject }
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center"><strong>내 용</strong></div>
						</td>
						<td class="value">
							<div class="content">
								${fn:replace(dto.qnaContent,cn,br)}
							</div>
						</td>
					</tr>
					<tr>
						<td class="subject">
							<div align="center"><strong>비밀번호</strong></div>
						</td>
						<td class="value">
							<input name="qnaPass" type="password" class="pass">
						</td>
					</tr>
				</table>
				<div class="btn">
					<a onclick="qnaDelete();">[삭제]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>
	
<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>

</body>
</html>