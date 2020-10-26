package controller.rsv;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ReservationDAO;
import model.DTO.ReservationAndFPListAndP;

public class ReservationListAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		
		ReservationDAO dao = new ReservationDAO();
		List<ReservationAndFPListAndP> list = dao.getReservationAndFPList(mId);
		
		request.setAttribute("rfpList", list);
	}
}
