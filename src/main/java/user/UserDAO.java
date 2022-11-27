package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnPool;

public class UserDAO {
	
	public int join (UserDTO user) {
		
		String SQL = "insert into user (userEmail, userPassword, userEmailRandomString, userEmailChecked) values(?,?,?, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();
		
		try {
			
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmailRandomString());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			try {
				if(conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(dbcp != null) dbcp.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return -1;
	}
	
	public boolean getUserEmailChecked(String userEmail) {
		String SQL = "select userEmailChecked from user where userEmail=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnPool dbcp = new DBConnPool();
		
		try {
			
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			try {
				if(conn != null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(dbcp != null) dbcp.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}

}
