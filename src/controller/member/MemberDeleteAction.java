package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class MemberDeleteAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		
		MemberDAO dao = new MemberDAO();
		dao.deleteMember(mId);
		
	}
}
