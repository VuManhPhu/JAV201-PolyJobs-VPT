<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê & Báo cáo - VPT Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/common/admin.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="/admin/sidebar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="fw-bold text-dark">Báo cáo Thống kê</h4>
                <div class="text-muted small">Dữ liệu tính đến hôm nay</div>
            </div>

            <c:set var="totalApps" value="0" />
            <c:set var="totalJobs" value="0" />
            <c:set var="hotJob" value="Chưa có" />
            <c:set var="maxCount" value="0" />

            <c:forEach var="item" items="${items}">
                <c:set var="totalJobs" value="${totalJobs + 1}" />
                <c:set var="totalApps" value="${totalApps + item[1]}" />
                <c:if test="${item[1] > maxCount}">
                    <c:set var="maxCount" value="${item[1]}" />
                    <c:set var="hotJob" value="${item[0]}" />
                </c:if>
            </c:forEach>

            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #00b14f, #00d25b);">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1 opacity-75">Tổng hồ sơ ứng tuyển</h6>
                                    <h2 class="fw-bold mb-0">${totalApps}</h2>
                                </div>
                                <i class="bi bi-file-earmark-person fs-1 opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #3498db, #5dade2);">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="text-uppercase mb-1 opacity-75">Tin đang tuyển</h6>
                                    <h2 class="fw-bold mb-0">${totalJobs}</h2>
                                </div>
                                <i class="bi bi-briefcase fs-1 opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm text-white" style="background: linear-gradient(45deg, #f39c12, #f7dc6f);">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="overflow-hidden">
                                    <h6 class="text-uppercase mb-1 opacity-75">Job Hot Nhất</h6>
                                    <h5 class="fw-bold mb-0 text-truncate" title="${hotJob}">${hotJob}</h5>
                                </div>
                                <i class="bi bi-fire fs-1 opacity-50"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-bar-chart-fill text-primary"></i> Biểu đồ Ứng tuyển</span>
                        </div>
                        <div class="card-body">
                            <canvas id="jobChart" style="max-height: 300px;"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 mb-4">
                    <div class="card card-dashboard h-100">
                        <div class="card-header-pro">
                            <span><i class="bi bi-table text-primary"></i> Chi tiết theo Job</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive" style="max-height: 340px;">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="bg-light sticky-top">
                                        <tr>
                                            <th class="ps-3">Tên Công việc</th>
                                            <th class="text-center">Số lượng</th>
                                            <th>Ngày mới nhất</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${items}">
                                            <tr>
                                                <td class="ps-3 fw-bold text-secondary">${item[0]}</td>
                                                <td class="text-center">
                                                    <span class="badge bg-primary rounded-pill">${item[1]}</span>
                                                </td>
                                                <td class="small text-muted">
                                                    <fmt:formatDate value="${item[3]}" pattern="dd/MM/yyyy"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty items}">
                                            <tr>
                                                <td colspan="3" class="text-center py-4 text-muted">Chưa có dữ liệu.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Lấy dữ liệu từ JSTL đổ vào mảng Javascript
        const labels = [];
        const data = [];

        <c:forEach var="item" items="${items}">
            labels.push("${item[0]}");
            data.push(${item[1]});
        </c:forEach>

        // Vẽ biểu đồ
        const ctx = document.getElementById('jobChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar', // Hoặc 'pie', 'line'
            data: {
                labels: labels,
                datasets: [{
                    label: 'Số lượng hồ sơ',
                    data: data,
                    backgroundColor: '#00b14f',
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true, ticks: { stepSize: 1 } }
                }
            }
        });
    </script>
</body>
</html>