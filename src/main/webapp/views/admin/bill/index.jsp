<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2 class="my-4">${title}</h2>
<c:if test="${errorMessage != null}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <span>${errorMessage}</span>
    </div>
</c:if>

<%--Tìm kiếm--%>
<div class="row card p-4 mb-4">
    <h5>Bộ lọc</h5>
    <form action="${pageContext.request.contextPath}/admin/bill" method="get" class="row" id="form-search">
        <div class="col-6">
            <div class="input-group">
                <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                    <input type="text" class="form-control" placeholder="Nhập mã hóa đơn, tên, số điện thoại"
                           name="keyword" value="${keyword}">
            </div>
        </div>
        <div class="col-3">
            <div class="input-group">
                <span class="input-group-text">Trạng thái:</span>
                <select class="form-select" id="status-selector" name="status">
                    <option value="" ${status == null ? "selected" : ""}>Tất cả</option>
                    <option value="0" ${status == 0 ? "selected" : ""}>Chờ thanh toán</option>
                    <option value="1" ${status == 1 ? "selected" : ""}>Đã thanh toán</option>
                </select>
            </div>
        </div>
        <div class="col-3">
            <div class="input-group">
                <span class="input-group-text">Ngày tạo:</span>
                <input type="date" class="form-control" name="createAt"
                       value="<fmt:formatDate value='${createAt}' pattern='yyyy-MM-dd'/>">
            </div>
        </div>
    </form>
</div>

<%-- Danh sách --%>
<div class="row card mb-4">
    <div class="card-header">
        <div class="align-content-center">
            <i class="fas fa-table me-1"></i>
            Danh sách Hóa đơn
        </div>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${ empty pageBill.items }">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <span> Không có dữ liệu để hiển thị. </span>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th>#</th>
                        <th>Mã hóa đơn</th>
                        <th>Nhân viên</th>
                        <th>Khách hàng</th>
                        <th>Số điện thoại</th>
                        <th>Ngày mua hàng</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageBill.items}" var="item" varStatus="i">
                        <tr>
                            <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                            <td>${item.id}</td>
                            <td>${item.staffName}</td>
                            <c:choose>
                                <c:when test="${item.customerId == null}">
                                    <td>Khách lẻ</td>
                                    <td>-</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${item.customerName}</td>
                                    <td>${item.phoneNumber}</td>
                                </c:otherwise>
                            </c:choose>
                            <td><fmt:formatDate value="${item.dateOfPurchase}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 0}">Chờ thanh toán</c:when>
                                    <c:when test="${item.status == 1}">Đã thanh toán</c:when>
                                    <c:otherwise>
                                        Hủy
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">
<%--                                <c:if test="${role == 0 && item.status == 0}">--%>
<%--                                    <a class="btn btn-warning btn-sm" href="/admin/bill/update/${item.id}">Sửa</a>--%>
<%--                                </c:if>--%>
                                <a class="btn btn-info btn-sm" href="/admin/bill/${item.id}/product-detail">Xem chi tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-between">
                    <label>
                        <select id="pageSize-selector" class="datatable-selector" name="pageSize">
                            <c:forEach items="${pageSizeList}" var="item">
                                <option value="${item}" ${item == pageBill.pageSize ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                        mục trên mỗi trang
                    </label>
                    <ul class="pagination m-0">
                        <c:if test="${!pageBill.first}">
                            <li class="page-item">
                                <a href="/admin/bill?keyword=${keyword}&status=${status}&pageNo=${pageBill.pageNo - 1}&pageSize=${pageBill.pageSize}"
                                   class="page-link">‹</a>
                            </li>
                        </c:if>

                            <%-- Dynamic pagination --%>
                        <c:forEach begin="1" end="${pageBill.totalPages}" var="i">
                            <c:if test="${i < 2 || i > pageBill.totalPages - 3 || (i >= pageBill.pageNo - 2 && i <= pageBill.pageNo + 1)}">
                                <li class="page-item ${pageBill.pageNo == i ? "active" : ""}">
                                    <a href="/admin/bill?keyword=${keyword}&status=${status}&pageNo=${i}&pageSize=${pageBill.pageSize}"
                                       class="page-link">${i}</a>
                                </li>
                            </c:if>

                            <c:if test="${pageBill.totalPages > 6 && i == pageBill.pageNo + 2 && i < pageBill.totalPages - 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                            <c:if test="${pageBill.totalPages > 6 && i == pageBill.pageNo - 2 && i > 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                        </c:forEach>

                        <c:if test="${!pageBill.last}">
                            <li class="page-item">
                                <a href="/admin/bill?keyword=${keyword}&status=${status}&pageNo=${pageBill.pageNo + 1}&pageSize=${pageBill.pageSize}"
                                   class="page-link">›</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#status-selector').on('change', function () {
            $('#form-search').submit();
        });

        $('#pageSize-selector').on('change', function () {
            let selectedPageSize = $(this).val();
            let keyword = '${param.keyword}';
            let status = '${param.status}';
            let createAt = '${param.createAt}';
            let pageNo = 1;

            let url = [];
            url.push('/admin/bill?');
            if (keyword) {
                url.push("keyword=")
                url.push(keyword);
            }
            if (status) {
                url.push('&status=');
                url.push(status);
            }
            if (createAt) {
                url.push('&createAt=');
                url.push(createAt);
            }
            url.push('&pageNo=');
            url.push(pageNo);
            url.push('&pageSize=');
            url.push(selectedPageSize);

            window.location.href = url.join('');
        });
    });
</script>
