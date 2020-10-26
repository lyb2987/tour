package controller.rsv;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DAO.PackageDAO;
import model.DTO.MemberDTO;
import model.DTO.PackageDTO;

public class ReservationSettingAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String pNum = request.getParameter("pNum");
		
		String mId = (String)session.getAttribute("logId");
		
		MemberDAO memdao = new MemberDAO();
		MemberDTO memdto = memdao.selectMember(mId);
		
		PackageDAO dao = new PackageDAO();
		PackageDTO dto = dao.packageSelectAll(1, 1, pNum).get(0);
		
		request.setAttribute("pkg", dto);
		request.setAttribute("mem", memdto);
		request.setAttribute("personNum", request.getParameter("personNum"));
		request.setAttribute("totalPrice", request.getParameter("totalPrice"));
	}
}
