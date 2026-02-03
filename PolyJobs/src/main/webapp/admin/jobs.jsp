<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Việc làm - VPT Jobs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/admin.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="/admin/sidebar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold text-dark">Quản lý Tin tuyển dụng</h4>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-light border shadow-sm">
                    <i class="bi bi-box-arrow-up-right"></i> Xem trang web
                </a>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-pencil-square text-primary"></i> Thông tin Job</span>
                            <a href="${pageContext.request.contextPath}/admin/job/reset" class="btn btn-sm btn-light border">Làm mới</a>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/job" method="post">
                                <div class="mb-3">
                                    <label class="form-label text-muted fw-bold small">Mã công việc (ID)</label>
                                    <input type="text" name="id" class="form-control" value="${job.id}" placeholder="VD: JOB01" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label text-muted fw-bold small">Tiêu đề tuyển dụng</label>
                                    <input type="text" name="title" class="form-control" value="${job.title}" required>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-6">
                                        <label class="form-label text-muted fw-bold small">Mức lương ($)</label>
                                        <input type="number" name="salary" class="form-control" value="${job.salary}">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label text-muted fw-bold small">Trạng thái</label>
                                        <select name="active" class="form-select">
                                            <option value="true" ${job.active ? 'selected' : ''}>Đang tuyển</option>
                                            <option value="false" ${!job.active ? 'selected' : ''}>Đã đóng</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label text-muted fw-bold small">Poster (Link ảnh)</label>
                                    <input type="text" name="poster" class="form-control" value="${job.poster}" placeholder="https://...">
                                    <c:if test="${not empty job.poster}">
                                        <img src="${job.poster}" class="mt-2 rounded border" style="height: 60px;">
                                    </c:if>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label text-muted fw-bold small">Mô tả chi tiết</label>
                                    <textarea name="description" class="form-control" rows="4">${job.description}</textarea>
                                </div>

                                <div class="d-grid gap-2">
                                    <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/create" class="btn btn-primary fw-bold"><i class="bi bi-plus-lg"></i> Thêm mới</button>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/update" class="btn btn-warning w-100 fw-bold text-white"><i class="bi bi-save"></i> Cập nhật</button>
                                        </div>
                                        <div class="col-6">
                                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/delete" class="btn btn-danger w-100 fw-bold"><i class="bi bi-trash"></i> Xóa</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-list-ul text-primary"></i> Danh sách việc làm</span>
                            <span class="badge bg-primary rounded-pill">${jobs.size()} Jobs</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-pro table-hover align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th class="ps-3">Job Title</th>
                                            <th>Lương</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${jobs}">
                                            <tr>
                                                <td class="ps-3">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${item.poster}" class="rounded border me-2" style="width: 40px; height: 40px; object-fit: cover;">
                                                        <div>
                                                            <div class="fw-bold text-dark">${item.title}</div>
                                                            <small class="text-muted">ID: ${item.id}</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-success">$${item.salary}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${item.active}">
                                                            <span class="badge bg-success bg-opacity-10 text-success border border-success px-2 py-1">Active</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary bg-opacity-10 text-secondary border border-secondary px-2 py-1">Closed</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/job/edit?id=${item.id}" class="btn btn-sm btn-outline-primary border-0 rounded-circle shadow-sm" title="Sửa">
                                                        <i class="bi bi-pencil-fill"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div> </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>