package controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.selectMemberList(page, limit);
		
		int count = dao.selectMemberCount();
			
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		
		PageAction action = new PageAction();
		action.page(request, count, limit, limitPage, page, "qnaList.qna?");
		
	}
}