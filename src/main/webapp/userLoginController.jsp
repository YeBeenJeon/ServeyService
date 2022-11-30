<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("UTF-8");
String notice = null;
String url = null;

String userEmail = request.getParameter("userEmail");
String userPassword = request.getParameter("userPassword");

if (userEmail.isEmpty() || userPassword.isEmpty()) {
	notice = "내용을 입력하세요";
	url = "userJoin.jsp";
} else {

	UserDAO userDAO = new UserDAO();

	int result = userDAO.login(userEmail, userPassword);

	if (result == 1) {
		session.setAttribute("userEmail", userEmail);
		System.out.println("Login Success!!!");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		script.close();
	}
	else if (result == -1) {
		notice = "이메일 혹은 비밀번호를 확인해주세요!";
		url = "userLogin.jsp";
	}
	else {
		notice = "Error!!!";
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
		const myModal = new bootstrap.Modal('#exampleModal')
		myModal.show();
		let url = "<%=url%>";
		setTimeout(() => location.href = url, 2000);
	</script>

</body>
</html>