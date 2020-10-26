package controller.loginout;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class LoginProAction {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		MemberDAO dao = new MemberDAO();
		Integer i = dao.memberLoginCk(mId, mPw);
		HttpSession session = request.getSession();
		if(i >= 1) {
			session.setAttribute("logId", mId);
			String idStore = request.getParameter("idStore");
			String autologin = request.getParameter("autologin");
			if(autologin != null && autologin.equals("auto")) {
				Cookie cookie = new Cookie("autolohin", mId);
				cookie.setPath("/");			// 쿠키�? 루트?�� ???��
				cookie.setMaxAge(60*60*24*30);	// 쿠키�? ???��?�� 기간?�� ?��?�� (�?*�?*?��*?�� = ?��?��)
				response.addCookie(cookie);		// 쿠키�? ?��?��?��?��?��?���? ?��?��
			}else {
				Cookie cookie = new Cookie("autologin", mId);
				cookie.setPath("/");			// 쿠키�? 루트?�� ???��
				cookie.setMaxAge(0);			// 쿠키 ?��?��?�� ?��?��
				response.addCookie(cookie);		// 쿠키�? ?��?��?��?��?��?���? ?��?��
			}
			if(idStore != null && idStore.equals("store")) {
				Cookie cookie = new Cookie("idStore", mId);
				cookie.setPath("/");			// 쿠키�? 루트?�� ???��
				cookie.setMaxAge(60*60*24*30);	// 쿠키�? ???��?�� 기간?�� ?��?�� (�?*�?*?��*?�� = ?��?��)
				response.addCookie(cookie);		// 쿠키�? ?��?��?��?��?��?���? ?��?��
			}else {
				Cookie cookie = new Cookie("idStore", mId);
				cookie.setPath("/");			// 쿠키�? 루트?�� ???��
				cookie.setMaxAge(0);			// 쿠키 ?��?��?�� ?��?��
				response.addCookie(cookie);		// 쿠키�? ?��?��?��?��?��?���? ?��?��
			}
			try {
				response.sendRedirect("../main.main");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UFT-8");
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				if(i == 0) {
					out.print("alert('비�?번호�? ???��?��?��?��');");
				}else if(i == -1) {
					out.print("alert('?��?��?���? ???��?��?��?��');");
				}
				out.print("location.href='../main.main'");
				out.print("</script>");
				out.close();
				return;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
