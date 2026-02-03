<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập - Poly Jobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f0f2f5;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.card {
	width: 400px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.btn-primary {
	background-color: #ff6600;
	border: none;
}

.btn-primary:hover {
	background-color: #e65c00;
}
</style>
</head>
<body>

	<div class="card p-4">
		<h3 class="text-center mb-4 text-uppercase fw-bold">Poly Jobs
			Login</h3>

		<c:if test="${not empty message}">
			<div class="alert alert-danger" role="alert">${message}</div>
		</c:if>

		<form action="login" method="post">
			<div class="mb-3">
				<label for="username" class="form-label">Tên đăng nhập</label> <input
					type="text" class="form-control" id="username" name="username"
					value="${username}" placeholder="Nhập mã user..." required>
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Mật khẩu</label> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="********" required>
			</div>

			<div class="d-flex justify-content-between mb-3">
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="remember">
					<label class="form-check-label" for="remember">Ghi nhớ?</label>
				</div>
				<a href="#" class="text-decoration-none">Quên mật khẩu?</a>
			</div>

			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary text-white fw-bold">ĐĂNG
					NHẬP</button>
			</div>

			<hr>
			<div class="text-center">
				Chưa có tài khoản? <a href="register" class="text-decoration-none">Đăng
					ký ngay</a>
			</div>
		</form>
	</div>

</body>
</html>