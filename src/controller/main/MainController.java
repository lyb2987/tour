package controller.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		
		if(command.equals("/main/main.main")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/main/mainPage.jsp");
			dispatcher.forward(req, resp);
		}
		else if(command.equals("/main/testPage.main")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/reservation/test.jsp");
			dispatcher.forward(req, resp);
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
