<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="sidebar">
    <div class="sidebar-header">
        <h3 class="fw-bold mb-0 text-white"><i class="bi bi-shield-lock-fill"></i> VPT ADMIN</h3>
        <small class="text-muted">Quản trị hệ thống</small>
    </div>

    <div class="sidebar-menu">
        <small class="text-uppercase text-muted px-4 fw-bold" style="font-size: 0.75rem;">Quản lý</small>
        
        <a href="${pageContext.request.contextPath}/admin/job/index" 
           class="sidebar-link ${fn:contains(pageContext.request.requestURI, 'job') ? 'active' : ''}">
            <i class="bi bi-briefcase"></i> Việc làm
        </a>
        
        <a href="${pageContext.request.contextPath}/admin/users" 
           class="sidebar-link ${fn:contains(pageContext.request.requestURI, 'users') ? 'active' : ''}">
            <i class="bi bi-people"></i> Người dùng
        </a>
		
		<a href="${pageContext.request.contextPath}/admin/applications" 
   class="sidebar-link ${fn:contains(pageContext.request.requestURI, 'applications') ? 'active' : ''}">
    <i class="bi bi-file-earmark-check"></i> Duyệt Hồ sơ
</a>

        <div class="mt-4 mb-2"></div>
        <small class="text-uppercase text-muted px-4 fw-bold" style="font-size: 0.75rem;">Thống kê</small>
        
        <a href="${pageContext.request.contextPath}/admin/report" 
           class="sidebar-link ${fn:contains(pageContext.request.requestURI, 'report') ? 'active' : ''}">
            <i class="bi bi-bar-chart-line"></i> Báo cáo
        </a>
    </div>

    <div style="position: absolute; bottom: 0; width: 100%; padding: 20px; background: rgba(0,0,0,0.2);">
        <div class="d-flex align-items-center mb-3">
            <div class="bg-success rounded-circle d-flex align-items-center justify-content-center text-white fw-bold me-2" style="width: 40px; height: 40px;">
                ${sessionScope.user.fullname.charAt(0)}
            </div>
            <div class="text-white overflow-hidden">
                <div class="fw-bold text-truncate">${sessionScope.user.fullname}</div>
                <small class="text-success"><i class="bi bi-circle-fill" style="font-size: 8px;"></i> Online</small>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm w-100">Đăng xuất</a>
    </div>
</div>