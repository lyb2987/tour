package controller.faqBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqBoardListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		FaqBoardDAO dao = new FaqBoardDAO();
		List<FaqBoardDTO> list = dao.faqSelectAll(page, limit);
		request.setAttribute("list", list);
		
		int count = dao.faqCount();
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "faqBoardList.faq?");
	}
}
