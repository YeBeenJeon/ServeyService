<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="survey.SurveyDAO"%>

<%
String notice = null;
String url = null;
boolean isAlert = false;

String userEmail = (String) session.getAttribute("userEmail");

if (userEmail == null) {
	notice = "Login Please!!";
	url = "userLogin.jsp";
	isAlert = true;
} else {
	UserDAO userDAO = new UserDAO();
	if (userDAO.getUserEmailChecked(userEmail) == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
	}
}

request.setCharacterEncoding("UTF-8");

String surveyCode = request.getParameter("surveyCode");

ArrayList<String> emailList = new SurveyDAO().getResponseList(surveyCode);

String shareURL = "localhost:8080/SurveyService/formView.jsp?surveyCode=" + surveyCode;
String responseURL = "responseList.jsp?surveyCode=" + surveyCode;
String responseViewURL = "responseView.jsp?surveyCode=" + surveyCode;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>responseView.jsp</title>
<!-- bootstrap css insert -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Custom CSS insert -->
<link rel="stylesheet" href="./css/custom.css?after">
</head>
<body>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
	<script src="./js/makeSurvey.js?after"></script>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="./img/surveys-icon.png" alt="Survey" width="30" height="30"
				class="d-inline-block align-text-top"> <span>Survey
					Service</span>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarToggler"
				aria-controls="navbarToggler" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarToggler">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="#">Home</a></li>
					<%
					if (userEmail == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="userLogin.jsp">Login</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="userLogout.jsp">Logout</a></li>
					<%
					}
					%>
				</ul>
				<div class="d-flex pt-2">
					<a class="nav-link btn btn-link mx-3" aria-current="page"
						onclick="clickShare()">Share</a> <a
						class="nav-link btn btn-link me-5" aria-current="page"
						href="<%=responseURL%>">Response</a>
					<p>
						<%
						if (userEmail != null) {
						%>
						<span><%=userEmail%></span>
						<%
						}
						%>
					</p>
				</div>
			</div>
		</div>
	</nav>

	<section class="container mt-3" style="width: 55%;">

		<div class="form-container" style="text-align: center;">
			<h3>Response List</h3>
			<br>
			<%
			for (String email : emailList) {
			%>
			<button type="button" class="btn btn-outline-secondary m-2"
				onclick="emailClick('<%=email%>')"><%=email%></button>
			<br>
			<%
			}
			%>
		</div>

	</section>


	<footer class="py-3 my-4">
		<p class="text-center text-muted">© 2022 YeBeen, Jeon</p>
	</footer>

	<!-- Alert Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Notice</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"><%=notice%></div>
			</div>
		</div>
	</div>

	<!-- Share Modal -->
	<div class="modal fade" id="shareModal" tabindex="-1"
		aria-labelledby="shareModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="shareModalLabel">Share</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h4>공유 주소</h4>
					<p><%=shareURL%>
					<p>
				</div>
			</div>
		</div>
	</div>

	<script>
		if(<%=isAlert%> == true) {
			const exModal = new bootstrap.Modal('#exampleModal')
			exModal.show();
			let url = "<%=url%>";
			setTimeout(() => location.href = url, 2000);
		}
		function emailClick(email) {
			var url = "<%=responseViewURL%>" + "&email=" + email;
			location.href= url;
		}
	</script>
</body>

</html>