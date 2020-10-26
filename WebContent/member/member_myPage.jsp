<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
   .MYPAGE{width:1200px;  margin-top :60px; margin-bottom: 60px; margin: 0 auto;}
   .MYPAGE h3{font-size: 30px;}
   .MYPAGE_wrap { margin-bottom: 400px;}
   
   .list_tab{ overflow: hidden; margin-top: 20px;border-top: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9}
   .list_tab li{float: left; width:20%;height: 50px;line-height:50px; text-align: center; font-size: 20px;}
</style>
</head>
<body>

<!-- header부분 -->

    	<%@ include file="../frame/header.jsp" %>

<!-- 변동부분 -->
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
<!-- foot부분 -->

		<%@ include file="../frame/footer.jsp" %>

</body>
</html>