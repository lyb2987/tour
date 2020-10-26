package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.CouponDTO;
import model.DTO.MemberDTO;

public class MemberDAO extends DataBaseInfo{

	final String COLUMNS = "M_ID, M_PW, M_PASSPORT_NUM, M_PASSPORT_END, M_LASTNAME, M_FIRSTNAME, "
			+ "M_KOR_NAME, M_BIRTH, M_GENDER, M_ADDR, M_PH1, M_PH2, M_EMAIL, M_JOINOK, M_REGISTER, "
			+ "M_POINT, M_INTEREST1, M_INTEREST2, M_INTEREST3";
	
	// joinOk 체크 후 로그인
		public String checkJoinOk(String mId) {
			String result = "";
			conn = getConnection();
			sql = "select M_JOINOK from MEMBER where M_ID = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getString(1);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return result;
		}

	
	// 쿠폰 사용후 삭제
		public void deleteCoupon(String cNum) {
			int result = 0;
			conn = getConnection();

			sql = "delete from COUPON where C_NUM = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cNum);
				
				result = pstmt.executeUpdate();
				
				System.out.println("쿠폰 사용으로 인해 COUPON 테이블에" + result + "개의 쿠폰 데이터가 삭제되었습니다.");
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
	
	// 쿠폰 리스트 가져오기
	public List<CouponDTO> selectCouponList(String mId){
		List<CouponDTO> list = new ArrayList<CouponDTO>();
		conn = getConnection();

		sql = "select C_NUM, C_M_ID, C_NAME, C_DC_PRICE from COUPON where C_M_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				dto.setcNum(rs.getInt("C_NUM"));
				dto.setcMId(rs.getString("C_M_ID"));
				dto.setcName(rs.getString("C_NAME"));
				dto.setcDcPrice(rs.getInt("C_DC_PRICE"));
				list.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	// 쿠폰 지급
		public void cpProvision(String mId) {
			int result = 0;
			conn = getConnection();
			String num = "select nvl(max(C_NUM), 0)+1 from COUPON";
			sql = "insert into COUPON(C_NUM, C_M_ID, C_NAME, C_DC_PRICE) values((" + num + "), ?, '[정기 쿠폰] 모든 상품 10% 할인', 10)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mId);
				
				result = pstmt.executeUpdate();
				
				System.out.println("쿠폰지급을 위해 COUPON 테이블에 " + result + "개의 데이터가 입력되었습니다.");
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
	
	// 회원수 가져오기 
		public int selectMemberCount() {
			int count = 0;
			conn = getConnection();
			sql = "select count(*) from MEMBER";
			try {
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return count;
		}
		
		public List<MemberDTO> selectMemberList(int page, int limit){
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			
			int startRow = (page - 1) * limit + 1;
			int endRow = startRow + limit -1;
			
			sql = "select * from(select rownum rn, " + COLUMNS + " from(select " + COLUMNS + " from MEMBER)) where rn between ? and ?";
			
			conn = getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setmId(rs.getString("M_ID"));
					dto.setmPw(rs.getString("M_PW"));
					dto.setmPassPortNum(rs.getString("M_PASSPORT_NUM"));
					dto.setmPassPortEnd(rs.getTimestamp("M_PASSPORT_END"));
					dto.setmLastName(rs.getString("M_LASTNAME"));
					dto.setmFirstName(rs.getString("M_FIRSTNAME"));
					dto.setmKorName(rs.getString("M_KOR_NAME"));
					dto.setmBirth(rs.getTimestamp("M_BIRTH"));
					dto.setmGender(rs.getString("M_GENDER"));
					dto.setmAddr(rs.getString("M_ADDR"));
					dto.setmPh1(rs.getString("M_PH1"));
					dto.setmPh2(rs.getString("M_PH2"));
					dto.setmEmail(rs.getString("M_EMAIL"));
					dto.setmJoinOk(rs.getString("M_JOINOK"));
					dto.setmRegister(rs.getTimestamp("M_REGISTER"));
					dto.setmPoint(rs.getLong("M_POINT"));
					dto.setmInsert1(rs.getString("M_INTEREST1"));
					dto.setmInsert2(rs.getString("M_INTEREST2"));
					dto.setmInsert3(rs.getString("M_INTEREST3"));
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
	
	public int login(MemberDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = "select count(*) from member where m_id = ? and m_pw = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println("로그인 여부 : " + result);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			close();
		}
		return result;
	}
	

	public int userIdConfrim(String userId) {
		conn = getConnection();
		int result=0;
		sql = "select count(*) from member where M_ID= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public MemberDTO selectMember(String mId) {
		MemberDTO dto = new MemberDTO();
		conn = getConnection(); 
		sql = "select " + COLUMNS + " FROM MEMBER WHERE M_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmPassPortNum(rs.getString("M_PASSPORT_NUM"));
				dto.setmPassPortEnd(rs.getTimestamp("M_PASSPORT_END"));
				dto.setmLastName(rs.getString("M_LASTNAME"));
				dto.setmFirstName(rs.getString("M_FIRSTNAME"));
				dto.setmKorName(rs.getString("M_KOR_NAME"));
				dto.setmBirth(rs.getTimestamp("M_BIRTH"));
				dto.setmGender(rs.getString("M_GENDER"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmPh1(rs.getString("M_PH1"));
				dto.setmPh2(rs.getString("M_PH2"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoinOk(rs.getString("M_JOINOK"));
				dto.setmRegister(rs.getTimestamp("M_REGISTER"));
				dto.setmPoint(rs.getLong("M_POINT"));
				dto.setmInsert1(rs.getString("M_INTEREST1"));
				dto.setmInsert2(rs.getString("M_INTEREST2"));
				dto.setmInsert3(rs.getString("M_INTEREST3"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			close();
		}
		return dto;
	}
	
	public String pwFind(String mKorName, String mId, String mPh1) {
		String mPw = null;
		conn = getConnection();
		sql = " select m_pw from member where m_kor_name = ? and m_id = ? and m_ph1 = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mKorName);
			System.out.println(mKorName);
			pstmt.setString(2, mId);
			System.out.println(mId);
			pstmt.setString(3, mPh1);
			System.out.println(mPh1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mPw = rs.getNString(1);
			}
			System.out.println(mPw);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return mPw;
	}
	
	public String idPhFind(String mKorName, String mPh1) {
		String mId = null;
		conn = getConnection();
		sql = " select m_id from member where m_kor_name = ? and m_ph1 = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mKorName);
			pstmt.setString(2, mPh1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mId = rs.getString(1);
			}
			System.out.println("아이디PH로 찾기 : " + mId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return mId;
	}
	
	public String idEmailFind(String mKorName, String mEmail) {
		String mId = null;
		conn = getConnection();
		sql = " select m_id from member where m_kor_name = ? and m_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mKorName);
			pstmt.setString(2, mEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mId = rs.getString(1);
			}
			System.out.println("아이디EMAIL로 찾기 : " + mId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return mId;
	}
	
	public Integer memberLoginCk(String mId, String mPw) {
		Integer i = -1;
		conn = getConnection();
		sql = "select m_pw from member where m_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPw = rs.getString(1);
				if(mPw.equals(dbPw)) {
					i = 1;	// 로그인 허용
				}else {
					i = 0;	// 비밀번호 틀림
				}
			}else {
				i = -1;	//아이디 틀림
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	
	// 메일 확인
	public Integer joinOkUpdate(String email, String joinOk) {
		Integer result = 0;
		conn = getConnection();
		sql = "update member set m_joinok = ? where m_email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, joinOk);
			pstmt.setString(2, email);
			result = pstmt.executeUpdate();
			System.out.println(result + "개가 수정되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	// 회원가입시 아이디 중복체크
	public String memberConfirm(String mId) {
		String id = null;
		conn = getConnection();
		sql = " select m_id from member where m_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return id;
	}
	
	// 회원가입 정보입력
	public Integer memberJoinInsert(MemberDTO dto) {
		Integer i = null;
		conn = getConnection();
		sql = "insert into member(" + COLUMNS + ") values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, 0, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			pstmt.setString(3, dto.getmPassPortNum());
			pstmt.setTimestamp(4, dto.getmPassPortEnd());
			pstmt.setString(5, dto.getmLastName());
			pstmt.setString(6, dto.getmFirstName());
			pstmt.setString(7, dto.getmKorName());
			pstmt.setTimestamp(8, dto.getmBirth());
			pstmt.setString(9, dto.getmGender());
			pstmt.setString(10, dto.getmAddr());
			pstmt.setString(11, dto.getmPh1());
			pstmt.setString(12, dto.getmPh2());
			pstmt.setString(13, dto.getmEmail());
			pstmt.setString(14, dto.getmJoinOk());
			pstmt.setString(15, dto.getmInsert1());
			pstmt.setString(16, dto.getmInsert2());
			pstmt.setString(17, dto.getmInsert3());
			
			i = pstmt.executeUpdate();
			System.out.println(i + "명의 회원이 가입하였습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	
	// 회원 정보 수정
	public void memberUpdate(MemberDTO dto) {
		conn = getConnection();
		sql = "update MEMBER SET M_PH1= ?, M_PH2= ?, M_EMAIL = ?, M_PASSPORT_NUM = ?, M_ADDR = ? "
				+ "where M_ID = ? and M_PW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmPh1());
			pstmt.setString(2, dto.getmPh2());
			pstmt.setString(3, dto.getmEmail());
			pstmt.setString(4, dto.getmPassPortNum());
			pstmt.setString(5, dto.getmAddr());
			pstmt.setString(6, dto.getmId());
			pstmt.setString(7, dto.getmPw());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}	
	
	// 회원 비밀번호 체크
	public int chkMemberPw(String mId, String mPw) {
		int result = 0;
		conn = getConnection();
		sql = "select count(*) from MEMBER where M_ID = ? and M_PW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	// 회원 탈퇴 
	public void deleteMember(String mId) {
		conn = getConnection();
		sql = "delete from MEMBER where M_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("MEMBER 테이블의 " + result + "개의 멤버가 삭제되며 탈퇴되었습니다.");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	// 비밀번호 체크
	public int checkPw(String mId, String mPw) {
		int result = 0;
		conn = getConnection();
		sql = "select count(*) from MEMBER where M_ID = ? and M_PW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
		
	// 비밀번호 변경 
	public int changePw(String mId, String mPw, String changePw) {
		int result = 0;
		conn = getConnection();
		sql = "update MEMBER set M_PW = ? where M_ID = ? and M_PW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changePw);
			pstmt.setString(2, mId);
			pstmt.setString(3, mPw);
			
			result = pstmt.executeUpdate();
			
			System.out.println("비밀번호 변경 수행으로 MEMBER 테이블의 " + result + "개의 컬럼이 업데이트 되었습니다.");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}
