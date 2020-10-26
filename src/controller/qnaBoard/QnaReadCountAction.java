package controller.qnaBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.QnaBoardDAO;

public class QnaReadCountAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		QnaBoardDAO dao = new QnaBoardDAO();
		dao.qnaincreaseReadCount(num,"qnaboard");
	}
}
