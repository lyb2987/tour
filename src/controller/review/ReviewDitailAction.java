package controller.review;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ReviewBoardDAO;
import model.DTO.ReviewBoardDTO;

public class ReviewDitailAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		ReviewBoardDAO dao = new ReviewBoardDAO();
		ReviewBoardDTO dto = dao.ReviewSelectAll(num);
		request.setAttribute("dto", dto);
		
		Integer.parseInt(dto.getReviewScore());
		request.setAttribute("score", Integer.parseInt(dto.getReviewScore()));
		
	}
}
