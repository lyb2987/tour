package controller.pkg;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.PackageDAO;
import model.DTO.PackageDTO;

public class PackageModifyAction {

	public int execute(HttpServletRequest request) {
		String realPath = request.getServletContext().getRealPath("/pkg/upload");
		int limitSize = 1024 * 1024 * 5;
		
		PackageDTO dto = new PackageDTO();
		
		PackageDAO dao = new PackageDAO();
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, realPath, limitSize, "UTF-8", new DefaultFileRenamePolicy());
			dto.setpNum(Integer.parseInt(multi.getParameter("pNum")));
			dto.setpName(multi.getParameter("pName"));
			dto.setpDestination(multi.getParameter("pDestination"));
			dto.setpPeriod(multi.getParameter("pPeriod"));
			dto.setpMP(Integer.parseInt(multi.getParameter("pMP")));
			dto.setpContent(multi.getParameter("pContent"));
			dto.setpPrice(Integer.parseInt(multi.getParameter("pPrice")));
			dto.setpFlight(multi.getParameter("pFlight"));
			dto.setpHotel(multi.getParameter("pHotel"));
			dto.setpLentCar(multi.getParameter("pLentCar"));
			dto.setpInsurance(multi.getParameter("pInsurance"));
			dto.setpAgree(multi.getParameter("pAgree"));
			
			dao.modifyPackage(dto);
			
			if(multi.getFile("fileUp") != null) {
				dto.setpImages(multi.getOriginalFileName("fileUp"));
				System.out.println(dto.getpImages());
				int i = dao.fileUpdate(dto);
				File file = null;
				if(i >= 1) {
					String fileName = realPath + "/" + multi.getParameter("fileDel");
					file = new File(fileName);
					if(file.exists()) {
						file.delete();
					}else {
						System.out.println("파일이 없습니다.");
					}
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return (Integer.parseInt(multi.getParameter("pNum")));
	}
}
