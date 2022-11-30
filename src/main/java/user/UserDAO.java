package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnPool;
import util.RandomString;

public class UserDAO {

	public int join(UserDTO user) {

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
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

	public int login(String userEmail, String userPassword) {

		String SQL = "SELECT * FROM user WHERE userEmail=? and userPassword=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnPool dbcp = new DBConnPool();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPassword);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("Exit !");
				return 1;
			} else {
				System.out.println("Non Exit Email!");
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return 0;
	}

	public boolean getUserEmailChecked(String userEmail) {
		String SQL = "SELECT userEmailChecked FROM user WHERE userEmail=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnPool dbcp = new DBConnPool();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public String getuserEmailRandomString(String userEmail) {
		String SQL = "select userEmailRandomString from user where userEmail=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBConnPool dbcp = new DBConnPool();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return null;
	}

	public void setUserEmailChecked(String userEmail) {
		String SQL = "UPDATE user SET userEmailChecked=true WHERE userEmail = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();

		try {

			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);

			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return;
	}

	public void generateFormCode(String userEmail) {
		String SQL = "INSERT INTO formCode (userEmail, code) VALUES (?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();

		String code = "1234";
		boolean err = false;

//		do {

			try {

				conn = dbcp.conn;
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userEmail);
				pstmt.setString(2, code);
				pstmt.executeUpdate();
				err = false;

			} catch (Exception e) {
//				code = new RandomString().generateRandomString(15);
				e.printStackTrace();
//				err = true;

			} finally {
				try {
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if (dbcp != null)
						dbcp.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
//		} while (err);

		return;
	}

}
