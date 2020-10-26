<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.qnaView{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.qnaView > h3 {font-size: 30px; text-align:center;}
	
	.qnaBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table {width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {width:30%; font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value {width:70%; margin-left: 15px; height: 40px; font-size: 14px;}
	
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
</style>
</head>
<body>

<!-- header부분 -->
<%@ include file="../frame/header.jsp" %>

	
<!-- 변동부분 -->
	<div class="qnaView" align="center">
		<h3>
			<a href="qnaBoardList.qna">자유 게시판</a>
		</h3>
		<div class="qnaBoard">
			<h2>자유 게시물</h2>
			<table>
				<tr>
					<td class="subject">
						제 목
					</td>
					<td class="value">
						${dto.qnaSubject }
					</td>
				</tr>
				<tr>
					<td class="subject">
						작 성 자
					</td>
					<td class="value">
						${dto.qnaName }
					</td>
				</tr>
				<tr>
					<td class="subject">
						내 용
					</td>
					<td class="value" >
						<div class="content">
							${fn:replace(dto.qnaContent,cn,br) }
						</div>
					</td>
				</tr>
				</table>
			<div class="btn">
			<c:if test="${dto.mId eq logId}">
				<a href="qnaBoardModify.qna?num=${dto.qnaNum }">[수정]</a>&nbsp;&nbsp;
				<a href="qnaBoardDelete.qna?num=${dto.qnaNum }">[삭제]</a>&nbsp;&nbsp;
			</c:if>
				<a href="qnaBoardList.qna">[목록]</a>&nbsp;&nbsp;
			</div>
			<c:if test="">

			</c:if>
		</div>
	</div>
	
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>