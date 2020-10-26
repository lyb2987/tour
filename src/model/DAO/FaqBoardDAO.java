package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.FaqBoardDTO;

public class FaqBoardDAO extends DataBaseInfo{
	
	final String COLUMNS = "FAQ_NUM, FAQ_CATEGORY, FAQ_CONTENT, FAQ_ANSWER";
	
	public int faqCount() {
		int i = 0;
		conn = getConnection();
		sql = "select count(*) from faqboard";
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
	
	public List<FaqBoardDTO> faqSelectAll(int page, int limit) {
		List<FaqBoardDTO> list = new ArrayList<FaqBoardDTO>();
		int startRow = (page - 1) * limit + 1;
	    int endRow = startRow + limit -1;
	    
	    conn = getConnection();
	    sql = "select * from (select rownum rn, " + COLUMNS + " from (select " + COLUMNS + " from faqboard order by faq_num desc)) where rn between ? and ?";
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FaqBoardDTO dto = new FaqBoardDTO();
				dto.setFaqNum(rs.getInt("Faq_Num"));
				dto.setFaqCategory(rs.getString("Faq_Category"));
				dto.setFaqContent(rs.getString("Faq_Content"));
				dto.setFaqAnswer(rs.getString("Faq_Answer"));
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
	
	public void insertFaqBoard(FaqBoardDTO dto) {
		conn = getConnection();
		String num = "select nvl(max(faq_num), 0)+1 from faqboard";
		sql = "insert into faqBoard(" + COLUMNS + ") values((" + num + "), ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, dto.getFaqCategory());
			pstmt.setString(2, dto.getFaqContent());
			pstmt.setString(3, dto.getFaqAnswer());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 저장되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public List<FaqBoardDTO> faqCategorySelect(String category, int page, int limit){
		List<FaqBoardDTO> list = new ArrayList<FaqBoardDTO>();
		int startRow = (page - 1) * limit + 1;
	    int endRow = startRow + limit -1;
	    
		conn = getConnection();
		sql = "select * from (select rownum rn, " + COLUMNS + " from (select " + COLUMNS + " from faqBoard  where FAQ_CATEGORY = ? order by FAQ_NUM)) where rn between ? and ?";
		//sql = "select " + COLUMNS + " from faqBoard  where FAQ_CATEGORY = ? order by FAQ_NUM";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, category);
			pstmt.setInt(2, startRow);
	        pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FaqBoardDTO dto = new FaqBoardDTO();
				dto.setFaqNum(rs.getInt("FAQ_NUM"));
				dto.setFaqCategory(rs.getNString("FAQ_CATEGORY"));
				dto.setFaqContent(rs.getNString("FAQ_CONTENT"));
				dto.setFaqAnswer(rs.getNString("FAQ_ANSWER"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
