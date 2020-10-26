package controller.pkg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.PackageDAO;
import model.DTO.PackageDTO;

public class PackageMainSearchListAction {
	public void execute(HttpServletRequest request) {
		String searchdst = request.getParameter("search");
		String searchStartD = request.getParameter("calender");
		searchStartD = searchStartD.substring(0, 10);
		System.out.println(searchStartD);
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		PackageDAO dao = new PackageDAO();
		List<PackageDTO> list = dao.packageSelectSearchMain(page, limit, searchdst, searchStartD);
		int count = dao.packageSelectCount();
		request.setAttribute("list", list);
		System.out.println("list size : " + list.size());
		request.setAttribute("count", count);
		

		PageAction action = new PageAction();
		action.page(request, count, limit, limitPage, page, "qnaList.qna?");
		
	}
}