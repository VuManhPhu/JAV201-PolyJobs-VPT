<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng - VPT Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/admin.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="/admin/sidebar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold text-dark">Quản lý Tài khoản</h4>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-light border shadow-sm">
                    <i class="bi bi-house"></i> Trang chủ
                </a>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-person-gear text-primary"></i> Cập nhật User</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/users" method="post">
                                <div class="mb-3">
                                    <label class="form-label small fw-bold text-muted">ID / Username</label>
                                    <input type="text" name="id" class="form-control" value="${userEdit.id}" readonly placeholder="Chọn user từ danh sách...">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label small fw-bold text-muted">Họ và tên</label>
                                    <input type="text" name="fullname" class="form-control" value="${userEdit.fullname}" required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label small fw-bold text-muted">Email</label>
                                    <input type="email" name="email" class="form-control" value="${userEdit.email}" required>
                                </div>
                                
                                <div class="p-3 bg-light rounded border mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="admin" id="isAdmin" ${userEdit.admin ? 'checked' : ''}>
                                        <label class="form-check-label fw-bold" for="isAdmin">Cấp quyền Admin</label>
                                    </div>
                                    <small class="text-muted d-block mt-1">Admin có toàn quyền quản lý hệ thống.</small>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 fw-bold">
                                    <i class="bi bi-save"></i> LƯU THAY ĐỔI
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-people text-primary"></i> Danh sách người dùng</span>
                            <span class="badge bg-primary rounded-pill">${users.size()}</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="bg-light">
                                        <tr>
                                            <th class="ps-3">Họ tên</th>
                                            <th>Email</th>
                                            <th>Vai trò</th>
                                            <th class="text-end pe-3">Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="u" items="${users}">
                                            <tr>
                                                <td class="ps-3 fw-bold">${u.fullname}</td>
                                                <td class="text-muted small">${u.email}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${u.admin}">
                                                            <span class="badge bg-danger bg-opacity-10 text-danger border border-danger px-2">ADMIN</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-secondary bg-opacity-10 text-secondary border px-2">USER</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-end pe-3">
                                                    <a href="users?edit=true&id=${u.id}" class="btn btn-sm btn-outline-primary border-0 bg-light">
                                                        <i class="bi bi-pencil-fill"></i> Sửa
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
            </div>
        </div>
    </div>
</body>
</html>