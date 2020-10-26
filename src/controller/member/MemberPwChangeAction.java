package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class MemberPwChangeAction {
	public int execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String mPw = request.getParameter("mPw");
		String changePw = request.getParameter("changemPw");
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.checkPw(mId, mPw);
		if(result == 0) {
			result = -1;			// 비밀번호 틀림
			return result;
		}
		else {
			result = dao.changePw(mId, mPw, changePw);
		}
		
		return result;
	}
}

