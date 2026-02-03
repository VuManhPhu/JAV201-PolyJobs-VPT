<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>VPT Jobs - Tìm việc làm nhanh</title>
    </head>
<body>

    <jsp:include page="/common/header.jsp" />

    <div class="container mt-4 mb-4">
        <div class="p-5 rounded-3 text-white" style="background: linear-gradient(to right, #00b14f, #00d25b);">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h2 class="fw-bold">Công nghệ chạm đỉnh - Sự nghiệp thăng hoa</h2>
                    <p class="lead">Hơn 1,000+ việc làm IT đang chờ đón bạn tại VPT Jobs.</p>
                </div>
                <div class="col-md-4 text-center">
                    <img src="https://vieclam24h.vn/img/img-home-app.png" alt="Banner" style="max-height: 150px; opacity: 0.9;">
                </div>
            </div>
        </div>
    </div>

    <div class="container mb-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-bold text-dark border-start border-4 border-success ps-3">Việc làm hấp dẫn</h4>
            <a href="#" class="text-decoration-none text-success fw-bold">Xem tất cả <i class="bi bi-arrow-right"></i></a>
        </div>

        <div class="row">
            <c:forEach var="item" items="${jobs}">
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="card job-card h-100 p-3 border-0">
                        <div class="d-flex align-items-start">
                            <img src="${item.poster}" alt="logo" class="rounded border p-1 me-3" 
                                 style="width: 60px; height: 60px; object-fit: contain;">
                            <div>
                                <a href="detail?id=${item.id}" class="job-title text-truncate" style="max-width: 200px;">
                                    ${item.title}
                                </a>
                                <p class="text-muted small mb-1">Công ty VPT Technology</p>
                                <span class="badge bg-light text-secondary border">Hồ Chí Minh</span>
                            </div>
                        </div>
                        <div class="mt-3 d-flex justify-content-between align-items-end">
                            <span class="salary-text"><i class="bi bi-currency-dollar"></i> ${item.salary} USD</span>
                            <a href="detail?id=${item.id}" class="btn btn-outline-primary btn-sm rounded-pill px-3">Ứng tuyển</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />

</body>
</html>