<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.reviewDelete{width: 1200px; margin-top :60px; margin-bottom :60px;  margin: 0 auto;}
	.reviewDelete > h3 {font-size: 30px; text-align:center;}
	
	.reviewBoard > h2 {font-size: 20px; text-align:center; margin-top: 10px;}
	
	table{width:600px; height: auto; margin: 0 auto; border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	td {border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9;}
	.subject {font-weight: bold; text-align: center; font-size: 16px;}
	.content { height:200px;}
	.value { margin-left: 15px; height: 40px; font-size: 14px;}
	.pass {width:150px; border: 1px solid #d9d9d9;}
	.btn {text-align: center; font-size: 16px; margin-top: 20px; margin-bottom: 20px;}
	
	.img1 {background-color: #ff8;}
	.img2 {background-color: #f0f0f0;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function reviewDelete() {
		var chk = confirm("후기를 삭제하시겠습니까?");
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
	<div class="reviewDelete">
		<h3>
			<a href="reviewBoardDelete.rv">후기 게시판</a>
		</h3>
		<div class="reviewBoard">
			<h2>후기 삭제</h2>
			<form action="reviewBoardDeletePro.rv" method="post" name="deleteForm" id="deleteForm">
				<input type="hidden" name="reviewNum" value="${dto.reviewNum }">
				<table>
					<tr>
						<td class="subject">
							작성자
						</td>
						<td class="value">
							${dto.reviewName }
						</td>
					</tr>
					<tr>
						<td class="subject">
							패키지명
						</td>
						<td class="value">
							${dto.reviewPkgName }
						</td>
					</tr>
					<tr>
						<td class="subject">
							후기 제목
						</td>
						<td class="value">
							${dto.reviewSubject }
						</td>
					</tr>
					<tr>
						<td class="subject">
							별점
						<td class="value">
							<c:forEach begin="1" end="5" varStatus="cnt">
								<c:if test="${score >= cnt.count }">
									<img class="img1" src="../images/starrate.png">
								</c:if>
								<c:if test="${score < cnt.count }">
									<img class="img2" src="../images/starrate.png">
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="subject">
							후기 내용
						</td>
						<td class="value">
							<div class="content">
								${fn:replace(dto.reviewContent,cn,br) }
							</div>
						</td>
					</tr>
					<tr>
						<td class="subject">
							비밀번호
						</td>
						<td class="value">
							<input name="reviewPass" type="password" class="pass">
						</td>
					</tr>
				</table>
				<div class="btn">
					<a onclick="reviewDelete();">[삭제]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>
<!-- foot부분 -->
<%@ include file="../frame/footer.jsp" %>

</body>
</html>