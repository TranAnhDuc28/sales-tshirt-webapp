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
    <form action="/admin/hoa-don" method="get" class="row" id="form-search">
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
                <select class="form-select" id="status-selector" name="trangThai">
                    <option value="" ${trangThai == null ? "selected" : ""}>Tất cả</option>
                    <option value="0" ${trangThai == 0 ? "selected" : ""}>Chờ thanh toán</option>
                    <option value="1" ${trangThai == 1 ? "selected" : ""}>Đã thanh toán</option>
                </select>
            </div>
        </div>
        <div class="col-3">
            <div class="input-group">
                <span class="input-group-text">Ngày tạo:</span>
                <input type="date" class="form-control" name="ngayTao"
                       value="<fmt:formatDate value='${ngayTao}' pattern='yyyy-MM-dd'/>">
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
            <c:when test="${ empty pageHoaDon.items }">
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
                    <c:forEach items="${pageHoaDon.items}" var="item" varStatus="i">
                        <tr>
                            <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                            <td>${item.id}</td>
                            <td>${item.nhanVien}</td>
                            <c:choose>
                                <c:when test="${item.idKH == null}">
                                    <td>Khách lẻ</td>
                                    <td>-</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${item.tenKhachHang}</td>
                                    <td>${item.sodienThoai}</td>
                                </c:otherwise>
                            </c:choose>
                            <td><fmt:formatDate value="${item.ngayMuaHang}" pattern="dd/MM/yyyy"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.trangThai == 0}">Chờ thanh toán</c:when>
                                    <c:when test="${item.trangThai == 1}">Đã thanh toán</c:when>
                                    <c:otherwise>
                                        Hủy
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center">
                                <c:if test="${role == 0 && item.trangThai == 0}">
                                    <a class="btn btn-warning btn-sm" href="/admin/hoa-don/update/${item.id}">Sửa</a>
                                </c:if>
                                <a class="btn btn-info btn-sm" href="/admin/hoa-don/${item.id}/hdct">Xem chi tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="d-flex justify-content-between">
                    <label>
                        <select id="pageSize-selector" class="datatable-selector" name="pageSize">
                            <c:forEach items="${pageSizeList}" var="item">
                                <option value="${item}" ${item == pageHoaDon.pageSize ? "selected" : ""}>${item}</option>
                            </c:forEach>
                        </select>
                        mục trên mỗi trang
                    </label>
                    <ul class="pagination m-0">
                        <c:if test="${!pageHoaDon.first}">
                            <li class="page-item">
                                <a href="/admin/hoa-don?keyword=${keyword}&trangThai=${trangThai}&pageNo=${pageHoaDon.pageNo - 1}&pageSize=${pageHoaDon.pageSize}"
                                   class="page-link">‹</a>
                            </li>
                        </c:if>

                            <%-- Dynamic pagination --%>
                        <c:forEach begin="1" end="${pageHoaDon.totalPages}" var="i">
                            <c:if test="${i < 2 || i > pageHoaDon.totalPages - 3 || (i >= pageHoaDon.pageNo - 2 && i <= pageHoaDon.pageNo + 1)}">
                                <li class="page-item ${pageHoaDon.pageNo == i ? "active" : ""}">
                                    <a href="/admin/hoa-don?keyword=${keyword}&trangThai=${trangThai}&pageNo=${i}&pageSize=${pageHoaDon.pageSize}"
                                       class="page-link">${i}</a>
                                </li>
                            </c:if>

                            <c:if test="${pageHoaDon.totalPages > 6 && i == pageHoaDon.pageNo + 2 && i < pageHoaDon.totalPages - 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                            <c:if test="${pageHoaDon.totalPages > 6 && i == pageHoaDon.pageNo - 2 && i > 2}">
                                <li class="page-item"><span class="page-link">...</span></li>
                            </c:if>

                        </c:forEach>

                        <c:if test="${!pageHoaDon.last}">
                            <li class="page-item">
                                <a href="/admin/hoa-don?keyword=${keyword}&trangThai=${trangThai}&pageNo=${pageHoaDon.pageNo + 1}&pageSize=${pageHoaDon.pageSize}"
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
            let trangThai = '${param.trangThai}';
            let ngayTao = '${param.ngayTao}';
            let pageNo = 1;

            let url = [];
            url.push('/admin/hoa-don?');
            if (keyword) {
                url.push("keyword=")
                url.push(keyword);
            }
            if (trangThai) {
                url.push('&trangThai=');
                url.push(trangThai);
            }
            if (ngayTao) {
                url.push('&ngayTao=');
                url.push(ngayTao);
            }
            url.push('&pageNo=');
            url.push(pageNo);
            url.push('&pageSize=');
            url.push(selectedPageSize);

            window.location.href = url.join('');
        });
    });
</script>
