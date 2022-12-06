<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="survey.SurveyDAO"%>


<%

String surveyCode = request.getParameter("surveyCode");

SurveyDAO surveyDAO = new SurveyDAO();

surveyDAO.deleteForm(surveyCode);

PrintWriter script = response.getWriter();
script.println("<script>");
script.println("location.href='main.jsp'");
script.println("</script>");
script.close();
%>