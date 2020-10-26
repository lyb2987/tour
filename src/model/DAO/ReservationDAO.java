package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.FellowPassengerDTO;
import model.DTO.PackageDTO;
import model.DTO.ReservationAndFPListAndP;
import model.DTO.ReservationDTO;

public class ReservationDAO extends DataBaseInfo{

	private final String RCOLUMN ="RV_NUM, RV_M_ID, RV_NUMPERSON, RV_P_NUM, RV_P_PRICE, RV_STATUS, RV_TOTAL_PRICE";
	private final String FPCOLUMN ="FP_PASSPORT_NUM, FP_KOR_NAME, FP_ENG_NAME, FP_PH1, FP_RV_NUM";
	
	public int reservationInsert(ReservationDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = "insert into RESERVATION(" + RCOLUMN + ") values(?, ?, ?, ? ,? ,'결제 대기' ,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRvNum());
			pstmt.setString(2, dto.getRvMId());
			pstmt.setInt(3, dto.getRvNumPerson());
			pstmt.setInt(4, dto.getRvPNum());
			pstmt.setInt(5, dto.getRvPPrice());
			pstmt.setInt(6, dto.getRvTotalPrice());
			result = pstmt.executeUpdate();
			if(result==1) {
				System.out.println("예약을 위해  Reservation 테이블에 " + result + "개의 데이터가  저장되었습니다.");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return result;
	}
	
	public int fellowPassengerInsert(List<FellowPassengerDTO> list) {
		int result = 0;
		conn = getConnection();
		sql = "insert into FELLOWPASSENGER(" + FPCOLUMN + ") values(?, ?, ?, ?, ?)";
		try {
			int listSize = list.size();
			
			for(int i=0; i<listSize; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, list.get(i).getFpPassportNum());
				pstmt.setString(2, list.get(i).getFpKorName());
				pstmt.setString(3, list.get(i).getFpEngName());
				pstmt.setString(4, list.get(i).getFpPh1());
				pstmt.setInt(5, list.get(i).getFpRvNum());
				result = pstmt.executeUpdate();
				
				if(result != 1) {
					return result;
				}
			}
			System.out.println("예약을 위해  FellowPassenger 테이블에 " + result + "개의 데이터가  저장되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return result;
	}
	
	public int getReserveNum(int reserveNum) {
		int result=0;
		conn = getConnection();
		sql = "select count(*) from RESERVATION where RV_NUM = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reserveNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
	
	public List<ReservationAndFPListAndP> getReservationAndFPList(String mId) {
		List<ReservationAndFPListAndP> list = new ArrayList<ReservationAndFPListAndP>();
		conn = getConnection();
		sql = "select RV_NUM, RV_M_ID, RV_NUMPERSON, RV_P_PRICE, RV_STATUS, RV_TOTAL_PRICE, RV_P_NUM, P_NAME, P_DESTINATION, P_PERIOD, FP_PASSPORT_NUM, FP_KOR_NAME, FP_ENG_NAME, FP_PH1"
				+ " from RESERVATION R, FELLOWPASSENGER F, PACKAGE P"
				+ " where R.RV_NUM = F.FP_RV_NUM(+) and R.RV_P_NUM = P.P_NUM"
				+ " and R.RV_M_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			
			int previousRvNum = 0;
			int currentRvNum = 0;

			while(rs.next()) {
				currentRvNum = rs.getInt("RV_NUM");
				if(currentRvNum != previousRvNum) {
					ReservationAndFPListAndP dto = new ReservationAndFPListAndP();
					ReservationDTO rsvdto = new ReservationDTO();
					rsvdto.setRvNum(rs.getInt("RV_NUM"));
					rsvdto.setRvMId(rs.getString("RV_M_ID"));
					rsvdto.setRvNumPerson(rs.getInt("RV_NUMPERSON"));
					rsvdto.setRvPNum(rs.getInt("RV_P_NUM"));
					rsvdto.setRvPPrice(rs.getInt("RV_P_PRICE"));
					rsvdto.setRvStatus(rs.getString("RV_STATUS"));
					dto.setRsv(rsvdto);
					
					PackageDTO pkgdto = new PackageDTO();
					pkgdto.setpName(rs.getString("P_NAME"));
					pkgdto.setpDestination(rs.getString("P_DESTINATION"));
					pkgdto.setpPeriod(rs.getString("P_PERIOD"));
					dto.setPkg(pkgdto);
					
				
					FellowPassengerDTO fpdto = new FellowPassengerDTO();
					fpdto.setFpPassportNum(rs.getString("FP_PASSPORT_NUM"));
					fpdto.setFpKorName(rs.getString("FP_KOR_NAME"));
					fpdto.setFpEngName(rs.getString("FP_ENG_NAME"));
					fpdto.setFpPh1(rs.getString("FP_PH1"));
					dto.setFp(fpdto);
					
					list.add(dto);
			
				}
				previousRvNum = rs.getInt("RV_NUM");
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list;
	}
	
	public List<ReservationAndFPListAndP> getReservationAndFPDetail(String mId, String rvNum) {
		List<ReservationAndFPListAndP> list = new ArrayList<ReservationAndFPListAndP>();
		conn = getConnection();
		sql = "select RV_NUM, RV_M_ID, RV_NUMPERSON, RV_P_PRICE, RV_STATUS, RV_TOTAL_PRICE, RV_TOTAL_PRICE, RV_P_NUM, P_NAME, P_DESTINATION, P_PERIOD, P_FLIGHT, P_HOTEL,"
				+ " P_LENTCAR, P_INSURANCE, P_CONTENT, P_AGREE, FP_PASSPORT_NUM, FP_KOR_NAME, FP_ENG_NAME, FP_PH1"
				+ " from RESERVATION R, FELLOWPASSENGER F, PACKAGE P"
				+ " where R.RV_NUM = F.FP_RV_NUM(+) and R.RV_P_NUM = P.P_NUM"
				+ " and R.RV_M_ID = ? and R.RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, rvNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReservationAndFPListAndP dto = new ReservationAndFPListAndP();
				ReservationDTO rsvdto = new ReservationDTO();
				rsvdto.setRvNum(rs.getInt("RV_NUM"));
				rsvdto.setRvMId(rs.getString("RV_M_ID"));
				rsvdto.setRvNumPerson(rs.getInt("RV_NUMPERSON"));
				rsvdto.setRvPNum(rs.getInt("RV_P_NUM"));
				rsvdto.setRvPPrice(rs.getInt("RV_P_PRICE"));
				rsvdto.setRvStatus(rs.getString("RV_STATUS"));
				rsvdto.setRvTotalPrice(rs.getInt("RV_TOTAL_PRICE"));
				dto.setRsv(rsvdto);
				
				PackageDTO pkgdto = new PackageDTO();
				pkgdto.setpName(rs.getString("P_NAME"));
				pkgdto.setpDestination(rs.getString("P_DESTINATION"));
				pkgdto.setpPeriod(rs.getString("P_PERIOD"));
				pkgdto.setpFlight(rs.getString("P_FLIGHT"));
				pkgdto.setpHotel(rs.getString("P_HOTEL"));
				pkgdto.setpLentCar(rs.getString("P_LENTCAR"));
				pkgdto.setpInsurance(rs.getString("P_INSURANCE"));
				pkgdto.setpContent(rs.getString("P_CONTENT"));
				pkgdto.setpAgree(rs.getString("P_AGREE"));
				dto.setPkg(pkgdto);
				
				FellowPassengerDTO fpdto = new FellowPassengerDTO();
				fpdto.setFpPassportNum(rs.getString("FP_PASSPORT_NUM"));
				fpdto.setFpKorName(rs.getString("FP_KOR_NAME"));
				fpdto.setFpEngName(rs.getString("FP_ENG_NAME"));
				fpdto.setFpPh1(rs.getString("FP_PH1"));
				dto.setFp(fpdto);
				
				list.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list;
	}
	
	

	
	public int reservationDelete(String mId, String rvNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from RESERVATION where RV_M_ID = ? AND RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, rvNum);
			
			result = pstmt.executeUpdate();
			System.out.println("예약 취소를 위해 RESERVATION 테이블의 " + result + "개의 데이터가 삭제되었습니다.");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
	
	public int fellowPassengerDelete(String rvNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from FELLOWPASSENGER where FP_RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNum);
			
			result = pstmt.executeUpdate();
			System.out.println("예약 취소를 위해 FELLOWPASSENGER 테이블의 " + result + "개의 데이터가 삭제되었습니다.");
			
			if(result >= 1)
				result = 1;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
	
	public int updateRStatus(String rvNum){
		int result = 0;
		conn = getConnection();
		sql = "update RESERVATION set RV_STATUS = '결제 완료' where RV_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvNum);
			
			result = pstmt.executeUpdate();
			System.out.println("결제 후 RESERVATION 테이블의 " + result + "개의 예약상태가 변경되었습니다.");
			
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
