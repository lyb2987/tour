package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberLoginAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		MemberDTO dto = new MemberDTO();
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		dto.setmId(mId);
		dto.setmPw(mPw);
		
		
		MemberDAO dao = new MemberDAO();
		int result = dao.login(dto);
		if(result == 1) {

			String joinOkString = dao.checkJoinOk(dto.getmId());
			if(joinOkString == null) {
				PrintWriter out;
				try {
					out = response.getWriter();
					out.print("<script>");
					out.print("alert('메일 확인이 되지 않았습니다. 메일을 확인해 주세요!');");
					out.print("location.href='../main/main.main'");
					out.print("</script>");
					out.close();
					return ;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			session.setAttribute("logId", dto.getmId());
			String idStore = request.getParameter("idStore");
			String autologin = request.getParameter("autologin");
			System.out.println(autologin);
			if(autologin != null && autologin.equals("auto")) {
				Cookie cookie = new Cookie("autologin", dto.getmId());
				System.out.println(cookie.getValue() +  " / "  + cookie.getName());
				cookie.setPath("/");			
				cookie.setMaxAge(60*60*24*30);	
				response.addCookie(cookie);		
			}else {
				Cookie cookie = new Cookie("autologin", dto.getmId());
				cookie.setPath("/");			
				cookie.setMaxAge(0);			
				response.addCookie(cookie);		
			}
			if(idStore != null && idStore.equals("store")) {
				Cookie cookie = new Cookie("idStore", dto.getmId());
				cookie.setPath("/");			
				cookie.setMaxAge(60*60*24*30);	
				response.addCookie(cookie);		
			}else {
				Cookie cookie = new Cookie("idStore", dto.getmId());
				cookie.setPath("/");			
				cookie.setMaxAge(0);			
				response.addCookie(cookie);	
			}
		}
		else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html charset=UTF-8"); 
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('로그인에 실패하였습니다.');");
				out.print("location.href='../main/main.main'");
				out.print("</script>");
				out.close();
				return ;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			response.sendRedirect("../main/main.main");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
