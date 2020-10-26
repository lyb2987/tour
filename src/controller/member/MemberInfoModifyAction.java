package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberInfoModifyAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String mPw = request.getParameter("mPw");
		String mPassPortNum = request.getParameter("mPassPortNum");
		String mEmail = request.getParameter("mEmail") ;
		String mAddr = request.getParameter("mAddr") ;
		String mPh1 = request.getParameter("mPh1") ;
		String mPh2 = request.getParameter("mPh2") ;
		
		
		MemberDTO  dto = new MemberDTO();
		dto.setmAddr(mAddr);
		dto.setmPassPortNum(mPassPortNum);
		dto.setmEmail(mEmail);
		dto.setmPh1(mPh1);
		dto.setmId(mId);
		dto.setmPh2(mPh2);
		dto.setmPw(mPw);
		
		
		MemberDAO dao = new MemberDAO();
		dao.memberUpdate(dto);
		
	}
}
