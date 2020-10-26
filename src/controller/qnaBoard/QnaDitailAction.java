package controller.qnaBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.QnaBoardDAO;
import model.DTO.QnaBoardDTO;

public class QnaDitailAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		QnaBoardDAO dao = new QnaBoardDAO();
		QnaBoardDTO dto = dao.QnaSelectAll(num);
		request.setAttribute("dto", dto);
	}
}
