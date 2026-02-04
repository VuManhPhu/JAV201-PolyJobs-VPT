<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${job.title} - VPT Jobs</title>
    </head>
<body>

    <jsp:include page="/common/header.jsp" />

    <div class="container mt-4 mb-5">
        <div class="rounded-3 overflow-hidden position-relative mb-4 shadow-sm">
            <div style="height: 200px; background: linear-gradient(to right, #00b14f, #007a36);"></div>
            <div class="position-absolute bottom-0 start-0 p-4 d-flex align-items-end" style="width: 100%; background: linear-gradient(transparent, rgba(0,0,0,0.7));">
                <img src="${job.poster}" class="bg-white rounded p-1" style="width: 100px; height: 100px; object-fit: contain;">
                <div class="ms-3 text-white">
                    <h2 class="fw-bold mb-1">${job.title}</h2>
                    <p class="mb-0 opacity-75"><i class="bi bi-building"></i> Công ty VPT Technology</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-body p-4">
                        <h5 class="fw-bold border-start border-4 border-success ps-3 mb-3">Mô tả công việc</h5>
                        <p style="white-space: pre-line; line-height: 1.8; color: #444;">${job.description}</p>
                        
                        <h5 class="fw-bold border-start border-4 border-success ps-3 mt-4 mb-3">Yêu cầu ứng viên</h5>
                        <ul class="text-secondary">
                            <li>Có kinh nghiệm làm việc với Java, Spring Boot là lợi thế.</li>
                            <li>Tư duy logic tốt, chủ động trong công việc.</li>
                            <li>Có khả năng đọc hiểu tài liệu tiếng Anh chuyên ngành.</li>
                        </ul>

                        <h5 class="fw-bold border-start border-4 border-success ps-3 mt-4 mb-3">Quyền lợi</h5>
                        <ul class="text-secondary">
                            <li>Lương thưởng hấp dẫn, review 2 lần/năm.</li>
                            <li>Đóng bảo hiểm đầy đủ theo luật lao động.</li>
                            <li>Teambuilding, du lịch hàng năm.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-body">
                        <h5 class="fw-bold mb-3">Thông tin chung</h5>
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-light rounded-circle p-2 text-success me-3"><i class="bi bi-cash-stack fs-4"></i></div>
                            <div>
                                <small class="text-muted d-block">Mức lương</small>
                                <span class="fw-bold text-success fs-5">$${job.salary}</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-light rounded-circle p-2 text-primary me-3"><i class="bi bi-geo-alt fs-4"></i></div>
                            <div>
                                <small class="text-muted d-block">Địa điểm</small>
                                <span class="fw-bold">Hồ Chí Minh</span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-4">
                            <div class="bg-light rounded-circle p-2 text-warning me-3"><i class="bi bi-clock-history fs-4"></i></div>
                            <div>
                                <small class="text-muted d-block">Ngày đăng</small>
                                <span class="fw-bold">04/02/2026</span>
                            </div>
                        </div>

                        <div class="d-grid gap-2">
                            <a href="apply?jobId=${job.id}" class="btn btn-primary btn-lg fw-bold text-uppercase py-3 shadow-sm">
                                Ứng tuyển ngay
                            </a>
                            <button class="btn btn-outline-secondary fw-bold">Lưu tin</button>
                        </div>
                    </div>
                </div>

                <div class="alert alert-warning border-0 small">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i>
                    Hãy cẩn trọng với các yêu cầu nộp phí tuyển dụng. VPT Jobs cam kết không thu phí ứng viên.
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/common/footer.jsp" />

</body>
</html>