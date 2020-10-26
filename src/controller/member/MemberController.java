package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.loginout.CookieAction;

public class MemberController  extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html charset=UTF-8"); 
		
		if(command.equals("/member/memberLogin.mem")) {
			CookieAction action = new CookieAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_login.jsp");
			dispatcher.forward(req, resp);
		}
		else if(command.equals("/member/LoginPro.mem")) {
			MemberLoginAction action = new MemberLoginAction();
			action.execute(req, resp);
		}
		else if(command.equals("/member/LogoutPro.mem")) {
			Cookie cookie = new Cookie("autologin", "");	
			cookie.setPath("/");								
			cookie.setMaxAge(0);						
			resp.addCookie(cookie);	
			
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("../main/main.main");

		// 회원가입 전 약관동의
		}else if(command.equals("/member/memberAgree.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_joinAgree.jsp");
			dispatcher.forward(req, resp);
		
		}
		// 회원가입 화면
		else if(command.equals("/member/memberForm.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_form.jsp");
			dispatcher.forward(req, resp);
		}
		// 회원가입  완료
		else if(command.equals("/member/memberOk.mem")) {
			MemberOkAction action = new MemberOkAction();
			action.execute(req);
			resp.sendRedirect("../main/main.main");
		}
		// 아이디 중복체크
		else if(command.equals("/member/memberConfirm.mem")) {
			MemberConfirmAction action = new MemberConfirmAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_confirm.jsp");
			dispatcher.forward(req, resp);
		}
		// 메일 확인 여부
		else if(command.equals("/member/memberJoinOk.mem")) {
			MemberJoinOkAction action = new MemberJoinOkAction();
			RequestDispatcher dispatcher = req.getRequestDispatcher(action.execute(req));
			dispatcher.forward(req, resp);
		}
		// 아이디 찾기
		else if(command.equals("/member/idFind.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_idFind.jsp");
			dispatcher.forward(req, resp);
		}
		// 휴대폰으로 아이디 찾기
		else if(command.equals("/member/idPhFind.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_idPhFind.jsp");
			dispatcher.forward(req, resp);
		}
		// 이메밀로 아이디 찾기
		else if(command.equals("/member/idEmailFind.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_idEmailFind.jsp");
			dispatcher.forward(req, resp);		
		}
		// 핸드폰으로 아이디 확인 화면
		else if(command.equals("/member/idPhCheck.mem")) {
			IdPhFindProAction action1 = new IdPhFindProAction();
			action1.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_idCheck.jsp");
			dispatcher.forward(req, resp);
		}
		// 이메잉로 아이디 확인 화면
		else if(command.equals("/member/idEmailCheck.mem")) {
			IdEmailFindProAction action2 = new IdEmailFindProAction();
			action2.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_idCheck.jsp");
			dispatcher.forward(req, resp);
		}
		// 비밀번호 찾기 동작
		else if(command.equals("/member/pwFind.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_pwFind.jsp");
			dispatcher.forward(req, resp);
		}
		// 비밀번호 확인 화면
		else if(command.equals("/member/pwFindPro.mem")) {
			PwFindProAvtion action = new PwFindProAvtion();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_pwCheck.jsp");
			dispatcher.forward(req, resp);
		}
		// 마이 페이지
		else if(command.equals("/member/MyPage.mem")) {
			MemberSelectAction action = new MemberSelectAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_myPage.jsp");
			dispatcher.forward(req, resp);
		}
		// 마이페이지 - 내 정보 
		else if(command.equals("/member/memberView.mem")) {
			MemberSelectAction action = new MemberSelectAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_myInfo.jsp");
			dispatcher.forward(req, resp);
		}
		// 회원 pw 체크 페이지로 이동 (수정 또는 탈퇴 시) 
		else if(command.equals("/member/memberCheckPwForm.mem")) {
			String ud = req.getParameter("ud");
			req.setAttribute("ud", ud);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/member/member_pwChk.jsp");
			dispatcher.forward(req, resp);
		}
		// 회원 pw 체크 후 회원 정보 수정 페이지로 이동 또는 회원 탈퇴 
		else if(command.equals("/member/memberPwChk.mem")) {
			MemberPwChkAction action = new MemberPwChkAction();
			int result = action.execute(req);
			String ud = req.getParameter("ud");
			// 회원 정보 변경 이용시
			if(ud.equals("u")) {
				if(result == 1) {
					MemberSelectAction action1 = new MemberSelectAction();
					action1.execute(req);
					RequestDispatcher dispatcher = req.getRequestDispatcher("../member/member_modify.jsp");
					dispatcher.forward(req, resp);
				}
				else {
					resp.sendRedirect("memberCheckPwForm.mem?ud=u");
				}
			}
			// 탈퇴 이용시
			else if(ud.equals("d")){
				if(result == 1) {
					MemberDeleteAction action1 = new MemberDeleteAction();
					action1.execute(req);
					HttpSession session = req.getSession();
					session.invalidate();
					resp.sendRedirect("../main/main.main");
				}
				else {
					resp.sendRedirect("memberCheckPwForm.mem?ud=d");
				}
			}
			
		}
		// 회원 정보 수정
		else if(command.equals("/member/memberInfoModifyPro.mem")) {
			MemberInfoModifyAction action = new MemberInfoModifyAction();
			action.execute(req);
			resp.sendRedirect("memberView.mem");
		
		// 회원리스트 불러오기
		}else if(command.equals("/member/memberList.mem")) {
			MemberListAction action = new MemberListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("../member/member_list.jsp");
			dispatcher.forward(req, resp);
		
		// 회원정보 조회
		}else if(command.equals("/member/memberView.mem")) {
			MemberSelectAction action = new MemberSelectAction();
			action.execute2(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("../member/member_myInfo.jsp");
			dispatcher.forward(req, resp);
		
		// 쿠폰 지급
		}else if(command.equals("/member/memberCpProvision.mem")) {
			MemberCpProvisionAction action = new MemberCpProvisionAction();
			action.execute(req);
			String mId = req.getParameter("mId");
			resp.sendRedirect("memberView.mem?mId="+mId);
		
		// 비밀번호 변경페이지 이동 
		}else if(command.equals("/member/memberChangePwForm.mem")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("../member/member_pwChange.jsp");
			dispatcher.forward(req, resp);
		
		// 비밀번호 변경	
		}
		else if(command.equals("/member/memberPwChange.mem")) {
			MemberPwChangeAction action = new MemberPwChangeAction();
			int result = action.execute(req);
			PrintWriter out = resp.getWriter();
			if(result == -1 ) { 	// 비밀번호 틀림
				out.print("<script>");
				out.print("alert('비밀번호를 틀렸습니다.');");
				out.print("location.href='memberChangePwForm.mem'");
				out.print("</script>");
				out.close();
			}
			else if(result == 0) {	// 업데이트 실패
				out.print("<script>");
				out.print("alert('비밀번호 변경에 실패했습니다. 다시 시도해 주세요.');");
				out.print("</script>");
				out.close();
			}
			else if(result == 1) {	// 성공
				out.print("<script>");
				out.print("alert('비밀번호를 변경하였습니다.');");
				out.print("location.href='MyPage.mem'");
				out.print("</script>");
				out.close();
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
}
