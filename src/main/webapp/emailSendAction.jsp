<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %>

<%@ page import="java.io.PrintWriter" %>
    
<%
	UserDAO userDAO = new UserDAO();
	String userEmail = (String) session.getAttribute("userEmail");
	
	if(userEmail == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Login Please');");
		script.println("location.href = 'userLogin.jsp;'");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean emailChecked = userDAO.getUserEmailChecked(userEmail);
	
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Already Checked!!');");
		script.println("location.href = 'userLogin.jsp;'");
		script.println("</script>");
		script.close();
		return;
	}
	
	
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>