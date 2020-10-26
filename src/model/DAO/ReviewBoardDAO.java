package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.ReviewBoardDTO;

public class ReviewBoardDAO extends DataBaseInfo{
	
	final String COLUMNS = "REVIEW_NUM, M_ID, REVIEW_PASS, REVIEW_SCORE, REVIEW_PKGNAME, REVIEW_SUBJECT, REVIEW_CONTENT, REVIEW_NAME, REVIEW_DATE, IP_ADDR, READ_COUNT";
	
	public void reviewDelete(ReviewBoardDTO dto) {
		conn = getConnection();
		sql = "delete from reviewboard where m_id = ? and review_num = ? and review_pass = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setInt(2, dto.getReviewNum());
			pstmt.setString(3, dto.getReviewPass());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 삭제되었습니더.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void reviewUpdate(ReviewBoardDTO dto) {
		conn = getConnection();
		sql = "update reviewboard set review_subject = ?, review_content = ?, review_score = ? where review_num = ? and m_id = ? and review_pass = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReviewSubject());
			pstmt.setString(2, dto.getReviewContent());
			pstmt.setString(3, dto.getReviewScore());
			pstmt.setInt(4, dto.getReviewNum());
			pstmt.setString(5, dto.getmId());
			pstmt.setString(6, dto.getReviewPass());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 수정되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public ReviewBoardDTO ReviewSelectAll(String num) {
		ReviewBoardDTO dto = new ReviewBoardDTO();
		conn = getConnection();
		sql = "select " + COLUMNS + " from reviewboard where review_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setReviewNum(rs.getInt("Review_Num"));
				dto.setmId(rs.getString("M_Id"));
				dto.setReviewPass(rs.getString("Review_Pass"));
				dto.setReviewScore(rs.getString("Review_Score"));
				dto.setReviewPkgName(rs.getString("Review_PkgName"));
				dto.setReviewSubject(rs.getString("Review_Subject"));
				dto.setReviewContent(rs.getString("Review_Content"));
				dto.setReviewName(rs.getString("Review_Name"));
				dto.setReviewDate(rs.getTimestamp("Review_Date"));
				dto.setReadCount(rs.getInt("Read_Count"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public List<ReviewBoardDTO> reviewSelect(int page, int limit) {
		List<ReviewBoardDTO> list = new ArrayList<ReviewBoardDTO>();
		int startRow = (page - 1) * limit + 1;
	    int endRow = startRow + limit -1;
	    
		conn = getConnection();
		sql = "select * from (select rownum rn, " + COLUMNS + " from (select " + COLUMNS + " from REVIEWboard order by REVIEW_num desc)) where rn between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewBoardDTO dto = new ReviewBoardDTO();
				dto.setReviewNum(rs.getInt("REVIEW_NUM"));
				dto.setmId(rs.getString("M_ID"));
				dto.setReviewPass(rs.getString("REVIEW_PASS"));
				dto.setReviewScore(rs.getString("REVIEW_SCORE"));
				dto.setReviewPkgName(rs.getString("REVIEW_PKGNAME"));
				dto.setReviewSubject(rs.getString("REVIEW_SUBJECT"));
				dto.setReviewContent(rs.getString("REVIEW_CONTENT"));
				dto.setReviewName(rs.getString("REVIEW_NAME"));
				dto.setReviewDate(rs.getTimestamp("REVIEW_DATE"));
				dto.setIpAddr(rs.getString("IP_ADDR"));
				dto.setReadCount(rs.getInt("READ_COUNT"));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int reviewCount() {
		int i = 0;
		conn = getConnection();
		sql = "select count(*) from reviewboard";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				i = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	
	public void insertReviewBoard(ReviewBoardDTO dto) {
		conn = getConnection();
		// M_ID, REVIEW_PASS, REVIEW_SCORE, REVIEW_PKGNAME, REVIEW_SUBJECT, REVIEW_CONTENT, REVIEW_NAME, REVIEW_DATE, IP_ADDR, READ_COUNT
		String num = "select nvl(max(review_num), 0)+1 from reviewboard";
		sql = "insert into reviewboard(" + COLUMNS + ") values((" + num  + "), ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 0)";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			System.out.println(dto.getmId());
			pstmt.setString(2, dto.getReviewPass());
			System.out.println(dto.getReviewPass());
			pstmt.setString(3, dto.getReviewScore());
			System.out.println(dto.getReviewScore());
			pstmt.setString(4, dto.getReviewPkgName());
			System.out.println(dto.getReviewPkgName());
			pstmt.setString(5, dto.getReviewSubject());
			System.out.println(dto.getReviewSubject());
			pstmt.setString(6, dto.getReviewContent());
			System.out.println(dto.getReviewContent());
			pstmt.setString(7, dto.getReviewName());
			System.out.println(dto.getReviewName());
			pstmt.setString(8, dto.getIpAddr());
			System.out.println(dto.getIpAddr());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 저장되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
