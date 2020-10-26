package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.QnaBoardDTO;

public class QnaBoardDAO extends DataBaseInfo{
	
	final String COLUMNS = "QNA_NUM, M_ID, QNA_NAME, QNA_SUBJECT, QNA_CONTENT, QNA_PASS, IP_ADDR, QNA_DATE, READ_COUNT";
	
	public void qnaDelete(QnaBoardDTO dto) {
		conn = getConnection();
		sql = "delete from qnaboard where m_id = ? and qna_num = ? and qna_pass = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setInt(2, dto.getQnaNum());
			pstmt.setString(3, dto.getQnaPass());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 삭제되었습니더.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void qnaUpdate(QnaBoardDTO dto) {
		conn = getConnection();
		sql = "update qnaboard set qna_subject = ?, qna_content = ? where qna_num = ? and m_id = ? and qna_pass = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQnaSubject());
			pstmt.setString(2, dto.getQnaContent());
			pstmt.setInt(3, dto.getQnaNum());
			pstmt.setString(4, dto.getmId());
			pstmt.setString(5, dto.getQnaPass());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 게시물이 수정되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public QnaBoardDTO QnaSelectAll(String num) {
		QnaBoardDTO dto = new QnaBoardDTO();
		conn = getConnection();
		sql = "select " + COLUMNS + " from qnaboard where qna_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setQnaNum(rs.getInt("Qna_Num"));
				dto.setmId(rs.getString("M_Id"));
				dto.setQnaName(rs.getString("Qna_Name"));
				dto.setQnaSubject(rs.getString("Qna_Subject"));
				dto.setQnaContent(rs.getString("Qna_Content"));
				dto.setQnaPass(rs.getString("Qna_Pass"));
				dto.setIpAddr(rs.getString("Ip_addr"));
				dto.setQnaDate(rs.getTimestamp("Qna_Date"));
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
	
	public int qnaCount() {
		int i = 0;
		conn = getConnection();
		sql = "select count(*) from qnaboard";
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
	
	public List<QnaBoardDTO> qnaSelectAll(int page, int limit) {
		List<QnaBoardDTO> list = new ArrayList<QnaBoardDTO>();
		int startRow = (page - 1) * limit + 1;
	    int endRow = startRow + limit -1;
	    
	    conn = getConnection();
	    sql = "select * from (select rownum rn, " + COLUMNS + " from (select " + COLUMNS + " from qnaboard order by qna_num desc)) where rn between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			  pstmt.setInt(1, startRow);
		        pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();
					dto.setQnaNum(rs.getInt("Qna_Num"));
					dto.setmId(rs.getString("M_Id"));
					dto.setQnaName(rs.getString("Qna_Name"));
					dto.setQnaSubject(rs.getString("Qna_Subject"));
					dto.setQnaContent(rs.getString("Qna_Content"));
					dto.setQnaPass(rs.getString("Qna_Pass"));
					dto.setIpAddr(rs.getString("Ip_addr"));
					dto.setQnaDate(rs.getTimestamp("Qna_Date"));
					dto.setReadCount(rs.getInt("Read_Count"));
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
	
	public void insertQnaBoard(QnaBoardDTO dto) {
		conn = getConnection();
		String num = "select nvl(max(qna_num), 0)+1 from qnaboard";
		sql = "insert into qnaboard(" + COLUMNS + ") values((" + num  + "), ?, ?, ?, ?, ?, ?, sysdate, 0)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getQnaName());
			pstmt.setString(3, dto.getQnaSubject());
			pstmt.setString(4, dto.getQnaContent());
			pstmt.setString(5, dto.getQnaPass());
			pstmt.setString(6, dto.getIpAddr());
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
