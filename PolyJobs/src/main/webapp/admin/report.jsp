<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo Thống kê - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-dark bg-success mb-4 p-3">
        <div class="container-fluid">
            <span class="navbar-brand fw-bold">THỐNG KÊ ỨNG TUYỂN</span>
            <div class="d-flex">
                <a href="job/index" class="btn btn-outline-light btn-sm me-2">Quản lý Việc làm</a>
                <a href="users" class="btn btn-outline-light btn-sm me-2">Quản lý User</a>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-light btn-sm me-2">Về Trang chủ</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow border-0">
            <div class="card-body">
                <h4 class="text-success mb-4 fw-bold text-center">TỔNG HỢP SỐ LIỆU TUYỂN DỤNG</h4>
                
                <table class="table table-striped table-hover text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Tên Công việc</th>
                            <th>Tổng số Ứng viên</th>
                            <th>Ngày nộp sớm nhất</th>
                            <th>Ngày nộp mới nhất</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td class="fw-bold text-start ps-4">${item[0]}</td>
                                <td><span class="badge bg-primary fs-6">${item[1]}</span></td>
                                <td><fmt:formatDate value="${item[2]}" pattern="dd-MM-yyyy" /></td>
                                <td><fmt:formatDate value="${item[3]}" pattern="dd-MM-yyyy" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <c:if test="${empty items}">
                    <div class="alert alert-warning text-center mt-3">Chưa có dữ liệu ứng tuyển nào để thống kê!</div>
                </c:if>
            </div>
        </div>
        
        <div class="mt-5 text-center text-muted">
            <small>Dữ liệu được cập nhật theo thời gian thực (Real-time)</small>
        </div>
    </div>

</body>
</html>