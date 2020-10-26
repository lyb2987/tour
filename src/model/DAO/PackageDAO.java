package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.PackageDTO;

public class PackageDAO extends DataBaseInfo{
	final String COLUMNS = "P_NUM, P_NAME, P_DESTINATION, P_PERIOD, P_MP, P_CP, P_CONTENT, P_AGREE, P_PRICE, P_FLIGHT, P_HOTEL, P_LENTCAR, P_INSURANCE, P_IMAGES";

	public Integer fileUpdate(PackageDTO dto) {
		Integer i = 0;
		conn = getConnection();
		sql = "update PACKAGE set P_IMAGES = ? where p_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getpImages());
			pstmt.setInt(2, dto.getpNum());
			i = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	
	public void writePackage(PackageDTO dto) {
		conn = getConnection();
		int result = 0;
		String packageNum = "select nvl(max(P_NUM), 0)+1 from PACKAGE";
 		sql = "insert into PACKAGE(" + COLUMNS + ") values((" + packageNum + "), ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?, ?, ?)";
 		try {
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, dto.getpName());
 			pstmt.setString(2, dto.getpDestination());
 			pstmt.setString(3, dto.getpPeriod());
 			pstmt.setInt(4, dto.getpMP());
 			//pstmt.setInt(5, dto.getpCP());
 			pstmt.setString(5, dto.getpContent());
 			pstmt.setString(6, dto.getpAgree());
 			pstmt.setInt(7, dto.getpPrice());
 			pstmt.setString(8, dto.getpFlight());
 			pstmt.setString(9, dto.getpHotel());
 			pstmt.setString(10, dto.getpLentCar());
 			pstmt.setString(11, dto.getpInsurance());
 			pstmt.setNString(12, dto.getpImages());
 			result = pstmt.executeUpdate();
 			System.out.println("패키지 테이블에 " + result + "개의 패키지가 Insert되었습니다.");
 		}
 		catch(Exception e) {
 			e.printStackTrace();
 		}
	}
	
	
	public List<PackageDTO> packageSelectAll(int page, int limit, String pNum){
		List<PackageDTO> list = new ArrayList<PackageDTO>();

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		String condition = "";
		
		if(pNum != null) {
			condition = "where P_NUM = " + pNum;
			sql = "select " + COLUMNS + " from PACKAGE " + condition;
		}
		else
			sql = "select * from(select rownum rn, " + COLUMNS + " from(select " + COLUMNS + " from PACKAGE order by P_NUM desc)) where rn between ? and ?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if(pNum != null) {
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					PackageDTO dto = new PackageDTO();
					dto.setpNum(rs.getInt("P_NUM"));
					dto.setpName(rs.getString("P_NAME"));
					dto.setpDestination(rs.getString("P_DESTINATION"));
					dto.setpPeriod(rs.getString("P_PERIOD"));
					dto.setpMP(rs.getInt("P_MP"));
					dto.setpCP(rs.getInt("P_CP"));
					dto.setpContent(rs.getString("P_CONTENT"));
					dto.setpAgree(rs.getString("P_AGREE"));
					dto.setpPrice(rs.getInt("P_PRICE"));
					dto.setpFlight(rs.getString("P_FLIGHT"));
					dto.setpHotel(rs.getString("P_HOTEL"));
					dto.setpLentCar(rs.getString("P_LENTCAR"));
					dto.setpInsurance(rs.getString("P_INSURANCE"));
					dto.setpImages(rs.getNString("P_IMAGES"));
					list.add(dto);
				}	
			}
			else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					PackageDTO dto = new PackageDTO();
					dto.setpNum(rs.getInt("P_NUM"));
					dto.setpName(rs.getString("P_NAME"));
					dto.setpDestination(rs.getString("P_DESTINATION"));
					dto.setpPeriod(rs.getString("P_PERIOD"));
					dto.setpMP(rs.getInt("P_MP"));
					dto.setpCP(rs.getInt("P_CP"));
					dto.setpContent(rs.getString("P_CONTENT"));
					dto.setpAgree(rs.getString("P_AGREE"));
					dto.setpPrice(rs.getInt("P_PRICE"));
					dto.setpFlight(rs.getString("P_FLIGHT"));
					dto.setpHotel(rs.getString("P_HOTEL"));
					dto.setpLentCar(rs.getString("P_LENTCAR"));
					dto.setpInsurance(rs.getString("P_INSURANCE"));
					dto.setpImages(rs.getNString("P_IMAGES"));
					list.add(dto);
				}
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
	
	public int packageSelectCount() {
		conn = getConnection();
		int count = 0;
 		sql = "select count(*) from PACKAGE";
 		try {
 			pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();
 			
 			if(rs.next()) {
 				count = rs.getInt(1);
 			}
 			
 		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		 return count;
 		
	}
	
	public int modifyPackage(PackageDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = "update PACKAGE set P_NAME = ?, P_DESTINATION = ?, P_PERIOD = ?, P_MP = ?, P_CONTENT = ?, P_AGREE = ?, P_PRICE = ?, P_FLIGHT = ?, "
				+ "P_HOTEL = ?, P_LENTCAR = ?, P_INSURANCE = ? where P_NUM = ?";
 		try {
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, dto.getpName());
 			pstmt.setString(2, dto.getpDestination());
 			pstmt.setString(3, dto.getpPeriod());
 			pstmt.setInt(4, dto.getpMP());
 			pstmt.setString(5, dto.getpContent());
 			pstmt.setString(6, dto.getpAgree());
 			pstmt.setInt(7, dto.getpPrice());
 			pstmt.setString(8, dto.getpFlight());
 			pstmt.setString(9, dto.getpHotel());
 			pstmt.setString(10, dto.getpLentCar());
 			pstmt.setString(11, dto.getpInsurance());
 			pstmt.setInt(12, dto.getpNum());
 			result = pstmt.executeUpdate();
 			System.out.println("패키지 테이블에 " + result + "개의 패키지가 Update되었습니다.");
 			
 		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		 return result;
	}
	
	public int deletePackage(String pNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from PACKAGE where P_NUM = ?";
		try {
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, pNum);
 			result = pstmt.executeUpdate();
 			System.out.println("패키지 테이블에 " + result + "개의 패키지가 Delete되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		 return result;
		}
	
	public int updatePCP(int numPerson, String pNum) {
		int result = 0;
		conn = getConnection();
		sql = "update PACKAGE set P_CP = (P_CP + ?) where P_NUM = ?";
		try {
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, numPerson);
 			pstmt.setString(2, pNum);
 			result = pstmt.executeUpdate();
 			System.out.println("패키지 테이블에 " + result + "개의 패키지가 Delete되었습니다.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return result;
	}
	
	public List<PackageDTO> packageSelectSearch(int page, int limit, String searchdst){
		List<PackageDTO> list = new ArrayList<PackageDTO>();

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		sql = "select * from(select rownum rn, " + COLUMNS + " from(select " + COLUMNS + " from PACKAGE where P_DESTINATION like '%" + searchdst + "%' order by P_NUM desc)) where rn between ? and ?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PackageDTO dto = new PackageDTO();
				dto.setpNum(rs.getInt("P_NUM"));
				dto.setpName(rs.getString("P_NAME"));
				dto.setpDestination(rs.getString("P_DESTINATION"));
				dto.setpPeriod(rs.getString("P_PERIOD"));
				dto.setpMP(rs.getInt("P_MP"));
				dto.setpCP(rs.getInt("P_CP"));
				dto.setpContent(rs.getString("P_CONTENT"));
				dto.setpAgree(rs.getString("P_AGREE"));
				dto.setpPrice(rs.getInt("P_PRICE"));
				dto.setpFlight(rs.getString("P_FLIGHT"));
				dto.setpHotel(rs.getString("P_HOTEL"));
				dto.setpLentCar(rs.getString("P_LENTCAR"));
				dto.setpInsurance(rs.getString("P_INSURANCE"));
				dto.setpImages(rs.getString("P_IMAGES"));
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
	
	public List<PackageDTO> packageSelectSearchMain(int page, int limit, String searchdst, String searchStartD){
		List<PackageDTO> list = new ArrayList<PackageDTO>();

		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		sql = "select * from(select rownum rn, " + COLUMNS + " from(select " + COLUMNS + " from PACKAGE where P_DESTINATION like '%" + searchdst + "%' and P_PERIOD like '" + searchStartD + "%' order by P_NUM desc)) where rn between ? and ?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PackageDTO dto = new PackageDTO();
				dto.setpNum(rs.getInt("P_NUM"));
				dto.setpName(rs.getString("P_NAME"));
				dto.setpDestination(rs.getString("P_DESTINATION"));
				dto.setpPeriod(rs.getString("P_PERIOD"));
				dto.setpMP(rs.getInt("P_MP"));
				dto.setpCP(rs.getInt("P_CP"));
				dto.setpContent(rs.getString("P_CONTENT"));
				dto.setpAgree(rs.getString("P_AGREE"));
				dto.setpPrice(rs.getInt("P_PRICE"));
				dto.setpFlight(rs.getString("P_FLIGHT"));
				dto.setpHotel(rs.getString("P_HOTEL"));
				dto.setpLentCar(rs.getString("P_LENTCAR"));
				dto.setpInsurance(rs.getString("P_INSURANCE"));
				dto.setpImages(rs.getString("P_IMAGES"));
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
}
