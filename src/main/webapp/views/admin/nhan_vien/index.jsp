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
    <form action="/admin/nhan-vien" method="get" class="row" id="form-search">
        <div class="col-5">
            <div class="input-group">
                <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
                <input type="text" class="form-control" placeholder="Nhập tên hoặc số điện thoại"
                       name="keyword" value="${keyword}">
            </div>
        </div>
        <div class="col-3">
            <div class="input-group">
                <select class="form-select" id="status-selector" name="trangThai">
                    <option value="" ${trangThai == null ? "selected" : ""}>Tất cả</option>
                    <option value="1" ${trangThai == 1 ? "selected" : ""}>Làm việc</option>
                    <option value="0" ${trangThai == 0 ? "selected" : ""}>Đã nghỉ việc</option>
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
            Danh sách Nhân viên
        </div>
        <div>
            <a class="btn btn-success" href="/admin/nhan-vien/create">Thêm</a>
        </div>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${ empty pageNhanVien.items }">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <span> Không có dữ liệu để hiển thị. </span>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="text-center">
                    <tr>
                        <th>#</th>
                        <th>Mã nhân viên</th>
                        <th>Tên nhân viên</th>
                        <th>Email</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageNhanVien.items}" var="item" varStatus="i">
                        <tr>
                            <th scope="row">${i.index + 1}</th>
                            <td>${item.ma}</td>
                            <td>${item.ten}</td>
                            <td>${item.email}</td>
                            <td class="text-center">
                                <a id="chang-status-btn"
                                   class="btn ${item.trangThai == 1 ? "btn-outline-success" : "btn-outline-danger"} btn-sm rounded-pill"
                                   data-id-nv="${item.id}" data-status="${item.trangThai}"
                                   href="">${item.trangThai == 1 ? "Làm việc" : "Đã nghỉ việc"}</a>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-warning btn-sm" href="/admin/nhan-vien/update/${item.id}">Sửa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-between">
                    <label>
                        <select id="pageSize-selector" class="datatable-selector" name="pageSize">
                            <c:forEach items="${pageSizeList}" var="item">
                                <option value="${item}" ${item == pageNhanVien.pageSize ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                        mục trên mỗi trang
                    </label>
                    <ul class="pagination m-0">
                        <c:if test="${!pageNhanVien.first}">
                            <li class="page-item">
                                <a href="/admin/nhan-vien?keyword=${keyword}&trangThai=${trangThai}&pageNo=${pageNhanVien.pageNo - 1}&pageSize=${pageNhanVien.pageSize}"
                                   class="page-link">‹</a>
                            </li>
                        </c:if>

                            <%-- Dynamic pagination --%>
                        <c:forEach begin="1" end="${pageNhanVien.totalPages}" var="i">
                            <c:if test="${i < 2 || i > pageNhanVien.totalPages - 3 || (i >= pageNhanVien.pageNo - 2 && i <= pageNhanVien.pageNo + 1)}">
                                <li class="page-item ${pageNhanVien.pageNo == i ? "active" : ""}">
                                    <a href="/admin/nhan-vien?keyword=${keyword}&trangThai=${trangThai}&pageNo=${i}&pageSize=${pageNhanVien.pageSize}"
                                       class="page-link">${i}</a>
                                </li>
                            </c:if>

                            <c:if test="${pageNhanVien.totalPages > 6 && i == pageNhanVien.pageNo + 2 && i < pageNhanVien.totalPages - 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                            <c:if test="${pageNhanVien.totalPages > 6 && i == pageNhanVien.pageNo - 2 && i > 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                        </c:forEach>

                        <c:if test="${!pageNhanVien.last}">
                            <li class="page-item">
                                <a href="/admin/nhan-vien?keyword=${keyword}&trangThai=${trangThai}&pageNo=${pageNhanVien.pageNo + 1}&pageSize=${pageNhanVien.pageSize}"
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
            let trangThai = '${trangThai}';
            let pageNo = 1;

            let url = [];
            url.push('/admin/nhan-vien?keyword=');
            url.push(keyword);
            url.push('&trangThai=');
            url.push(trangThai);
            url.push('&pageNo=');
            url.push(pageNo);
            url.push('&pageSize=');
            url.push(selectedPageSize);

            window.location.href = url.join('');
        });

        $(document).on('click', '#chang-status-btn', function (e) {
            e.preventDefault();

            let $button = $(this);
            let idNV = $button.data('id-nv');
            let status = $button.data('status');
            let newStatus = status === 1 ? 0 : 1;

            if (!idNV) return;

            $.ajax({
                url: '/admin/nhan-vien/changeStatus/' + idNV,
                method: 'GET',
                data: {trangThai: newStatus},
                success: function () {
                    $button.removeClass(status === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                        .addClass(newStatus === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                        .text(newStatus === 1 ? 'Làm việc' : 'Đã nghỉ việc')
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
