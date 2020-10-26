package controller.pay;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PaymentDAO;

public class PaymentAction {
	public int execute(HttpServletRequest request) {
		int result = 0;
		PaymentDAO dao = new PaymentDAO();
		String rvNum = request.getParameter("rvNum");
		result = dao.updatePaymentStatus(rvNum);
		
		return result;
	}
}
