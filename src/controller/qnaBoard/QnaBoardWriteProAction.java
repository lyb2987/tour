package controller.qnaBoard;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.QnaBoardDAO;
import model.DTO.QnaBoardDTO;

public class QnaBoardWriteProAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String mId = (String)session.getAttribute("logId");
		String qnaName = request.getParameter("qnaName");
		String qnaPass = request.getParameter("qnaPass");
		String qnaSubject = request.getParameter("qnaSubject");
		String qnaContent = request.getParameter("qnaContent");
		
		QnaBoardDTO dto = new QnaBoardDTO();
		dto.setmId(mId);
		dto.setQnaName(qnaName);
		dto.setQnaPass(qnaPass);
		dto.setQnaSubject(qnaSubject);
		dto.setQnaContent(qnaContent);
		dto.setIpAddr(request.getRemoteAddr());
		
		QnaBoardDAO dao = new QnaBoardDAO();
		dao.insertQnaBoard(dto);
		
	}
}
