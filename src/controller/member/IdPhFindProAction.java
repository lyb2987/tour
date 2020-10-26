package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class IdPhFindProAction {
	public String execute(HttpServletRequest request) {
		String mKorName = request.getParameter("mKorName");
		String firstPhNum = request.getParameter("firstPhNum");
		String middlePhNum = request.getParameter("middlePhNum");
		String lastPhNum = request.getParameter("lastPhNum");
		String mPh1 = firstPhNum + "-" + middlePhNum + "-" + lastPhNum;
		System.out.println(mPh1);
		MemberDAO dao = new MemberDAO();
		String mId = dao.idPhFind(mKorName, mPh1);
		request.setAttribute("mId", mId);
		if(mId == null) {
			return "member/idPhFind.jsp";
		}
		return "member/idCheck.jsp";
	}
}
