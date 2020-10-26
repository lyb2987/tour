package controller.pay;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DAO.PaymentDAO;
import model.DAO.ReservationDAO;
import model.DTO.CouponDTO;
import model.DTO.MemberDTO;
import model.DTO.PaymentDTO;
import model.DTO.ReservationAndFPListAndP;

public class PaymentSettingAction {
   public void execute(HttpServletRequest request) {
      //회원정보, 결제정보, 예약정보(패키지정보, 예약정보)
      HttpSession session = request.getSession();
      String mId = (String)session.getAttribute("logId");
      
      MemberDAO memdao = new MemberDAO();
      MemberDTO memdto = memdao.selectMember(mId);
      
      String rvNum = request.getParameter("rvNum");
      System.out.println("rvNum : " + rvNum);
      
      ReservationDAO rsvdao = new ReservationDAO();
      List<ReservationAndFPListAndP> list = rsvdao.getReservationAndFPDetail(mId, rvNum);
      
      PaymentDAO dao = new PaymentDAO();
      PaymentDTO dto = dao.selectPaymentByRvNum(rvNum);
      
      request.setAttribute("mem", memdto);
      request.setAttribute("rfplist", list);
      List<CouponDTO> clist = memdao.selectCouponList(mId);
      request.setAttribute("clist", clist);
      request.setAttribute("pay", dto);
   }
   
   public int execute2(HttpServletRequest request) {
      //회원정보, 결제정보, 예약정보(패키지정보, 예약정보)
      int result = 0;
      HttpSession session = request.getSession();
      String mId = (String)session.getAttribute("logId");
      
      MemberDAO memdao = new MemberDAO();
      MemberDTO memdto = memdao.selectMember(mId);
      
      String rvNum = request.getParameter("rvNum");
      System.out.println("rvNum : " + rvNum);
      
      ReservationDAO rsvdao = new ReservationDAO();
      List<ReservationAndFPListAndP> list = rsvdao.getReservationAndFPDetail(mId, rvNum);
      result = rsvdao.updateRStatus(rvNum);
      if(result != 1)
         return result;
      
      PaymentDAO dao = new PaymentDAO();
      PaymentDTO dto = dao.selectPaymentByRvNum(rvNum);
      
      if(dto.getPayMeans().equals("card")) {
         String cardCompany = request.getParameter("cardCompany");
         String cardNum1 = request.getParameter("cardNum1");
         String cardNum2 = request.getParameter("cardNum2");
         String cardNum3 = request.getParameter("cardNum3");
         String cardNum4 = request.getParameter("cardNum4");
         String cardNum = cardNum1 + " - " + cardNum2 + " - " + cardNum3 + " - " + cardNum4;
         String cardValidityM = request.getParameter("cardValidityM");
         String cardValidityD = request.getParameter("cardValidityD");
         String cardValidity = cardValidityM + " / " + cardValidityD;
         String cardCVC = request.getParameter("cardCVC");
         request.setAttribute("cardCompany", cardCompany);
         request.setAttribute("cardNum", cardNum);
         request.setAttribute("cardValidity", cardValidity);
         request.setAttribute("cardCVC", cardCVC);
      }
      else if(dto.getPayMeans().equals("phone")) {
         String telleCompany = request.getParameter("telleCompany");
         String phoneNum1 = request.getParameter("cardNum1");
         String phoneNum2 = request.getParameter("cardNum2");
         String phoneNum3 = request.getParameter("cardNum3");
         String PhoneNum = phoneNum1 + " - " + phoneNum2 + " + " + phoneNum3;
         String phoneOwner = request.getParameter("phoneOwner");
         request.setAttribute("telleCompany", telleCompany);
         request.setAttribute("PhoneNum", PhoneNum);
         request.setAttribute("phoneOwner", phoneOwner);
      }
      
      String cNum = request.getParameter("cNum");
      memdao.deleteCoupon(cNum);   
      
      request.setAttribute("mem", memdto);
      request.setAttribute("rfplist", list);
      request.setAttribute("pay", dto);
      
      return result;
   }
   
}