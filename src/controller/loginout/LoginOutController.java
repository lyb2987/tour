package controller.loginout;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOutController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		
		// Î°úÍ∑∏?ù∏ Ïø†ÌÇ§ ?Éù?Ñ±
		if(command.equals("/main/main.main")) {
			CookieAction action =  new CookieAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("main/mainPage.jsp");
			dispatcher.forward(req, resp);
		
		}else if(command.equals("/login/loginPro.main")) {
			LoginProAction action = new LoginProAction();
			action.execute(req, resp);
		
		}else if(command.equals("/login/logOutPro.main")) {
			Cookie cookie = new Cookie("autologin", "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			resp.addCookie(cookie);	// ?ïÑ?àòÏ°∞Í±¥!!! ?Ñ∏?Öò ?†Ñ?óê Ïø†ÌÇ§Î•? ?óÜ?ï†?ïº?ï®!!
			
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("../main/main.main");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
}
