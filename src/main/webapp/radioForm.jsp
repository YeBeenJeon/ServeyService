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
ArrayList<SurveyRadioElementsDTO> radioElements = surveyForm.getElements();
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
			value="<%=radioElement.getValue()%>" /> <label
			class="form-check-label"
			for="<%=location%>-radio-Answer-<%=radioElement.getElementNum()%>"><%=radioElement.getValue()%></label><br>
		<%
		}
		%>
	</div>

</div>