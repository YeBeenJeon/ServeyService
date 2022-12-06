<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="survey.SurveyDAO"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%
request.setCharacterEncoding("UTF-8");

String userEmail = (String) session.getAttribute("userEmail");
String surveyCode = request.getParameter("code");

Map<String, String[]> params = request.getParameterMap();
Set<String> keySet = params.keySet();

String[] answerInfo = null;

String location = null;
String formType = null;
String elementNum = null;
String value = null;

SurveyDAO surveyDAO = new SurveyDAO();

surveyDAO.clearSurveyAnswer(userEmail, surveyCode);

for (String key : keySet) {
	if (key.equals("code"))
		continue;

	System.out.println(key + " -> " + params.get(key)[0]);
	answerInfo = key.split("-");

	location = answerInfo[0];
	formType = answerInfo[1];
	elementNum = answerInfo[2];
	value = params.get(key)[0];

	surveyDAO.insertAnswer(userEmail, surveyCode, location, formType, elementNum, value);

}

String notice = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>formViewController</title>
<!-- bootstrap css insert -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Custom CSS insert -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">제출 성공</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-center mt-2">
						<button type="button" class="btn-login my-1"
							onclick="location.href='main.jsp'">Go Main</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

	<script>
		const myModal = new bootstrap.Modal('#exampleModal')
		myModal.show();
	</script>

</body>
</html>