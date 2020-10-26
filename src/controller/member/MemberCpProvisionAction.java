package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class MemberCpProvisionAction {
	public void execute(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		dao.cpProvision(request.getParameter("mId"));
	}
}