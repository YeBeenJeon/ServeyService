<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
String notice = null;
String url = null;
boolean isAlert = false;
UserDAO userDAO = new UserDAO();

String userEmail = (String) session.getAttribute("userEmail");

if (userEmail == null) {
	notice = "Login Please!!";
	url = "userLogin.jsp";
	isAlert = true;
} else {
	if (userDAO.getUserEmailChecked(userEmail) == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
	}
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>userLogin</title>
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
					<li class="nav-item"><a class="nav-link" href="userLogin.jsp">Logout</a></li>
					<%
					}
					%>
				</ul>
				<div class="d-flex pt-2">
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

	<section class="container mt-5" style="height: 95%;">
		<h1>My Form</h1>
		<div class="d-flex flex-wrap">
			<div class="card m-3" style="width: 18rem;">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png"
					class="card-img-top">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">최근 수정한 날짜</p>
					<a href="#" class="btn btn-primary"
						style="background: #4BAAB3; border: none">Edit</a>
				</div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn card m-3"
				style="width: 18rem; background: #4BAAB3; color: white"
				onclick="clicking()">
				<div class="position-absolute top-50 start-50 translate-middle">
					<h1>\+/</h1>
					<h3>New</h3>
				</div>
			</button>
			<script>
			function clicking() {
			  console.log("HELLO");
			}
			</script>

		</div>
	</section>

	<footer class="py-3 my-4">
		<p class="text-center text-muted">© 2022 YeBeen, Jeon</p>
	</footer>

	<!-- Modal -->
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

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

	<script>
		if(<%=isAlert%> == true) {
			const myModal = new bootstrap.Modal('#exampleModal')
			myModal.show();
			let url = "<%=url%>";
			setTimeout(() => location.href = url, 2000);
		}
	</script>

</body>
</html>