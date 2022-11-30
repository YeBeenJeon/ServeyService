<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="nav-item"><a class="nav-link" href="userLogin.jsp">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="container mt-5" style="max-width: 560px;">
		<div class="login-form">
			<div class="m-5 text-center">
				<h1>Survey</h1>
			</div>
			<form method="post" action="./userRegisterController.jsp">
				<div class="input-group mb-3">
					<input type="text" class="form-control border-dark"
						placeholder="Email" aria-label="Email"
						aria-describedby="basic-addon1" name="userEmail">
				</div>
				<div class="input-group mb-3">
					<input type="password" class="form-control border-dark"
						placeholder="Password" aria-label="Password"
						aria-describedby="basic-addon1" name="userPassword">
				</div>
				<div class="d-flex justify-content-center mt-5">
					<button type="submit" class="btn-login my-1">회원 가입</button>
				</div>
			</form>
		</div>

	</section>
	<footer class="py-3 my-4">
		<p class="text-center text-muted">© 2022 YeBeen, Jeon</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

</body>
</html>