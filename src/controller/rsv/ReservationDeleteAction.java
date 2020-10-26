package controller.rsv;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.PaymentDAO;
import model.DAO.ReservationDAO;
import model.DTO.ReservationAndFPListAndP;

public class ReservationDeleteAction {
	public int execute(HttpServletRequest request) {
		int result = 0;
		
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		
		String rvNum = request.getParameter("rvNum");
		
		ReservationDAO dao = new ReservationDAO();
		
		result = dao.reservationDelete(mId, rvNum);
		
		if(result != 1) {
			return result;
		}

		PaymentDAO paydao = new PaymentDAO();
		result = paydao.deletePayment(rvNum);
		
		if(result != 1) {
			return result;
		}
		
		result = dao.fellowPassengerDelete(rvNum);
		if(result == 0) {
			result = 1;
		}
		
		return result;
		
	}
}
