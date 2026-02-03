<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${job.title}- Poly Jobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.job-header {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	margin-top: -50px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.banner {
	height: 250px;
	background: #004a99;
	object-fit: cover;
	width: 100%;
}
</style>
</head>
<body class="bg-light">

	<nav class="navbar navbar-dark bg-dark p-3">
		<div class="container">
			<a class="navbar-brand fw-bold" href="home">POLY JOBS</a>
		</div>
	</nav>

	<img src="${job.poster}" class="banner" alt="Banner">

	<div class="container mb-5">
		<div class="job-header">
			<div class="row align-items-center">
				<div class="col-md-8">
					<h1 class="fw-bold">${job.title}</h1>
					<p class="text-muted">
						<i class="bi bi-geo-alt"></i> Hồ Chí Minh | <span
							class="text-danger fw-bold">Lương: $${job.salary}</span>
					</p>
				</div>
				<div class="col-md-4 text-end">
					<a href="apply?jobId=${job.id}" class="btn btn-success btn-lg px-5 fw-bold">ỨNG TUYỂN NGAY</a>
					<div class="mt-2">
						<a href="#" class="text-decoration-none me-3">Chia sẻ</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-md-8">
				<div class="card p-4 border-0 shadow-sm">
					<h4 class="fw-bold mb-3 border-bottom pb-2">Mô tả công việc</h4>
					<p style="white-space: pre-line;">${job.description}</p>

					<h4 class="fw-bold mt-4 mb-3 border-bottom pb-2">Yêu cầu ứng
						viên</h4>
					<ul>
						<li>Thành thạo công nghệ được yêu cầu.</li>
						<li>Có tinh thần trách nhiệm cao.</li>
						<li>Chịu được áp lực công việc.</li>
					</ul>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card p-3 border-0 shadow-sm mb-3">
					<h5 class="fw-bold">Thông tin chung</h5>
					<p>Ngày đăng: 01/02/2026</p>
					<p>Cấp bậc: Nhân viên</p>
					<p>Hình thức: Toàn thời gian</p>
				</div>
				<div class="card p-3 border-0 shadow-sm">
					<h5 class="fw-bold text-primary text-center">Tại sao chọn
						chúng tôi?</h5>
					<p class="small text-muted">- Môi trường làm việc năng động.</p>
					<p class="small text-muted">- Thưởng tháng 13 và các phúc lợi
						hấp dẫn.</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>