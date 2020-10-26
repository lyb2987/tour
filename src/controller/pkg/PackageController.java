package controller.pkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PackageController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		req.setCharacterEncoding("UTF-8");
		
		// 패키지 게시판 이동
		if(command.equals("/pkg/packgaeBoard.pkg")) {
			PackageListAction action = new PackageListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_list.jsp");
			dispatcher.forward(req, resp);
		}
		// 패키지 등록 폼 이동
		else if(command.equals("/pkg/pkgWriteForm.pkg")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_write.jsp");
			dispatcher.forward(req, resp);
		}
		// 패키지 등록
		else if(command.equals("/pkg/pkgWritePro.pkg")) {
			PackageWriteProAction action = new PackageWriteProAction();
			action.execute(req);
			resp.sendRedirect("../pkg/packgaeBoard.pkg");
		}
		// 패키지 상세 조회
		else if(command.equals("/pkg/pkgDetail.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_detail.jsp");
			dispatcher.forward(req, resp);
		}
		// 패키지 수정 폼 이동
		else if(command.equals("/pkg/packageModify.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_modify.jsp");
			dispatcher.forward(req, resp);
		}
		// 패키지 수정 
		else if(command.equals("/pkg/pkgModifyPro.pkg")) {
			PackageModifyAction action = new PackageModifyAction();
			int result = action.execute(req);
			if(result == 1){
				String pNum = req.getParameter("pNum");
				resp.sendRedirect("pkgDetail.pkg?pNum="+pNum);
			}
			else {
				resp.sendRedirect("packgaeBoard.pkg");
			}
		}
		// 패키지 삭제 
		else if(command.equals("/pkg/packageDelete.pkg")) {
			PackageDeleteAction action = new PackageDeleteAction();
			int result = action.execute(req);
			if(result == 1){
				resp.sendRedirect("packgaeBoard.pkg");
			}
			else {
				String pNum = req.getParameter("pNum");
				resp.sendRedirect("pkgDetail.pkg?pNum="+pNum);
			}
		}
		// 예약 1 : 패키지 약관 동의 
		else if(command.equals("/pkg/packgeAgree.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_agree.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 2 : 패키지 인원 선택 
		else if(command.equals("/pkg/packageNoP.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			int price = action.execute2(req);
			req.setAttribute("totalPrice", price);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_fp.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 2-1 : 패키지 인원 Up 
		else if(command.equals("/pkg/packagePersonNumUp.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			int price = action.execute2(req);
			int personNum = Integer.parseInt(req.getParameter("personNum"))+1;
			int totalPrice = personNum * price;
			req.setAttribute("personNumber", personNum);
			req.setAttribute("totalPrice", totalPrice);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_fp.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 2-2 : 패키지 인원 Down
		else if(command.equals("/pkg/packagePersonNumDown.pkg")) {
			PackageDetailAction action = new PackageDetailAction();
			int price = action.execute2(req);
			int personNum = Integer.parseInt(req.getParameter("personNum"))-1;
			int totalPrice = personNum * price;
			req.setAttribute("personNumber", personNum);
			req.setAttribute("totalPrice", totalPrice);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_fp.jsp");
			dispatcher.forward(req, resp);
		}
		// 패키지 지역 선택 
		else if(command.equals("/pkg/packageBoardSearch.pkg")) {
			PackageSearchListAction action = new PackageSearchListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_list.jsp");
			dispatcher.forward(req, resp);
		
		// 메인 검색 
		}else if(command.equals("/pkg/packageBoardSearchMain.pkg")) {
			PackageMainSearchListAction action = new PackageMainSearchListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/pkg/pkg_board_list.jsp");
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
