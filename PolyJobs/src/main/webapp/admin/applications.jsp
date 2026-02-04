<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Duyệt Đơn Ứng Tuyển - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/admin.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="/admin/sidebar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold text-dark">Quản lý Hồ sơ Ứng tuyển</h4>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="card card-dashboard">
                <div class="card-header-pro">
                    <span><i class="bi bi-file-earmark-person text-primary"></i> Danh sách chờ duyệt</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="ps-3">Ứng viên</th>
                                    <th>Công việc ứng tuyển</th>
                                    <th>Ngày nộp</th>
                                    <th>Trạng thái hiện tại</th>
                                    <th class="text-end pe-3">Xét duyệt</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="app" items="${apps}">
                                    <tr>
                                        <td class="ps-3">
                                            <div class="fw-bold">${app.user.fullname}</div>
                                            <small class="text-muted">${app.user.email}</small>
                                        </td>
                                        <td>
                                            <span class="text-primary fw-bold">${app.job.title}</span>
                                        </td>
                                        <td><fmt:formatDate value="${app.appliedDate}" pattern="dd/MM/yyyy"/></td>
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.status == 0}">
                                                    <span class="badge bg-warning text-dark">Chờ duyệt</span>
                                                </c:when>
                                                <c:when test="${app.status == 1}">
                                                    <span class="badge bg-success">Đã duyệt</span>
                                                </c:when>
                                                <c:when test="${app.status == 3}">
                                                    <span class="badge bg-secondary">Đã từ chối</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-light text-dark border">Khác</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="text-end pe-3">
                                            <c:if test="${app.status == 0}">
                                                <a href="applications?action=approve&id=${app.id}" class="btn btn-sm btn-success me-1" title="Duyệt">
                                                    <i class="bi bi-check-lg"></i> Duyệt
                                                </a>
                                                <a href="applications?action=reject&id=${app.id}" class="btn btn-sm btn-outline-danger" title="Từ chối">
                                                    <i class="bi bi-x-lg"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${app.status != 0}">
                                                <span class="text-muted small">Đã xử lý</span>
                                            </c:if>
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