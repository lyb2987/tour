package controller.review;

import javax.servlet.http.HttpServletRequest;

import model.DAO.QnaBoardDAO;
import model.DAO.ReviewBoardDAO;

public class ReviewReadCountAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		ReviewBoardDAO dao = new ReviewBoardDAO();
		dao.reviewincreaseReadCount(num,"reviewboard");
	}
}
