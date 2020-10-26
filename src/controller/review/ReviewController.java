package controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.qnaBoard.QnaBoardDeleteAction;
import controller.qnaBoard.QnaDitailAction;
import controller.qnaBoard.QnaReadCountAction;

public class ReviewController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		request.setCharacterEncoding("UTF-8");
		
		// 후기 게시판
		if(command.equals("/rv/reviewBoardList.rv")) {
			ReviewBoardListAction action = new ReviewBoardListAction();
			action.execute(request);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBoard/reviewBoard_List.jsp");
			dispatcher.forward(request, response);
		
		// 후기 게시판 글
		}else if(command.equals("/rv/reviewBoardWrite.rv")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBoard/reviewBoard_Write.jsp");
			dispatcher.forward(request, response);
			
		// 후기 게시판 글쓰기	
		}else if(command.equals("/rv/reviewBoardWritePro.rv")) {
			ReviewBoardWriteAction action = new ReviewBoardWriteAction();
			action.execute(request);
			response.sendRedirect("reviewBoardList.rv");
		
		// 후기 게시판 상세보기
		}else if(command.equals("/rv/reviewBoardView.rv")) {
			ReviewDitailAction action1 = new ReviewDitailAction();
			action1.execute(request);
			ReviewReadCountAction action2 = new ReviewReadCountAction();
			action2.execute(request);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBoard/reviewBoard_View.jsp");
			dispatcher.forward(request, response);	
		
		// 후기 게시물 수정
		}else if(command.equals("/rv/reviewBoardModify.rv")) {
			ReviewDitailAction action = new ReviewDitailAction();
			action.execute(request);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBoard/reviewBoard_Modify.jsp");
			dispatcher.forward(request, response);
		
		// 후기 게시물 수정하기
		}else if(command.equals("/rv/reviewBoardModifyPro.rv")) {
			ReviewBoardModifyAction action = new ReviewBoardModifyAction();
			action.execute(request);
			response.sendRedirect("reviewBoardView.rv?num=" + request.getParameter("reviewNum"));
		
		// 후기 게시물 삭제
		}else if(command.equals("/rv/reviewBoardDelete.rv")) {
			ReviewDitailAction action = new ReviewDitailAction();
			action.execute(request);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reviewBoard/reviewBoard_Delete.jsp");
			dispatcher.forward(request, response);
		
		// 후기 게시물 삭제하기
		}else if(command.equals("/rv/reviewBoardDeletePro.rv")) {
			ReviewBoardDeleteAction action = new ReviewBoardDeleteAction();
			action.execute(request);
			response.sendRedirect("reviewBoardList.rv");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
}
