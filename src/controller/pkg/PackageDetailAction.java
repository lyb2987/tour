package controller.pkg;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PackageDAO;
import model.DTO.PackageDTO;

public class PackageDetailAction {
	public void execute(HttpServletRequest request) {
		String pNum = request.getParameter("pNum");
		
		PackageDAO dao = new PackageDAO();
		PackageDTO dto = dao.packageSelectAll(1, 1, pNum).get(0);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pNum", pNum);
		
	}
	
	public int execute2(HttpServletRequest request) {
		String pNum = request.getParameter("pNum");
		
		PackageDAO dao = new PackageDAO();
		PackageDTO dto = dao.packageSelectAll(1, 1, pNum).get(0);
		
		request.setAttribute("dto", dto);
		request.setAttribute("pNum", pNum);
		
		int price = dto.getpPrice();
		
		return price;
		
	}
}
