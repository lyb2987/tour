package model.DAO;

import model.DTO.PaymentDTO;

public class PaymentDAO extends DataBaseInfo{
	
	final String COLUMN = "PAY_NUM, PAY_RV_NUM, PAY_M_ID, PAY_M_PH1, PAY_P_NUM, PAY_RV_TOTAL_PRICE, PAY_MEANS, PAY_DC_MEANS, PAY_DC_PRICE, PAY_TOTAL_PRCIE, PAY_POINT, PAY_OK";
	
	public int paymentInsert(PaymentDTO dto) {
		int result=0;
		conn = getConnection();
		String payNum = "select nvl(max(PAY_NUM), 0)+1 from PAYMENT";
		sql = "insert into PAYMENT(" + COLUMN + ") values((" + payNum + "), ?, ?, ?, ?, ?, null, null, null, null, ?, 'none')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPayRvNum());
			pstmt.setString(2, dto.getPayMId());
			pstmt.setString(3, dto.getPayMPh1());
			pstmt.setInt(4, dto.getPayPNum());
			pstmt.setInt(5, dto.getPayRvTotalPrice());
			System.out.println("dao : " + dto.getPayRvTotalPrice());
			pstmt.setInt(6, dto.getPayPoint());
			
			result = pstmt.executeUpdate();
			
			System.out.println("예약을 위해  PAYMENT 테이블에 " + result + "개의 데이터가 저장되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return result;
	}
	public PaymentDTO selectPaymentByPayNum(String paymentNum) {
		PaymentDTO dto = new PaymentDTO();
		conn = getConnection();
		sql = "select " + COLUMN + " from PAYMENT where PAY_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paymentNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setPayNum(rs.getInt("PAY_NUM"));
				dto.setPayRvNum(rs.getInt("PAY_RV_NUM"));
				dto.setPayMId(rs.getString("PAY_M_ID"));
				dto.setPayMPh1(rs.getString("PAY_M_PH1"));
				dto.setPayPNum(rs.getInt("PAY_P_NUM"));
				dto.setPayRvTotalPrice(rs.getInt("PAY_RV_TOTAL_PRICE"));
				dto.setPayMeans(rs.getString("PAY_MEANS"));
				dto.setPayDcMeans(rs.getString("PAY_DC_MEANS"));
				dto.setPayDcPrice(rs.getInt("PAY_DC_PRICE"));
				dto.setPayTotalPrice(rs.getInt("PAY_TOTAL_PRCIE"));
				dto.setPayPoint(rs.getInt("PAY_POINT"));
				dto.setPayOk(rs.getString("PAY_OK"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return dto;
	}
	
	public PaymentDTO selectPaymentByRvNum(String rvNum) {
		PaymentDTO dto = new PaymentDTO();
		conn = getConnection();
		sql = "select " + COLUMN + " from PAYMENT where PAY_RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setPayNum(rs.getInt("PAY_NUM"));
				dto.setPayRvNum(rs.getInt("PAY_RV_NUM"));
				dto.setPayMId(rs.getString("PAY_M_ID"));
				dto.setPayMPh1(rs.getString("PAY_M_PH1"));
				dto.setPayPNum(rs.getInt("PAY_P_NUM"));
				dto.setPayRvTotalPrice(rs.getInt("PAY_RV_TOTAL_PRICE"));
				dto.setPayMeans(rs.getString("PAY_MEANS"));
				dto.setPayDcMeans(rs.getString("PAY_DC_MEANS"));
				dto.setPayDcPrice(rs.getInt("PAY_DC_PRICE"));
				dto.setPayTotalPrice(rs.getInt("PAY_TOTAL_PRCIE"));
				dto.setPayPoint(rs.getInt("PAY_POINT"));
				dto.setPayOk(rs.getString("PAY_OK"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return dto;
	}
	
	public int deletePayment(String rvNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from PAYMENT where PAY_RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNum);
			
			result = pstmt.executeUpdate();
			
			System.out.println("예약 취소를 위해 PAYMENT 테이블의 " + result + "개의 데이터가 삭제되었습니다.");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return result;
	}
	
	public int updatePayment(PaymentDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = "update PAYMENT set PAY_MEANS = ?, PAY_DC_MEANS = ?, PAY_DC_PRICE = ?, PAY_TOTAL_PRCIE = ? where PAY_RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPayMeans());
			pstmt.setString(2, dto.getPayDcMeans());
			pstmt.setInt(3, dto.getPayDcPrice());
			pstmt.setInt(4, dto.getPayTotalPrice());
			pstmt.setInt(5, dto.getPayRvNum());
			
			result = pstmt.executeUpdate();
			
			System.out.println("결제를 위해 PAYMENT 테이블의 " + result + "개의 데이터가 수정되었습니다.");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
	
	public int updatePaymentStatus(String rvNum) {
		int result = 0;
		conn = getConnection();
		sql = "update PAYMENT set PAY_OK = 'OK' where PAY_RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNum);
			
			result = pstmt.executeUpdate();
			
			System.out.println("결제 후 PAYMENT 테이블 PAY_OK 컬럼의 " + result + "개의 데이터가 수정되었습니다.");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
}
