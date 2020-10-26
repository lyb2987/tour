package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ReviewBoardDAO;
import model.DTO.ReviewBoardDTO;

public class ReviewBoardDeleteAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String reviewNum = request.getParameter("reviewNum");
		String reviewPass = request.getParameter("reviewPass");
		
		ReviewBoardDTO dto = new ReviewBoardDTO();
		dto.setmId(mId);
		dto.setReviewNum(Integer.parseInt(reviewNum));
		dto.setReviewPass(reviewPass);
		
		ReviewBoardDAO dao = new ReviewBoardDAO();
		dao.reviewDelete(dto);
	}
}
