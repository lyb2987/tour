package controller.member;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import controller.MailAction;
import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberOkAction {
	public void execute(HttpServletRequest request) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String mPassPortNum = request.getParameter("mPassPortNum");
		String mPassPortEnd = request.getParameter("mPassPortEnd");
		String mLastName = request.getParameter("mLastName");
		String mFirstName = request.getParameter("mFirstName");
		String mKorName = request.getParameter("mKorName");
		String mBirth = request.getParameter("mBirth");
		String mGender = request.getParameter("mGender");
		String mEmail = request.getParameter("mEmail");
		String mAddr = request.getParameter("mAddr");
		String mPh1 = request.getParameter("mPh1");
		String mPh2 = request.getParameter("mPh2");
		String [] chk1 = request.getParameterValues("chk1");
		String [] chk2 = request.getParameterValues("chk2");
		String [] chk3 = request.getParameterValues("chk3");
		
		String mInsert1 ="";
		for(String s : chk1) {
			mInsert1 += s + "`";
		}
		
		String mInsert2 ="";
		for(String s : chk2) {
			mInsert2 += s + "`";
		}
		
		String mInsert3 ="";
		for(String s : chk3) {
			mInsert3 += s + "`";
		}
		
		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		Date date2 = null;
		try {
			date1 = dt1.parse(mPassPortEnd);
			date2 = dt1.parse(mBirth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp userPassPortEnd = new Timestamp(date1.getTime());
		Timestamp userBirth = new Timestamp(date2.getTime());
		
		MemberDTO dto = new MemberDTO();
		dto.setmId(mId);
		dto.setmPw(mPw);
		dto.setmPassPortNum(mPassPortNum);
		dto.setmPassPortEnd(userPassPortEnd);
		dto.setmLastName(mLastName);
		dto.setmFirstName(mFirstName);
		dto.setmKorName(mKorName);
		dto.setmBirth(userBirth);
		dto.setmGender(mGender);
		dto.setmEmail(mEmail);
		dto.setmAddr(mAddr);
		dto.setmPh1(mPh1);
		dto.setmPh2(mPh2);
		dto.setmInsert1(mInsert1);
		dto.setmInsert2(mInsert2);
		dto.setmInsert3(mInsert3);
		dto.setmJoinOk("none");
		
		MemberDAO dao = new MemberDAO();
		Integer i = dao.memberJoinInsert(dto);
		if(i != null) {
			MailAction mail = new MailAction();
			mail.sendMail(dto);
		}
	}
}
