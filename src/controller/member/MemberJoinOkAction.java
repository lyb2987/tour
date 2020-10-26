package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;


public class MemberJoinOkAction {
	public String execute(HttpServletRequest request) {
		String path = null;
		String email = request.getParameter("mEmail");
		String joinOk = request.getParameter("joinOk");
		MemberDAO dao = new MemberDAO();
		Integer result = dao.joinOkUpdate(email, joinOk);
		if(result == 1) {
			path = "/member/member_joinSuccess.jsp";
		} else {
			path = "/member/member_joinFail.jsp";
		}
		return path;
	}
}
