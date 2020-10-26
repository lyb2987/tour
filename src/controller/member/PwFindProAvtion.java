package controller.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class PwFindProAvtion {
	public void execute(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		String mKorName = request.getParameter("mKorName");
		String mId = request.getParameter("mId");
		String firstPhNum = request.getParameter("firstPhNum");
		String middlePhNum = request.getParameter("middlePhNum");
		String lastPhNum = request.getParameter("lastPhNum");
		String mPh1 = firstPhNum + "-" + middlePhNum + "-" + lastPhNum;
		System.out.println(mPh1);
		
		String mPw = dao.pwFind(mKorName, mId, mPh1);
		request.setAttribute("mPw", mPw);
	}
}
