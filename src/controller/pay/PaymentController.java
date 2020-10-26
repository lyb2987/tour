package controller.pay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentController extends HttpServlet implements Servlet{

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		req.setCharacterEncoding("UTF-8");
		// 결제창 이동 및 할인 적용
		if(command.equals("/pay/paymentForm.pay")) {
			// 결제, 예약, 회원, 패키지 정보 모두 필요
			PaymentSettingAction action = new PaymentSettingAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/payment/pay_form.jsp");
			dispatcher.forward(req, resp);
		}
		// 결제 수단 작성 단계  (카드, 무통장 등등 결제 방식에 따른 폼 보여주면서 결제 마무리) payment.pay
		else if(command.equals("/pay/paymentPayMeans.pay")) {
			PaymentMeansAction action = new PaymentMeansAction();
			int result = action.execute(req);
			if(result == 1) {
				PaymentSettingAction action1 = new PaymentSettingAction();
				action1.execute(req);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/payment/pay_payment.jsp");
				dispatcher.forward(req, resp);
			}
			else {
				String rvNum = req.getParameter("rvNum");
				resp.sendRedirect("paymentForm.pay?rvNum="+rvNum);
			}
		}
		// 결제
		else if(command.equals("/pay/payment.pay")) {
			int result = 0;
			PaymentAction action = new PaymentAction();
			result = action.execute(req);
			PaymentSettingAction action1 = new PaymentSettingAction();
			result = action1.execute2(req);
			if(result == 1) {
				RequestDispatcher dispatcher = req.getRequestDispatcher("/payment/pay_check.jsp");
				dispatcher.forward(req, resp);
			}
			else {
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html charset=UTF-8"); 
				PrintWriter out = resp.getWriter();
				out.print("<script>");
				out.print("alert('결제에 실패하였습니다.');");
				out.print("location.href='../rsv/myReservation.rsv'");
				out.print("</script>");
				out.close();
			}
		}
		// 결제 상태 조회 checkPayment.pay
		else if(command.equals("/pay/checkPayment.pay")) {
			// 결제, 예약, 회원, 패키지 정보 모두 필요
			PaymentSettingAction action = new PaymentSettingAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/payment/pay_check2.jsp");
			dispatcher.forward(req, resp);
		
		// 쿠폰선택
		}else if(command.equals("/pay/payCouponSelect.pay")) {
			PaymentSettingAction action = new PaymentSettingAction();
			action.execute(req);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/payment/pay_couponList.jsp");
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
