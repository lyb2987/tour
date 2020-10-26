package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberSelectAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember((String)session.getAttribute("logId"));
		
		request.setAttribute("dto", dto);
	}
public void execute2(HttpServletRequest request) {
		
		String mId = request.getParameter("mId");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember(mId);
		
		request.setAttribute("dto", dto);
	}
}
