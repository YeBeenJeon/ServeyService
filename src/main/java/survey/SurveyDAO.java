package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.UserDTO;
import util.DBConnPool;

public class SurveyDAO {

	public ArrayList<SurveyInfoDTO> getSurveyInfo(String userEmail) {
		String SQL = "SELECT title, surveyCode, lastModifyTime FROM surveyInfo WHERE userEmail=?;";
		DBConnPool dbcp = new DBConnPool();
		ResultSet rs = null;

		ArrayList<SurveyInfoDTO> surveyInfos = new ArrayList<SurveyInfoDTO>();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, userEmail);
			rs = dbcp.psmt.executeQuery();

			while (rs.next()) {
				surveyInfos.add(new SurveyInfoDTO(rs.getString("title"), rs.getString("surveyCode"),
						rs.getString("lastModifyTime")));
			}
//			System.out.println(surveyInfos.toString());
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return surveyInfos;
	}

	public void setFormTitle(String surveyCode, String title) {
		String SQL = "UPDATE surveyInfo SET title=?, lastModifyTime=now() WHERE surveyCode = ?";
		DBConnPool dbcp = new DBConnPool();

		try {

			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, title);
			dbcp.psmt.setString(2, surveyCode);

			dbcp.psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return;
	}

	public String getFormTitle(String surveyCode) {
		String SQL = "SELECT title FROM surveyInfo WHERE surveyCode = ?";
		DBConnPool dbcp = new DBConnPool();

		String title = null;

		try {

			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);

			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next())
				title = dbcp.rs.getString("title");

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return title;
	}

	public int insertQuestion(String surveyCode, String location, String formType, String value) {

		String SQL = "INSERT INTO questions (surveyCode, location, formType, value) values(?,?,?,?)";
		DBConnPool dbcp = new DBConnPool();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, location);
			dbcp.psmt.setString(3, formType);
			dbcp.psmt.setString(4, value);

			return dbcp.psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
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
		DBConnPool dbcp = new DBConnPool();

		try {

			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, location);
			dbcp.psmt.setString(3, formType);
			dbcp.psmt.setString(4, elementNum);
			dbcp.psmt.setString(5, value);

			return dbcp.psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

	public int insertAnswer(String userEmail, String surveyCode, String location, String formType, String elementNum,
			String value) {

		String SQL = "INSERT INTO answers (userEmail, surveyCode, location, formType, elementNum, value) values(?,?,?,?,?,?)";
		DBConnPool dbcp = new DBConnPool();

		try {

			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, userEmail);
			dbcp.psmt.setString(2, surveyCode);
			dbcp.psmt.setString(3, location);
			dbcp.psmt.setString(4, formType);
			dbcp.psmt.setString(5, elementNum);
			dbcp.psmt.setString(6, value);

			return dbcp.psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
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
		DBConnPool dbcp1 = new DBConnPool();
		DBConnPool dbcp2 = new DBConnPool();

		try {

			dbcp1.psmt = dbcp1.conn.prepareStatement(SQL1);
			dbcp2.psmt = dbcp2.conn.prepareStatement(SQL2);
			dbcp1.psmt.setString(1, surveyCode);
			dbcp2.psmt.setString(1, surveyCode);

			return (dbcp1.psmt.executeUpdate() & dbcp2.psmt.executeUpdate());

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp1 != null)
					dbcp1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (dbcp2 != null)
					dbcp2.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

	public int clearSurveyAnswer(String userEmail, String surveyCode) {

		String SQL1 = "DELETE FROM answers WHERE surveyCode=? and userEmail=?";
		DBConnPool dbcp = new DBConnPool();

		try {

			dbcp.psmt = dbcp.conn.prepareStatement(SQL1);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, userEmail);

			return dbcp.psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

	public ArrayList<SurveyFormElementDTO> getSurveyFormElement(String surveyCode) {

		String SQL = "SELECT location, formType, value FROM questions where surveyCode = ?;";
		DBConnPool dbcp = new DBConnPool();

		ArrayList<SurveyFormElementDTO> surveyForms = new ArrayList<SurveyFormElementDTO>();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next()) {
				if (dbcp.rs.getString("formType").equals("radio")) {
					surveyForms.add(new SurveyFormElementDTO(dbcp.rs.getString("location"),
							dbcp.rs.getString("formType"), dbcp.rs.getString("value"),
							this.getSurveyRadioElement(surveyCode, dbcp.rs.getString("location"))));
				} else {
					surveyForms.add(new SurveyFormElementDTO(dbcp.rs.getString("location"),
							dbcp.rs.getString("formType"), dbcp.rs.getString("value"), null));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return surveyForms;

	}

	public ArrayList<SurveyRadioElementsDTO> getSurveyRadioElement(String surveyCode, String location) {

		String SQL = "SELECT elementNum, value FROM elements where surveyCode = ? and location=?;";
		DBConnPool dbcp = new DBConnPool();

		ArrayList<SurveyRadioElementsDTO> radioElements = new ArrayList<SurveyRadioElementsDTO>();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, location);
			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next()) {

				radioElements
						.add(new SurveyRadioElementsDTO(dbcp.rs.getString("elementNum"), dbcp.rs.getString("value")));

			}
//			System.out.println(surveyInfos.toString());
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return radioElements;

	}

	public ArrayList<String> getResponseList(String surveyCode) {

		ArrayList<String> emailList = new ArrayList<String>();

		String SQL = "SELECT DISTINCT(userEmail) from answers where surveyCode = ?;";
		DBConnPool dbcp = new DBConnPool();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next()) {

				emailList.add(dbcp.rs.getString("userEmail"));

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return emailList;
	}

	public String getShortAnswer(String surveyCode, String email, String location) {

		String shortAnswer = null;

		String SQL = "SELECT value from answers where surveyCode = ? and userEmail = ? and location = ?;";
		DBConnPool dbcp = new DBConnPool();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, email);
			dbcp.psmt.setString(3, location);
			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next()) {

				shortAnswer = dbcp.rs.getString("value");

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return shortAnswer;
	}

	public ArrayList<String> getRadioAnswer(String surveyCode, String email, String location) {

		ArrayList<String> radioAnswer = new ArrayList<String>();

		String SQL = "SELECT value from answers where surveyCode = ? and userEmail = ? and location = ?;";
		DBConnPool dbcp = new DBConnPool();

		try {
			dbcp.psmt = dbcp.conn.prepareStatement(SQL);
			dbcp.psmt.setString(1, surveyCode);
			dbcp.psmt.setString(2, email);
			dbcp.psmt.setString(3, location);
			dbcp.rs = dbcp.psmt.executeQuery();

			while (dbcp.rs.next()) {

				radioAnswer.add(dbcp.rs.getString("value"));

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (dbcp != null)
					dbcp.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return radioAnswer;
	}

	public int deleteForm(String surveyCode) {

		String SQL1 = "DELETE FROM elements WHERE surveyCode=?";
		String SQL2 = "DELETE FROM questions WHERE surveyCode=?";
		String SQL3 = "DELETE FROM surveyInfo WHERE surveyCode=?";
		String SQL4 = "DELETE FROM answers WHERE surveyCode=?";

		DBConnPool dbcp1 = new DBConnPool();

		try {

			dbcp1.psmt = dbcp1.conn.prepareStatement(SQL1);
			dbcp1.psmt.setString(1, surveyCode);
			dbcp1.psmt.executeUpdate();
			
			dbcp1.psmt = dbcp1.conn.prepareStatement(SQL2);
			dbcp1.psmt.setString(1, surveyCode);
			dbcp1.psmt.executeUpdate();
			
			dbcp1.psmt = dbcp1.conn.prepareStatement(SQL3);
			dbcp1.psmt.setString(1, surveyCode);
			dbcp1.psmt.executeUpdate();
			
			dbcp1.psmt = dbcp1.conn.prepareStatement(SQL4);
			dbcp1.psmt.setString(1, surveyCode);
			dbcp1.psmt.executeUpdate();

			return 1;

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			try {
				if (dbcp1 != null)
					dbcp1.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return -1;
	}

}
