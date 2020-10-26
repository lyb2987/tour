package controller.pkg;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PackageDAO;


public class PackageDeleteAction {
	public int execute(HttpServletRequest request) {
		String pNum = request.getParameter("pNum");
		
		PackageDAO dao = new PackageDAO();
		int result = dao.deletePackage(pNum);
		
		return result;
	}
}
