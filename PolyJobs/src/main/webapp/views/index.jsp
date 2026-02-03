<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ - VPT Jobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
		<div class="container">
			<a class="navbar-brand fw-bold" href="home">POLY JOBS</a>
			<div class="navbar-nav ms-auto">
				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<div class="dropdown">
							<button class="btn btn-dark dropdown-toggle" type="button"
								data-bs-toggle="dropdown">Chào, ${user.fullname}</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="history">Lịch sử ứng
										tuyển</a></li>
								<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
							</ul>
						</div>
						<script
							src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
					</c:when>
					<c:otherwise>
						<a class="nav-item nav-link" href="login">Đăng nhập</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

	<c:if test="${not empty message}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			${message}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>

	<c:if test="${not empty error}">
		<div class="alert alert-danger" role="alert">${error}</div>
	</c:if>
	<div class="container">
		<h2 class="mb-4 text-primary">🔥 Việc làm tuyển gấp</h2>

		<div class="row">
			<c:forEach var="item" items="${jobs}">
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="${item.poster}" class="card-img-top" alt="logo"
							style="height: 180px; object-fit: cover;">
						<div class="card-body">
							<h5 class="card-title text-uppercase fw-bold">${item.title}</h5>
							<p class="text-danger fw-bold">Lương: $${item.salary}</p>
							<p class="card-text text-truncate">${item.description}</p>
						</div>
						<div
							class="card-footer bg-white border-top-0 d-flex justify-content-between">
							<a href="detail?id=${item.id}"
								class="btn btn-outline-primary btn-sm">Chi tiết</a> <a
								href="apply?jobId=${item.id}" class="btn btn-success btn-sm">Ứng
								tuyển</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer class="text-center py-4 mt-5 bg-white border-top">
		<p class="text-muted">© 2026 VPT Jobs</p>
	</footer>
</body>
</html>