<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử ứng tuyển - Poly Jobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 p-3">
		<div class="container">
			<a class="navbar-brand fw-bold" href="home">POLY JOBS</a>
			<div class="navbar-nav ms-auto">
				<a class="nav-link" href="home">Trang chủ</a> <span
					class="nav-link text-white fw-bold">Xin chào,
					${sessionScope.user.fullname}</span>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="card shadow-sm border-0">
			<div class="card-header bg-white border-bottom-0 pt-4 pb-0">
				<h3 class="text-primary fw-bold">
					<i class="bi bi-clock-history"></i> Lịch sử ứng tuyển
				</h3>
				<p class="text-muted">Danh sách các công việc bạn đã nộp hồ sơ</p>
			</div>
			<div class="card-body">

				<table class="table table-hover align-middle">
					<thead class="table-light">
						<tr>
							<th>Tên công việc</th>
							<th>Ngày nộp</th>
							<th>Mức lương</th>
							<th>Trạng thái</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="app" items="${apps}">
							<tr>
								<td class="fw-bold text-primary">${app.job.title}</td>

								<td><fmt:formatDate value="${app.appliedDate}"
										pattern="dd-MM-yyyy HH:mm" /></td>

								<td>$${app.job.salary}</td>

								<td><c:choose>
										<c:when test="${app.status == 0}">
											<span class="badge bg-warning text-dark">Chờ duyệt</span>
										</c:when>
										<c:when test="${app.status == 1}">
											<span class="badge bg-info">Đang phỏng vấn</span>
										</c:when>
										<c:when test="${app.status == 2}">
											<span class="badge bg-success">Trúng tuyển</span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-secondary">Đã từ chối</span>
										</c:otherwise>
									</c:choose></td>

								<td><a href="detail?id=${app.job.id}"
									class="btn btn-outline-secondary btn-sm">Xem lại Job</a></td>
							</tr>
						</c:forEach>

						<c:if test="${empty apps}">
							<tr>
								<td colspan="5" class="text-center py-4 text-muted">Bạn
									chưa ứng tuyển công việc nào. <a href="home">Tìm việc ngay!</a>
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>