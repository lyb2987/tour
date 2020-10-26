package controller.qnaBoard;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnaBoardController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		
		// QnA 게시판
		if(command.equals("/qna/qnaBoardList.qna")) {
			QnaBoardListAction action = new QnaBoardListAction();
			action.execute(req);
			RequestDispatcher dispacher = req.getRequestDispatcher("/qnaBoard/qnaBoard_List.jsp");
			dispacher.forward(req, resp);
		
		// QnA 게시판 글
		}else if(command.equals("/qna/qnaBoardWrite.qna")) {
			RequestDispatcher dispacher = req.getRequestDispatcher("/qnaBoard/qnaBoard_Write.jsp");
			dispacher.forward(req, resp);
		
		// QnA 게시판 글쓰기
		}else if(command.equals("/qna/qnaBoardWritePro.qna")) {
			QnaBoardWriteProAction action = new QnaBoardWriteProAction();
			action.execute(req);
			resp.sendRedirect("qnaBoardList.qna");
			
		// QnA 상세보기
		}else if(command.equals("/qna/qnaBoardView.qna")) {
			QnaDitailAction action1 = new QnaDitailAction();
			action1.execute(req);
			QnaReadCountAction action2 = new QnaReadCountAction();
			action2.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/qnaBoard/qnaBoard_View.jsp");
			dispatcher.forward(req, resp);
		
		// QnA 게시물 수정
		}else if(command.equals("/qna/qnaBoardModify.qna")) {
			QnaDitailAction action = new QnaDitailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/qnaBoard/qnaBoard_Modify.jsp");
			dispatcher.forward(req, resp);
		
		// QnA 게시물 수정하기
		}else if(command.equals("/qna/qnaBoardModifyPro.qna")) {
			QnaBoardModifyAction action = new QnaBoardModifyAction();
			action.execute(req);
			resp.sendRedirect("qnaBoardView.qna?num=" + req.getParameter("qnaNum"));
			
		// QnA 게시물 삭제
		}else if(command.equals("/qna/qnaBoardDelete.qna")) {
			QnaDitailAction action = new QnaDitailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/qnaBoard/qnaBoard_Delete.jsp");
			dispatcher.forward(req, resp);
		
		// QnA 개시물 삭제하기
		}else if(command.equals("/qna/qnaBoardDeletePro.qna")) {
			QnaBoardDeleteAction action = new QnaBoardDeleteAction();
			action.execute(req);
			resp.sendRedirect("qnaBoardList.qna");
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
