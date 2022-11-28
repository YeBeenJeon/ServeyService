<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.RandomString" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String userEmail = request.getParameter("userEmail");
	String userPassword = request.getParameter("userPassword");
	String userEmailRandomgString = new RandomString().generateRandomString();
	
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.join(new UserDTO(userEmail, userPassword, userEmailRandomgString, false));
	
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Exit Email!!')");
		script.println("</script>");
		script.close();
	}
	else {
		session.setAttribute("userEmail", userEmail);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
	}
	
%>