package controller.rsv;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DAO.PackageDAO;
import model.DAO.PaymentDAO;
import model.DAO.ReservationDAO;
import model.DTO.FellowPassengerDTO;
import model.DTO.MemberDTO;
import model.DTO.PackageDTO;
import model.DTO.PaymentDTO;
import model.DTO.ReservationDTO;

public class ReservationProAction {
	public int execute(HttpServletRequest request) {
		int result = 0;

		ReservationDAO dao = new ReservationDAO();
		
		int numresult = 1;
		int rvNum = (int)Math.floor(Math.random()*100000+1);
		while(numresult == 0) {
			numresult = dao.getReserveNum(rvNum);
			if(numresult != 0) {
				rvNum = (int)Math.floor(Math.random()*100000+1);
			}
		}
		
		ReservationDTO dto = new ReservationDTO();
		dto.setRvNum(rvNum);
		dto.setRvMId(request.getParameter("mId"));
		dto.setRvNumPerson(Integer.parseInt(request.getParameter("personNum")));
		dto.setRvPNum(Integer.parseInt(request.getParameter("pNum")));
		dto.setRvPPrice(Integer.parseInt(request.getParameter("pPrice")));
		dto.setRvTotalPrice(Integer.parseInt(request.getParameter("totalPrice")));
		dto.setRvStatus("결제 대기");

		result = dao.reservationInsert(dto);
		
		if(result != 1) {
			return result;
		}
		
		HttpSession session = request.getSession();
		
		MemberDAO memdao = new MemberDAO();
		MemberDTO memdto = memdao.selectMember((String)session.getAttribute("logId"));
		System.out.println("mId : " + (String)session.getAttribute("logId"));
		
		PackageDAO pkgdao = new PackageDAO();
		PackageDTO pkgdto = pkgdao.packageSelectAll(1, 1, request.getParameter("pNum")).get(0);
		System.out.println("pNum : " + request.getParameter("pNum"));
		
		
		PaymentDTO paydto = new PaymentDTO();
		paydto.setPayRvNum(rvNum);
		paydto.setPayMId(memdto.getmId());
		paydto.setPayMPh1(memdto.getmPh1());
		paydto.setPayPNum(pkgdto.getpNum());
		paydto.setPayRvTotalPrice(dto.getRvTotalPrice());
		double point = dto.getRvTotalPrice()/100; 
		paydto.setPayPoint((int)point);
		
		PaymentDAO paydao = new PaymentDAO();
		result = paydao.paymentInsert(paydto);
		
		if(result != 1) {
			return result;
		}
		
		List<FellowPassengerDTO> list = new ArrayList<FellowPassengerDTO>();
		int nop = dto.getRvNumPerson()-1;
		if(nop >= 1) {
			for(int i=1; i<=nop; i++) {
				FellowPassengerDTO fpdto = new FellowPassengerDTO();
				String si = Integer.toString(i);
				fpdto.setFpPassportNum(request.getParameter("fpPassportNum"+si));
				fpdto.setFpEngName(request.getParameter("fpEngName"+si));
				fpdto.setFpKorName(request.getParameter("fpKorName"+si));
				fpdto.setFpPh1(request.getParameter("fpPh1"+si));
				fpdto.setFpRvNum(rvNum);
				list.add(fpdto);
			}
		}
		
		result = dao.fellowPassengerInsert(list);
		
		if(result == 0) {
			result = 1;
		}
		
		//result = pkgdao.updatePCP(dto.getRvNumPerson(), request.getParameter("pNum"));
		
		
		System.out.println(result);
		if(result == 1) {
			request.setAttribute("pkg", pkgdto);
			request.setAttribute("mem", memdto);
			request.setAttribute("rsv", dto);
			request.setAttribute("fplist", list);
		}
		return result;
	}
}
