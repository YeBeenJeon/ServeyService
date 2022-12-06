package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	public DBConnPool () {
				
		try {
			// 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 개념이 Context.
			Context initCtx = new InitialContext();
			// lookup Method에 이름을 건네 원하는 객체를 찾아온다.
			// "java:comp/env" 는 APP의 루트 디렉토리이다.
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			// 건넨 이름 아래 위치한 dbcp_mysql_Survey 자원을 얻어온다.
			DataSource source = (DataSource)ctx.lookup("dbcp_mysql_Survey");
			
			conn = source.getConnection();
			
//			System.out.println("DB Connection Pool Complete!!!");
			
		} catch (Exception e){
			e.printStackTrace();
		}
				
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(conn!=null) conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
