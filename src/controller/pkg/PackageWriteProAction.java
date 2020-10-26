package controller.pkg;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.PackageDAO;
import model.DTO.PackageDTO;

public class PackageWriteProAction {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		PackageDTO dto = new PackageDTO();
		String path = "/pkg/upload";
		String realPath = request.getServletContext().getRealPath(path);
		
		int fileSize = 1024 * 1024 * 5;
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			dto.setpName(multi.getParameter("pName"));
			dto.setpDestination(multi.getParameter("pDestination"));
			dto.setpPeriod(multi.getParameter("pPeriod"));
			dto.setpImages(multi.getFilesystemName("pImages"));
			dto.setpMP(Integer.parseInt(multi.getParameter("pMP")));
			//dto.setpCP(Integer.parseInt(request.getParameter("pCP")));
			dto.setpContent(multi.getParameter("pContent"));
			dto.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
			dto.setpFlight(multi.getParameter("pFlight"));
			dto.setpHotel(multi.getParameter("pHotel"));
			dto.setpLentCar(multi.getParameter("pLentCar"));
			dto.setpInsurance(multi.getParameter("pInsurance"));
			dto.setpAgree(multi.getParameter("pAgree"));
			PackageDAO dao = new PackageDAO();
			dao.writePackage(dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
