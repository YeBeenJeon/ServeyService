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
ArrayList<SurveyRadioElementsDTO> radioElements = surveyForm.getElements();

SurveyDAO surverDAO = new SurveyDAO();

String surveyCode = request.getParameter("surveyCode");
String email = request.getParameter("email");

ArrayList<String> radioAnswer = surverDAO.getRadioAnswer(surveyCode, email, location);

%>
<div class="form-container">
	<div class="form-floating">
		<h3><%=questionValue%></h3>
	</div>

	<div class="form-check">
		<%
		for (SurveyRadioElementsDTO radioElement : radioElements) {
		%>
		<input class="form-check-input" type="checkbox"
			id="<%=location%>-radio-Answer-<%=radioElement.getElementNum()%>"
			name="<%=location%>-radio-Answer-<%=radioElement.getElementNum()%>"
			value="<%=radioElement.getValue()%>" disabled
			<%if (radioAnswer.contains(radioElement.getValue())) {%> checked
			<%}%> /> <label class="form-check-label"
			for="<%=location%>-radio-Answer-<%=radioElement.getElementNum()%>"><%=radioElement.getValue()%></label><br>
		<%
		}
		%>
	</div>

</div>