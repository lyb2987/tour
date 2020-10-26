package controller.pay;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PaymentDAO;
import model.DTO.PaymentDTO;

public class PaymentMeansAction {
   public int execute(HttpServletRequest request) {
      int result = 0;
      String rvNum = request.getParameter("rvNum");
      System.out.println("rvNum : " + rvNum);
      String totalPriceS = request.getParameter("htotalPrice");
      System.out.println("totalPriceS : " + totalPriceS);
      String dcMeans = request.getParameter("payDcMeans");
      System.out.println("dcMeans : " + dcMeans);
      String payMeans = request.getParameter("payMeans");
      System.out.println("payMeans : " + payMeans);
      String dcPriceS = "0";
      
      System.out.println(dcMeans);
      
      // 결제수단에 따라 할인금액을 가져오는 방법이 다름
      if(dcMeans.equals("none")) {
         
      }
      else if(dcMeans.equals("coupon")) {
         dcPriceS = request.getParameter("hdcPrice");
         request.setAttribute("cNum", request.getParameter("cNum"));
      }
      else if(dcMeans.equals("point")) {
         dcPriceS = request.getParameter("usePoint");
      }
      
      PaymentDAO dao = new PaymentDAO();
      PaymentDTO dto = new PaymentDTO();
      dto.setPayRvNum(Integer.parseInt(rvNum));                                    // 결제테이블의 예매 번호
      dto.setPayDcMeans(dcMeans);                                                // 할인 수단
      dto.setPayDcPrice(Integer.parseInt(dcPriceS));                                 // 할인 가격
      dto.setPayTotalPrice(Integer.parseInt(totalPriceS) - Integer.parseInt(dcPriceS));      // 최종 결제 금액
      dto.setPayMeans(payMeans);                                                // 결제 수단
      
      result = dao.updatePayment(dto);
      System.out.println(dcPriceS);
      
      
      return result;
   }
}