<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.RandomString"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
String userEmail = (String) session.getAttribute("userEmail");
if (userEmail == null) {
	System.out.println("There is Error");
	return;
}

String surveyCode = new RandomString().generateRandomString(20);

UserDAO userDAO = new UserDAO();
userDAO.setSurveyInfo(userEmail, surveyCode);

PrintWriter script = response.getWriter();
script.println("<script>");
script.println("location.href='makeSurvey.jsp?surveyCode=" + surveyCode +"'");
script.println("</script>");
script.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=surveyCode%></h1>
</body>
</html>
