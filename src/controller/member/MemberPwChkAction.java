package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class MemberPwChkAction {
	public int execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String mPw = request.getParameter("mPw");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.chkMemberPw(mId, mPw);
		
		return result;
	}
}
