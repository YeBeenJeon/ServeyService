<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>

<%
request.setCharacterEncoding("UTF-8");

String userEmail = (String) session.getAttribute("userEmail");
String notice = null;
String url = null;

if (userEmail == null) {
	notice = "Login Please";
	url = "userLogin.jsp";
}

UserDAO userDAO = new UserDAO();

String code = null;
code = request.getParameter("code");

if (code == null) {
	notice = "잘못된 접근입니다!";
	url = "userLogin.jsp";
} else {
	boolean isRight = (userDAO.getuserEmailRandomString(userEmail).equals(code)) ? true : false;

	if (isRight == true) {
		userDAO.setUserEmailChecked(userEmail);
		notice = "인증에 성공했습니다.";
		url = "main.jsp";

	} else {
		notice = "유효하지 않은 코드입니다";
		url = "userLogin.jsp";
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
				<div class="modal-body"><%=notice %></div>
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
		let url = "<%=url%>";
		setTimeout(() => location.href = url, 3000);
	</script>

</body>
</html>