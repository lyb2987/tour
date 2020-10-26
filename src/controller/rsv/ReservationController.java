package controller.rsv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.pkg.PackageListAction;

public class ReservationController  extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		req.setCharacterEncoding("UTF-8");
		
		// 예약 3. 예약 확인 및 동승자 정보 입력 
		if(command.equals("/rsv/reservationForm.rsv")) {
			ReservationSettingAction action = new ReservationSettingAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/reservation/rsv_form.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 4. 예약 처리(예약 테이블, 동승자 테이블 Insert)
		else if(command.equals("/rsv/reservationPro.rsv")) {
			ReservationProAction action = new ReservationProAction();
			int result = action.execute(req);
			if(result==1) {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/reservation/rsv_check.jsp");
				dispatcher.forward(req, resp);
			}
			else {
				resp.sendRedirect("../main/main.main");
			}
		}
		// my 예약 확인 
		else if(command.equals("/rsv/myReservation.rsv")) {
			ReservationListAction action = new ReservationListAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/reservation/rsv_myReserve.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 상세 조회 
		else if(command.equals("/rsv/reservationDetail.rsv")) {
			ReservationDetailAction action = new ReservationDetailAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/reservation/rsv_detail.jsp");
			dispatcher.forward(req, resp);
		}
		// 예약 취소 reservationCancle
		else if(command.equals("/rsv/reservationCancle.rsv")) {
			int result = 0;
			ReservationDeleteAction action = new ReservationDeleteAction();
			result = action.execute(req);
			if(result == 1){
				resp.sendRedirect("myReservation.rsv");
			}
			else {
				String rvNum = req.getParameter("rvNum");
				resp.sendRedirect("reservationDetail.rsv?rvNum="+rvNum);
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
