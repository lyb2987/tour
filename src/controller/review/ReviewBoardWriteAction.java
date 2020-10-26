package controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ReviewBoardDAO;
import model.DTO.ReviewBoardDTO;

public class ReviewBoardWriteAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String reviewName = request.getParameter("reviewName");
		String reviewPass = request.getParameter("reviewPass");
		String reviewScore1 = request.getParameter("reviewScore1");
		String reviewScore2 = request.getParameter("reviewScore2");
		String reviewScore3 = request.getParameter("reviewScore3");
		String reviewScore4 = request.getParameter("reviewScore4");
		String reviewScore5 = request.getParameter("reviewScore5");
		String reviewPkgName = request.getParameter("reviewPkgName");
		String reviewSubject = request.getParameter("reviewSubject");
		String reviewContent = request.getParameter("reviewContent");
		

		ReviewBoardDTO dto = new ReviewBoardDTO();
		
		if(reviewScore5 == null) {
			if(reviewScore4 == null) {
				if(reviewScore3 == null) {
					if(reviewScore2 == null) {
						if(reviewScore1 == null) {
							dto.setReviewScore("0");
						}
						else {
							System.out.println("reviewScore :" + reviewScore1);
							dto.setReviewScore(reviewScore1);			
						}
					}
					else {
						System.out.println("reviewScore :" + reviewScore2);
						dto.setReviewScore(reviewScore2);			
					}
				}
				else {
					System.out.println("reviewScore :" + reviewScore3);
					dto.setReviewScore(reviewScore3);			
				}
			}
			else {
				System.out.println("reviewScore :" + reviewScore4);
				dto.setReviewScore(reviewScore4);
			}
		}
		else {
			System.out.println("reviewScore :" + reviewScore5);
			dto.setReviewScore(reviewScore5);
		}
		
		dto.setmId(mId);
		dto.setReviewName(reviewName);
		dto.setReviewPass(reviewPass);
		dto.setReviewPkgName(reviewPkgName);
		dto.setReviewSubject(reviewSubject);
		dto.setReviewContent(reviewContent);
		dto.setIpAddr(request.getRemoteAddr());
		
		ReviewBoardDAO dao = new ReviewBoardDAO();
		dao.insertReviewBoard(dto);
		
	}
}
