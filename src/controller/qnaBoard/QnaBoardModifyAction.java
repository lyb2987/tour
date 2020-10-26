package controller.qnaBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.QnaBoardDAO;
import model.DTO.QnaBoardDTO;

public class QnaBoardModifyAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String qnaNum = request.getParameter("qnaNum");
		String qnaSubject = request.getParameter("qnaSubject");
		String qnaContent = request.getParameter("qnaContent");
		String qnaPass = request.getParameter("qnaPass");
		
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setmId(mId);
		dto.setQnaNum(Integer.parseInt(qnaNum));
		dto.setQnaSubject(qnaSubject);
		dto.setQnaContent(qnaContent);
		dto.setQnaPass(qnaPass);
		
		QnaBoardDAO dao = new QnaBoardDAO();
		dao.qnaUpdate(dto);
	}
}
