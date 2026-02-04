<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lịch sử ứng tuyển - VPT Jobs</title>
</head>
<body>

    <jsp:include page="/common/header.jsp" />

    <div class="container mt-4 mb-5" style="min-height: 60vh;">
        <div class="row">
            <div class="col-md-12">
                <h4 class="fw-bold border-start border-4 border-success ps-3 mb-4">Việc làm đã ứng tuyển</h4>
                
                <div class="card border-0 shadow-sm">
                    <div class="card-body p-0">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light text-secondary">
                                <tr>
                                    <th class="py-3 ps-4">Công việc</th>
                                    <th>Ngày nộp</th>
                                    <th>Mức lương</th>
                                    <th>Trạng thái hồ sơ</th>
                                    <th class="text-end pe-4">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="app" items="${apps}">
                                    <tr>
                                        <td class="ps-4">
                                            <div class="fw-bold text-dark">${app.job.title}</div>
                                            <small class="text-muted">VPT Technology</small>
                                        </td>
                                        
                                        <td class="text-muted">
                                            <i class="bi bi-calendar3 me-1"></i> 
                                            <fmt:formatDate value="${app.appliedDate}" pattern="dd/MM/yyyy"/>
                                        </td>
                                        
                                        <td class="fw-bold text-success">$${app.job.salary}</td>
                                        
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.status == 0}">
                                                    <span class="badge bg-warning text-dark bg-opacity-25 border border-warning px-3 py-2 rounded-pill">Chờ duyệt</span>
                                                </c:when>
                                                <c:when test="${app.status == 1}">
                                                    <span class="badge bg-info text-dark bg-opacity-25 border border-info px-3 py-2 rounded-pill">Phỏng vấn</span>
                                                </c:when>
                                                <c:when test="${app.status == 2}">
                                                    <span class="badge bg-success bg-opacity-25 text-success border border-success px-3 py-2 rounded-pill">Trúng tuyển</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary bg-opacity-25 text-secondary border border-secondary px-3 py-2 rounded-pill">Từ chối</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        
                                        <td class="text-end pe-4">
                                            <a href="detail?id=${app.job.id}" class="btn btn-sm btn-outline-primary border-0 bg-light">
                                                Xem lại <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                                <c:if test="${empty apps}">
                                    <tr>
                                        <td colspan="5" class="text-center py-5 text-muted">
                                            <img src="https://vieclam24h.vn/img/empty-state.png" style="width: 100px; opacity: 0.5;" class="mb-3 d-block mx-auto">
                                            Bạn chưa ứng tuyển công việc nào.<br>
                                            <a href="home" class="btn btn-primary mt-3">Tìm việc ngay</a>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />

</body>
</html>