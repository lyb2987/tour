package controller.pkg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.PackageDAO;
import model.DTO.PackageDTO;


public class PackageListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		PackageDAO dao = new PackageDAO();
		List<PackageDTO> list = dao.packageSelectAll(page, limit, null);
		int count = dao.packageSelectCount();

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		
		PageAction action = new PageAction();
		action.page(request, count, limit, limitPage, page, "packgaeBoard.pkg?");
		
	}
	
}
