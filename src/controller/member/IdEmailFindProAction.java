package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class IdEmailFindProAction {
	public String execute(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		String mKorName = request.getParameter("mKorName");
		String email = request.getParameter("email");
		String emailChoice = request.getParameter("emailChoice");
		String mEmail = email + "@" + emailChoice;
		System.out.println(mEmail);
		
		String mId = dao.idEmailFind(mKorName, mEmail);
		request.setAttribute("mId", mId);
		if(mId == null) {
			return "member/idEmailFind.jsp";
		}
		return "member/idCheck.jsp";
	}
}
