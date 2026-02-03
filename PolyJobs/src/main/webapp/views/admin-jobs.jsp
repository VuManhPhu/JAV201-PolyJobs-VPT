<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Việc làm - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-dark bg-primary mb-4 p-3">
        <div class="container-fluid">
            <span class="navbar-brand fw-bold">ADMINISTRATION</span>
            <div class="d-flex">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-light btn-sm me-2">Xem trang chủ</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-warning btn-sm">Đăng xuất</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        
        <c:if test="${not empty message}">
            <div class="alert alert-info text-center">${message}</div>
        </c:if>

        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-white fw-bold">Thông tin Việc làm</div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/job" method="post">
                            
                            <div class="mb-3">
                                <label>Mã công việc (ID)</label>
                                <input type="text" name="id" class="form-control" value="${job.id}" placeholder="VD: JOB99" required>
                            </div>

                            <div class="mb-3">
                                <label>Tên công việc</label>
                                <input type="text" name="title" class="form-control" value="${job.title}" required>
                            </div>

                            <div class="mb-3">
                                <label>Mức lương ($)</label>
                                <input type="number" name="salary" class="form-control" value="${job.salary}">
                            </div>
                            
                            <div class="mb-3">
                                <label>Link Ảnh (Poster)</label>
                                <input type="text" name="poster" class="form-control" value="${job.poster}">
                            </div>
                            
                            <div class="mb-3">
                                <label>Mô tả chi tiết</label>
                                <textarea name="description" class="form-control" rows="3">${job.description}</textarea>
                            </div>

                            <div class="mb-3">
                                <label>Trạng thái</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="active" value="true" ${job.active ? 'checked' : ''} checked>
                                    <label class="form-check-label">Đang tuyển</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="active" value="false" ${!job.active ? 'checked' : ''}>
                                    <label class="form-check-label">Đã đóng</label>
                                </div>
                            </div>

                            <hr>
                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/create" class="btn btn-primary">Create</button>
                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/update" class="btn btn-warning">Update</button>
                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/delete" class="btn btn-danger">Delete</button>
                            <button type="submit" formaction="${pageContext.request.contextPath}/admin/job/reset" class="btn btn-secondary">Reset</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-white fw-bold">Danh sách Việc làm</div>
                    <div class="card-body p-0">
                        <table class="table table-hover table-bordered mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Tên việc làm</th>
                                    <th>Lương</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${jobs}">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.title}</td>
                                        <td>$${item.salary}</td>
                                        <td>
                                            ${item.active ? '<span class="badge bg-success">Active</span>' : '<span class="badge bg-secondary">Closed</span>'}
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/job/edit?id=${item.id}" class="btn btn-info btn-sm">Edit</a>
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