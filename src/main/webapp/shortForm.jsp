<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="survey.SurveyFormElementDTO"%>
<%@ page import="survey.SurveyRadioElementsDTO"%>
<%@ page import="java.util.ArrayList"%>


<%
request.setCharacterEncoding("UTF-8");
SurveyFormElementDTO surveyForm = (SurveyFormElementDTO) request.getAttribute("surveyForm");

String location = surveyForm.getLocation();
String formType = surveyForm.getFormType();
String questionValue = surveyForm.getQuestionValue();
%>
<div class="form-container">
	<div class="form-floating">
		<h3><%=questionValue%></h3>
	</div>
	<input type="text" class="form-control" placeholder="Answer"
		aria-label="Answer" name="<%=location%>-short-Answer-1">
</div>