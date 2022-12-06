package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.UserDTO;
import util.DBConnPool;

public class SurveyDAO {

	public ArrayList<SurveyInfoDTO> getSurveyInfo(String userEmail) {
		String SQL = "SELECT title, surveyCode, lastModifyTime FROM surveyInfo WHERE userEmail = ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();
		ResultSet rs = null;

		ArrayList<SurveyInfoDTO> surveyInfos = new ArrayList<SurveyInfoDTO>();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				surveyInfos.add(new SurveyInfoDTO(rs.getString("title"), rs.getString("surveyCode"),
						rs.getString("lastModifyTime")));
			}
//			System.out.println(surveyInfos.toString());
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
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return surveyInfos;
	}

	public void setFormTitle(String surveyCode, String title) {
		String SQL = "UPDATE surveyInfo SET title=?, lastModifyTime=now() WHERE surveyCode = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();

		try {

			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, surveyCode);

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

	public int insertQuestion(String surveyCode, String location, String formType, String value) {

		String SQL = "INSERT INTO questions (surveyCode, location, formType, value) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();

		try {

			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, surveyCode);
			pstmt.setString(2, location);
			pstmt.setString(3, formType);
			pstmt.setString(4, value);

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

	public int insertElement(String surveyCode, String location, String formType, String elementNum, String value) {

		String SQL = "INSERT INTO elements (surveyCode, location, formType, elementNum, value) values(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();

		try {

			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, surveyCode);
			pstmt.setString(2, location);
			pstmt.setString(3, formType);
			pstmt.setString(4, elementNum);
			pstmt.setString(5, value);

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

	public int clearSurvey(String surveyCode) {

		String SQL1 = "DELETE FROM elements WHERE surveyCode=?";
		String SQL2 = "DELETE FROM questions WHERE surveyCode=?";
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		DBConnPool dbcp = new DBConnPool();

		try {

			conn = dbcp.conn;
			pstmt1 = conn.prepareStatement(SQL1);
			pstmt2 = conn.prepareStatement(SQL2);
			pstmt1.setString(1, surveyCode);
			pstmt2.setString(1, surveyCode);

			return (pstmt1.executeUpdate() & pstmt2.executeUpdate());

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
				if (pstmt1 != null)
					pstmt1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt2 != null)
					pstmt2.close();
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

	/*
	 * TODO 1. question 목록 가져오기 2. 목록을 돌아보면서 location에 해당하는 element 저장하기
	 */

	public ArrayList<SurveyFormElementDTO> getSurveyFormElement(String surveyCode) {

		String SQL = "SELECT location, formType, value FROM questions where surveyCode = ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();
		ResultSet rs = null;

		ArrayList<SurveyFormElementDTO> surveyForms = new ArrayList<SurveyFormElementDTO>();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, surveyCode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (rs.getString("formType").equals("radio")) {
					surveyForms.add(new SurveyFormElementDTO(rs.getString("location"), rs.getString("formType"),
							rs.getString("value"), this.getSurveyRadioElement(surveyCode, rs.getString("location"))));
				} else {
					surveyForms.add(new SurveyFormElementDTO(rs.getString("location"), rs.getString("formType"),
							rs.getString("value"), null));
				}
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
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return surveyForms;

	}

	public ArrayList<SurveyRadioElementsDTO> getSurveyRadioElement(String surveyCode, String location) {

		String SQL = "SELECT elementNum, value FROM elements where surveyCode = ? and location=?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBConnPool dbcp = new DBConnPool();
		ResultSet rs = null;

		ArrayList<SurveyRadioElementsDTO> radioElements = new ArrayList<SurveyRadioElementsDTO>();

		try {
			conn = dbcp.conn;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, surveyCode);
			pstmt.setString(2, location);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				radioElements.add(new SurveyRadioElementsDTO(rs.getString("elementNum"), rs.getString("value")));

			}
//			System.out.println(surveyInfos.toString());
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
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return radioElements;

	}

}
