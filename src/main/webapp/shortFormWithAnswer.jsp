<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="survey.SurveyDAO"%>
<%@ page import="survey.SurveyFormElementDTO"%>
<%@ page import="survey.SurveyRadioElementsDTO"%>
<%@ page import="java.util.ArrayList"%>


<%
request.setCharacterEncoding("UTF-8");
SurveyFormElementDTO surveyForm = (SurveyFormElementDTO) request.getAttribute("surveyForm");

String location = surveyForm.getLocation();
String formType = surveyForm.getFormType();
String questionValue = surveyForm.getQuestionValue();

SurveyDAO surverDAO = new SurveyDAO();

String surveyCode = request.getParameter("surveyCode");
String email = request.getParameter("email");

String shortAnswer = surverDAO.getShortAnswer(surveyCode, email, location);

%>
<div class="form-container">
	<h3><%=questionValue%></h3>
	<div class="form-container">
		<p><%=shortAnswer%></p>
	</div>
</div>