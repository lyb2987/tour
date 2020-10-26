package controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.ReviewBoardDAO;
import model.DTO.ReviewBoardDTO;

public class ReviewBoardListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		ReviewBoardDAO dao = new ReviewBoardDAO();
		List<ReviewBoardDTO> list = dao.reviewSelect(page, limit);
		request.setAttribute("list", list);
		
		int count = dao.reviewCount();
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "reviewBoardList.qna?");
	}
}
