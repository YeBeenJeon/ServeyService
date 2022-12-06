<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO"%>
<%@ page import="survey.SurveyFormElementDTO"%>

<%
request.setCharacterEncoding("UTF-8");

String surveyCode = request.getParameter("surveyCode");

SurveyDAO surveyDAO = new SurveyDAO();

ArrayList<SurveyFormElementDTO> surveyForms = new ArrayList<SurveyFormElementDTO>();

surveyForms = surveyDAO.getSurveyFormElement(surveyCode);

System.out.println(surveyForms.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form View</title>
</head>
<body>
	<h1><%=surveyCode%></h1>
</body>
</html>