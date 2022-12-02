package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
}
