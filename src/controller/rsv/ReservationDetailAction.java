package controller.rsv;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DAO.ReservationDAO;
import model.DTO.MemberDTO;
import model.DTO.ReservationAndFPListAndP;

public class ReservationDetailAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		
		MemberDAO memdao = new MemberDAO();
		MemberDTO memdto = memdao.selectMember(mId);
		
		String rvNum = request.getParameter("rvNum");
		
		ReservationDAO dao = new ReservationDAO();
		List<ReservationAndFPListAndP> list = dao.getReservationAndFPDetail(mId, rvNum);
		
		request.setAttribute("mem", memdto);
		request.setAttribute("rfpList", list);
	}
}
