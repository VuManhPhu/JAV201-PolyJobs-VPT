<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Người dùng - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/guest.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-dark bg-primary mb-4 p-3">
        <div class="container-fluid">
            <span class="navbar-brand fw-bold">QUẢN LÝ NGƯỜI DÙNG</span>
            <div class="d-flex">
                <a href="job/index" class="btn btn-outline-light btn-sm me-2">Quản lý Việc làm</a>
                <a href="report" class="btn btn-outline-light btn-sm me-2">Xem Báo cáo</a>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-light btn-sm me-2">Về Trang chủ</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <c:if test="${not empty message}">
            <div class="alert alert-info text-center">${message}</div>
        </c:if>

        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-white fw-bold text-primary">Cập nhật Quyền & Thông tin</div>
                    <div class="card-body">
                        <form action="users" method="post">
                            <div class="mb-3">
                                <label>Tên đăng nhập (ID)</label>
                                <input type="text" name="id" class="form-control" value="${userEdit.id}" readonly required placeholder="Chọn user từ danh sách...">
                            </div>

                            <div class="mb-3">
                                <label>Họ và tên</label>
                                <input type="text" name="fullname" class="form-control" value="${userEdit.fullname}" required>
                            </div>

                            <div class="mb-3">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" value="${userEdit.email}" required>
                            </div>
                            
                            <div class="mb-3 form-check form-switch">
                                <input class="form-check-input" type="checkbox" name="admin" id="isAdmin" ${userEdit.admin ? 'checked' : ''}>
                                <label class="form-check-label fw-bold" for="isAdmin">Là Quản trị viên (Admin)</label>
                            </div>

                            <button type="submit" class="btn btn-success w-100 fw-bold">CẬP NHẬT</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-white fw-bold">Danh sách Tài khoản</div>
                    <div class="card-body p-0">
                        <table class="table table-hover table-bordered mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Họ tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${users}">
                                    <tr>
                                        <td>${u.id}</td>
                                        <td>${u.fullname}</td>
                                        <td>${u.email}</td>
                                        <td>
                                            <c:if test="${u.admin}"><span class="badge bg-danger">Admin</span></c:if>
                                            <c:if test="${!u.admin}"><span class="badge bg-secondary">User</span></c:if>
                                        </td>
                                        <td>
                                            <a href="users?edit=true&id=${u.id}" class="btn btn-sm btn-outline-primary">Sửa</a>
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

</body>
</html>