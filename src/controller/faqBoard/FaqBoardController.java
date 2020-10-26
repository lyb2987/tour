package controller.faqBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaqBoardController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		
		// FAQ 寃뚯떆�뙋
		if(command.equals("/faq/faqBoardList.faq")) {
			FaqBoardListAction action = new FaqBoardListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/faqBoard/faqBoard_List.jsp");
			dispatcher.forward(req, resp);
		// FAQ 寃뚯떆�뙋 湲�
		}else if(command.equals("/faq/faqBoardWrite.faq")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/faqBoard/faqBoard_Write.jsp");
			dispatcher.forward(req, resp);
		
		// FAQ 寃뚯떆�뙋 湲��옉�꽦
		}else if(command.equals("/faq/faqBoardWritePro.faq")) {
			FaqBoardWriteAction action = new FaqBoardWriteAction();
			action.execute(req);
			resp.sendRedirect("faqBoardList.faq");
		
		// �뙣�궎吏� FAQ
		}else if(command.equals("/faq/faqPackageList.faq")) {
			FaqDetailAction action = new FaqDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/faqBoard/faqBoard_List.jsp");
			dispatcher.forward(req, resp);
		// �씪諛� FAQ
		}else if(command.equals("/faq/faqCommonList.faq")) {
			FaqDetailAction action = new FaqDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/faqBoard/faqBoard_List.jsp");
			dispatcher.forward(req, resp);
		
		// �삁留�/寃곗젣 FAQ
		}else if(command.equals("/faq/faqPaymentList.faq")) {
			FaqDetailAction action = new FaqDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/faqBoard/faqBoard_List.jsp");
			dispatcher.forward(req, resp);
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
