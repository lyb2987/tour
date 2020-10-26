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
				cookie.setPath("/");			// ì¿ í‚¤ë¥? ë£¨íŠ¸?— ???¥
				cookie.setMaxAge(60*60*24*30);	// ì¿ í‚¤ë¥? ???¥?•  ê¸°ê°„?„ ?„ ? • (ì´?*ë¶?*?‹œ*?¼ = ?•œ?‹¬)
				response.addCookie(cookie);		// ì¿ í‚¤ë¥? ?´?¼?´?–¸?Š¸?—ê²? ? „?‹¬
			}else {
				Cookie cookie = new Cookie("autologin", mId);
				cookie.setPath("/");			// ì¿ í‚¤ë¥? ë£¨íŠ¸?— ???¥
				cookie.setMaxAge(0);			// ì¿ í‚¤ ?ŒŒ?¼?„ ?‚­? œ
				response.addCookie(cookie);		// ì¿ í‚¤ë¥? ?´?¼?´?–¸?Š¸?—ê²? ? „?‹¬
			}
			if(idStore != null && idStore.equals("store")) {
				Cookie cookie = new Cookie("idStore", mId);
				cookie.setPath("/");			// ì¿ í‚¤ë¥? ë£¨íŠ¸?— ???¥
				cookie.setMaxAge(60*60*24*30);	// ì¿ í‚¤ë¥? ???¥?•  ê¸°ê°„?„ ?„ ? • (ì´?*ë¶?*?‹œ*?¼ = ?•œ?‹¬)
				response.addCookie(cookie);		// ì¿ í‚¤ë¥? ?´?¼?´?–¸?Š¸?—ê²? ? „?‹¬
			}else {
				Cookie cookie = new Cookie("idStore", mId);
				cookie.setPath("/");			// ì¿ í‚¤ë¥? ë£¨íŠ¸?— ???¥
				cookie.setMaxAge(0);			// ì¿ í‚¤ ?ŒŒ?¼?„ ?‚­? œ
				response.addCookie(cookie);		// ì¿ í‚¤ë¥? ?´?¼?´?–¸?Š¸?—ê²? ? „?‹¬
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
					out.print("alert('ë¹„ë?ë²ˆí˜¸ê°? ??? ¸?Šµ?‹ˆ?‹¤');");
				}else if(i == -1) {
					out.print("alert('?•„?´?””ê°? ??? ¸?Šµ?‹ˆ?‹¤');");
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
