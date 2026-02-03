<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <i class="bi bi-briefcase-fill"></i> VPT JOBS
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <form class="d-flex mx-auto" action="${pageContext.request.contextPath}/home" method="get" style="width: 50%;">
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-search"></i></span>
                    <input class="form-control border-start-0 bg-light" type="search" name="keyword" placeholder="Tìm kiếm việc làm, công ty..." value="${param.keyword}">
                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                </div>
            </form>

            <ul class="navbar-nav ms-auto align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle fw-bold text-dark" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle"></i> ${sessionScope.user.fullname}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                                <c:if test="${sessionScope.user.admin}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/jobs"><i class="bi bi-gear"></i> Quản trị Admin</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                </c:if>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/history"><i class="bi bi-file-earmark-text"></i> Hồ sơ ứng tuyển</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout" class="text-danger"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="btn btn-outline-primary me-2 fw-bold" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>