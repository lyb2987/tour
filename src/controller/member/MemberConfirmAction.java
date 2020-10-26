package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class MemberConfirmAction {
	public void execute(HttpServletRequest request) {
		String mId = request.getParameter("mId");
		MemberDAO dao = new MemberDAO();
		String confirmId = dao.memberConfirm(mId);
		request.setAttribute("mId", mId);
		request.setAttribute("confirmId", confirmId);
	}
}
