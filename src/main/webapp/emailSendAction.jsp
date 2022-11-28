<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>

<%@ page import="java.util.Properties"%>
<%@ page import="util.Gmail"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
UserDAO userDAO = new UserDAO();
String userEmail = (String) session.getAttribute("userEmail");

String notice = null;
String url = null;

if (userEmail == null) {
	notice = "Login Please";
	url = "userLogin.jsp";
}

boolean emailChecked = userDAO.getUserEmailChecked(userEmail);

if (emailChecked == true) {
	notice = "Already Checked!!";
	url = "userLogin.jsp";
} else {
	String host = "http://localhost:8080/SurveyService/";
	String from = "dpqls9789@gamil.com";
	String to = userEmail;
	String subject = "Survey 서비스를 위한 이메일 인증 메일입니다.";
	String content = "다음 링크를 통해 이메일 인증을 진행하세요." + "<a href=" + host + "emailCheckAction.jsp?code="
	+ userDAO.getuserEmailRandomString(to) + ">이메일 인증하기</a>";

	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.pot", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset=UTF8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Something Wrong!! In emailSendAction.jsp");
		return;
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

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

	<%
	if (emailChecked == false) {
	%>
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
					<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="container mt-3" style="max-width: 560px;">
		<div class="alert alert-success" role="alert">이메일 주소 인증 메일이
			정상적으로 발송되었습니다. 회원가입 시 입력했던 이메일을 통해 인증해주세요.</div>
	</section>

	<footer class="py-3 my-4">
		<p class="text-center text-muted">© 2022 YeBeen, Jeon</p>
	</footer>

	<%
	}
	if (emailChecked == true) {
	%>

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

	<script>
		const myModal = new bootstrap.Modal('#exampleModal')
		myModal.show();
		let url = "<%=url%>";
		setTimeout(() => location.href = url, 3000);
	</script>

	<%
	}
	%>

</body>
</html>