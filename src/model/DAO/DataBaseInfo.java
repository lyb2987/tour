package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DataBaseInfo {

	String jdbcDriver;			// JDBC CLASS 정보
	String jdbcUrl;				// DB서버 정보
	Connection conn;			// DB서버에 연걸정보
	PreparedStatement pstmt;	// DB에 SQL문 전송
	String sql;
	ResultSet rs;
	
	public DataBaseInfo(){
		this.jdbcDriver = "oracle.jdbc.driver.OracleDriver"; 
		this.jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";		

	}
	
	public Connection getConnection(){
		Connection con = null;
		// 클래스 보유여부를 파악하고 없으면 exception 반환
		try {
			Class.forName(jdbcDriver);
			con = DriverManager.getConnection(jdbcUrl, "tour", "tour");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close() {
		if(rs != null) {
			try {rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		if(pstmt != null) {
			try {pstmt.close();}catch (Exception e) {e.printStackTrace();}
		}
		if(conn != null) {
			try {conn.close();}catch (Exception e) {e.printStackTrace();}
		}
		
	}
	
	public void increaseReadCount(String tName, String num) {
		conn = getConnection();
		sql = "update " + tName +  " set read_count = read_count + 1 where board_num = " + num;
		try {
			pstmt = conn.prepareStatement(sql);
			
			int i = pstmt.executeUpdate();
			System.out.println(tName + "테이블의 " + num + "번 게시물의 " + i + "조회수가 증가 되었습니다.");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public void qnaincreaseReadCount(String num, String tName) {
		conn = getConnection();
		sql = "update " + tName +  " set read_count = read_count + 1 where qna_num = " + num;
		try {
			pstmt = conn.prepareStatement(sql);
			
			int i = pstmt.executeUpdate();
			System.out.println(tName + "테이블의 " + num + "번 게시물의  조회수가 " + i + "증가 되었습니다.");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
	public void reviewincreaseReadCount(String num, String tName) {
		conn = getConnection();
		sql = "update " + tName +  " set read_count = read_count + 1 where review_num = " + num;
		try {
			pstmt = conn.prepareStatement(sql);
			
			int i = pstmt.executeUpdate();
			System.out.println(tName + "테이블의 " + num + "번 게시물의 " + i + "조회수가 증가 되었습니다.");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
	}
	
}
