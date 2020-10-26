package controller.pkg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.PackageDAO;
import model.DTO.PackageDTO;

public class PackageSearchListAction {
	public void execute(HttpServletRequest request) {
		String searchdst = request.getParameter("dst");
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		PackageDAO dao = new PackageDAO();
		List<PackageDTO> list = dao.packageSelectSearch(page, limit, searchdst);
		int count = dao.packageSelectCount();

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		

		PageAction action = new PageAction();
		action.page2(request, count, limit, limitPage, page, "packageBoardSearch.pkg?" ,"dst=" + searchdst + "&");
		
	}
}
