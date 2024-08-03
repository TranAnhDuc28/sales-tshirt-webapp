<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2 class="my-4">${title}</h2>
<c:if test="${messageError != null}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <span>${messageError}</span>
    </div>
</c:if>

<%--Tìm kiếm--%>
<div class="row card p-4 mb-4">
    <h5>Bộ lọc</h5>
    <form action="${pageContext.request.contextPath}/admin/customer" method="get" class="row" id="form-search">
        <div class="col-5">
            <div class="input-group">
                <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                <input type="text" class="form-control" placeholder="Nhập tên hoặc số điện thoại"
                       name="keyword" value="${keyword}">
            </div>
        </div>
        <div class="col-3">
            <div class="input-group">
                <select class="form-select" id="status-selector" name="status">
                    <option value="" ${status == null ? "selected" : ""}>Tất cả</option>
                    <option value="1" ${status == 1 ? "selected" : ""}>Hoạt động</option>
                    <option value="0" ${status == 0 ? "selected" : ""}>Ngừng hoạt động</option>
                </select>
            </div>
        </div>
        <div class="col-4"></div>
    </form>
</div>

<%-- Danh sách --%>
<div class="row card mb-4">
    <div class="card-header d-flex justify-content-between">
        <div class="align-content-center">
            <i class="fas fa-table me-1"></i>
            Danh sách khách hàng
        </div>
        <div>
            <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/customer/create">Thêm</a>
        </div>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${ empty pageCustomer }">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <span> Không có dữ liệu để hiển thị. </span>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="text-center">
                    <tr>
                        <th>#</th>
                        <th>Mã</th>
                        <th>Tên</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageCustomer.items}" var="item" varStatus="i">
                        <tr>
                            <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                            <td>${item.code}</td>
                            <td>${item.name}</td>
                            <td>${item.phoneNumber}</td>
                            <td class="text-center">
                                <a id="chang-status-btn"
                                   class="btn ${item.status == 1 ? "btn-outline-success" : "btn-outline-danger"} btn-sm rounded-pill"
                                   data-id-kh="${item.id}" data-status="${item.status}"
                                   href="">${item.status == 1 ? "Hoạt động" : "Ngừng hoạt động"}</a>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-sm btn-warning" href="/admin/customer/update/${item.id}">Sửa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-between">
                    <label>
                        <select id="pageSize-selector" class="datatable-selector" name="pageSize">
                            <c:forEach items="${pageSizeList}" var="item">
                                <option value="${item}" ${item == pageCustomer.pageSize ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                        mục trên mỗi trang
                    </label>
                    <ul class="pagination m-0">
                        <c:if test="${!pageCustomer.first}">
                            <li class="page-item">
                                <a href="/admin/customer?keyword=${keyword}&status=${status}&pageNo=${pageCustomer.pageNo - 1}&pageSize=${pageCustomer.pageSize}"
                                   class="page-link">‹</a>
                            </li>
                        </c:if>

                            <%-- Dynamic pagination --%>
                        <c:forEach begin="1" end="${pageCustomer.totalPages}" var="i">
                            <c:if test="${i < 2 || i > pageCustomer.totalPages - 3 || (i >= pageCustomer.pageNo - 2 && i <= pageCustomer.pageNo + 1)}">
                                <li class="page-item ${pageCustomer.pageNo == i ? "active" : ""}">
                                    <a href="/admin/customer?keyword=${keyword}&status=${status}&pageNo=${i}&pageSize=${pageCustomer.pageSize}"
                                       class="page-link">${i}</a>
                                </li>
                            </c:if>

                            <c:if test="${pageCustomer.totalPages > 6 && i == pageCustomer.pageNo + 2 && i < pageCustomer.totalPages - 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                            <c:if test="${pageCustomer.totalPages > 6 && i == pageCustomer.pageNo - 2 && i > 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                        </c:forEach>

                        <c:if test="${!pageCustomer.last}">
                            <li class="page-item">
                                <a href="/admin/customer?keyword=${keyword}&status=${status}&pageNo=${pageCustomer.pageNo + 1}&pageSize=${pageCustomer.pageSize}"
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
            let keyword = '${keyword}';
            let status = '${status}';
            let pageNo = 1;

            let url = [];
            url.push('/admin/customer?keyword=');
            url.push(keyword);
            url.push('&status=');
            url.push(status);
            url.push('&pageNo=');
            url.push(pageNo);
            url.push('&pageSize=');
            url.push(selectedPageSize);

            window.location.href = url.join('');
        });

        $(document).on('click', '#chang-status-btn', function (e) {
            e.preventDefault();

            let $button = $(this);
            let customerId = $button.data('id-kh');
            let status = $button.data('status');
            let newStatus = status === 1 ? 0 : 1;

            if (!customerId) return;

            $.ajax({
                url: '/admin/customer/changeStatus/' + customerId,
                method: 'GET',
                data: {status: newStatus},
                success: function () {
                    $button.removeClass(status === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                        .addClass(newStatus === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                        .text(newStatus === 1 ? 'Hoạt động' : 'Ngừng hoạt động')
                        .data('status', newStatus)
                        .attr('data-status', newStatus);

                    console.log($button.data('status'))
                    console.log($button.data())
                },
                error: function (xhr, status, error) {
                    console.error('Error: ', error);
                }
            });
        });
    });
</script>


