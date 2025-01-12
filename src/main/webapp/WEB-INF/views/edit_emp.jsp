<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	background: linear-gradient(90deg, #ff7e5f, #feb47b);
	background-size: 400% 400%;
	animation: gradientAnimation 15s ease infinite;
}

.navbar-brand {
	font-weight: bold;
}

.card {
	margin-top: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #ff7e5f;
	color: white;
}

table th, table td {
	text-align: center;
	vertical-align: middle;
}

.btn {
	margin: 0 5px;
}

/* Styling the form inputs */
.card-body form .form-control {
	border-radius: 0.5rem;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Styling the Update button to match the navbar's gradient */
.btn-primary {
	background: linear-gradient(90deg, #ff7e5f, #feb47b);
	border: none;
	color: white;
	font-weight: bold;
	border-radius: 0.5rem;
	padding: 10px 20px;
	transition: background 0.3s ease;
}

.btn-primary:hover {
	background: linear-gradient(90deg, #feb47b, #ff7e5f);
}

/* Styling the message (msg) */
.msg-success {
	color: #28a745; /* Green color for success */
	font-weight: bold;
	animation: fadeIn 2s ease-out;
}

.msg-error {
	color: #dc3545; /* Red color for errors */
	font-weight: bold;
	animation: fadeIn 2s ease-out;
}

/* Animation for the background gradient */
@keyframes gradientAnimation {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

/* Fade-in animation for success/error messages */
@keyframes fadeIn {
	0% {
		opacity: 0;
	}
	100% {
		opacity: 1;
	}
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg"
		style="background: linear-gradient(90deg, #ff7e5f, #feb47b);">
		<div class="container-fluid">
			<a class="navbar-brand text-white fw-bold" href="#"
				style="font-size: 1.5rem;">🌟 Emp Management</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent"
				aria-controls="navbarContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon" style="color: white;"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link text-white fw-bold"
						href="home" style="font-size: 1.1rem;"> Home </a></li>
					<li class="nav-item"><a class="nav-link text-white fw-bold"
						href="addEmp" style="font-size: 1.1rem;"> Add Employee </a></li>
					<li class="nav-item"><a class="nav-link text-white fw-bold"
						href="#" style="font-size: 1.1rem;"> About </a></li>
					<li class="nav-item"><a class="nav-link text-white fw-bold"
						href="#" style="font-size: 1.1rem;"> Contact </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center">
						<h3>Edit Employee</h3>

						<c:if test="${not empty msg}">
							<c:choose>
								<c:when test="${msg == 'Success'}">
									<h5 class="msg-success">${msg}</h5>
								</c:when>
								<c:otherwise>
									<h5 class="msg-error">${msg}</h5>
								</c:otherwise>
							</c:choose>
							<c:remove var="msg" />
						</c:if>

					</div>
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/updateEmp"
							method="post">
							<input type="hidden" name="id" value="${emp.id }">
							<div class="mb-3">
								<label>Enter Full Name</label> <input type="text"
									name="fullname" class="form-control" required
									value="${emp.fullname }">
							</div>
							<div class="mb-3">
								<label>Enter Address</label> <input type="text" name="address"
									class="form-control" required value="${emp.address }">
							</div>
							<div class="mb-3">
								<label>Enter Email</label> <input type="email" name="email"
									class="form-control" required value="${emp.email }">
							</div>
							<div class="mb-3">
								<label>Enter Password</label> <input type="password"
									name="password" class="form-control" required
									value="${ emp.password}">
							</div>
							<div class="mb-3">
								<label>Enter Designation</label> <input type="text"
									name="designation" class="form-control" required
									value="${ emp.designation}">
							</div>
							<div class="mb-3">
								<label>Enter Salary</label> <input type="number" name="salary"
									class="form-control" required value="${emp.salary}">
							</div>
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYBbZaErj6vMZkMnQJ6pajs9f/x0j2ns1ikP6JZBljMAXj0s3bGzG1wRj"
		crossorigin="anonymous"></script>
</body>
</html>
