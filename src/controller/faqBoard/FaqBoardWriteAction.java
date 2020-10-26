package controller.faqBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.FaqBoardDAO;
import model.DTO.FaqBoardDTO;

public class FaqBoardWriteAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		String faqCategory = request.getParameter("faqCategory");
		String faqContent = request.getParameter("faqContent");
		String faqAnswer = request.getParameter("faqAnswer");
		
		FaqBoardDTO dto = new FaqBoardDTO();
		dto.setFaqCategory(faqCategory);
		dto.setFaqContent(faqContent);
		dto.setFaqAnswer(faqAnswer);
		
		FaqBoardDAO dao = new FaqBoardDAO();
		dao.insertFaqBoard(dto);
	}
}
