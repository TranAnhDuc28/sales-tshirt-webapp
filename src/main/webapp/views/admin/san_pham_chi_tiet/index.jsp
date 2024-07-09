<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h2 class="my-4 text-center">${title}</h2>
<c:if test="${errorMessage != null}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <span>${errorMessage}</span>
    </div>
</c:if>

<%--Tìm kiếm--%>
<%--<div class="row card p-4 mb-4">--%>
<%--    <h5>Tìm kiếm</h5>--%>
<%--    <form action="/spct/index?idSP=${idSP}" method="get" class="d-flex d-inline-flex" id="form-search">--%>
<%--        <div class="input-group ms-3">--%>
<%--            <label class="input-group-text" for="inputGroupSelect01">Trạng thái</label>--%>
<%--            <select class="form-select" id="inputGroupSelect01" name="trangThai" onchange="submitForm()">--%>
<%--                <option value="" selected>Tất cả</option>--%>
<%--                <option value="1" ${trangThai == 1 ? "selected" : ""}>Đang kinh doanh</option>--%>
<%--                <option value="0" ${trangThai == 0 ? "selected" : ""}>Ngừng kinh doanh</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="input-group ms-3">--%>
<%--            <label class="input-group-text" for="inputGroupSelect02">Số bản ghi hiển thị</label>--%>
<%--            <select class="form-select" id="inputGroupSelect02" name="pageSize" onchange="submitForm()">--%>
<%--                <option value="10" ${pageSize == 10 ? "selected" : ""}>10</option>--%>
<%--                <option value="15" ${pageSize == 15 ? "selected" : ""}>15</option>--%>
<%--                <option value="20" ${pageSize == 20 ? "selected" : ""}>20</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%-- Danh sách --%>

<a href="/admin/san-pham">Sản phẩm</a>/Sản phẩm chi tiết
<div class="row card my-4">
    <div class="card-header d-flex justify-content-between">
        <div class="align-content-center">
            <i class="fas fa-table me-1"></i>
            Danh sách chi tiết sản phẩm ${idSanPham}
        </div>
        <div>
            <a class="btn btn-success" href="/admin/san-pham/${idSanPham}/spct/create">Thêm</a>
        </div>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${ empty pageSanPhamChiTiet.items }">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <span> Không có dữ liệu để hiển thị. </span>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="text-center">
                    <tr>
                        <th>#</th>
                        <th>Mã chi tiết SP</th>
                        <th>Sản phẩm</th>
                        <th>Kích thước</th>
                        <th>Màu sắc</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageSanPhamChiTiet.items}" var="item" varStatus="i">
                        <tr>
                            <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                            <td>${item.maSPCT}</td>
                            <td>${item.tenSP}</td>
                            <td>${item.kichThuoc != null ? item.kichThuoc : ""}</td>
                            <td>${item.mauSac != null ? item.mauSac : ""}</td>
                            <td>${item.soLuong}</td>
                            <td><fmt:formatNumber type="currency" value="${item.donGia}" pattern="##,###.##"/> đ</td>
                            <td class="text-center">
                                <a id="chang-status-btn"
                                   class="btn ${item.trangThai == 1 ? "btn-outline-success" : "btn-outline-danger"} btn-sm rounded-pill"
                                   data-id-spct="${item.id}" data-status="${item.trangThai}"
                                   href="">${item.trangThai == 1 ? "Đang kinh doanh" : "Ngừng kinh doanh"}</a>
                            </td>
                            <td class="text-center">
                                <a class="btn btn-warning btn-sm"
                                   href="/admin/san-pham/${idSanPham}/spct/update/${item.id}">Sửa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%--                <div class="clearfix d-flex justify-content-center mt-2">--%>
                <%--                    <ul class="pagination p-1">--%>
                <%--                        <c:if test="${page > 1}">--%>
                <%--                            <li class="page-item">--%>
                <%--                                <a href="/spct/index?idSP=${idSP}&trangThai=${trangThai}&page=${page - 1}&pageSize=${pageSize}"--%>
                <%--                                   class="page-link">Previous</a>--%>
                <%--                            </li>--%>
                <%--                        </c:if>--%>

                <%--                            &lt;%&ndash; Dynamic pagination &ndash;%&gt;--%>
                <%--                        <c:forEach begin="1" end="${totalPage}" var="i">--%>
                <%--                            <c:if test="${i < 4 || i > totalPage - 3 || (i >= page - 2 && i <= page + 1)}">--%>
                <%--                                <li class="page-item ${page == i ? "active" : ""}">--%>
                <%--                                    <a href="/spct/index?idSP=${idSP}&trangThai=${trangThai}&page=${i}&pageSize=${pageSize}"--%>
                <%--                                       class="page-link">${i}</a>--%>
                <%--                                </li>--%>
                <%--                            </c:if>--%>

                <%--                            <c:if test="${totalPage > 6 && i == page + 2 && i < totalPage - 2}">--%>
                <%--                                <li class="page-item"><span class="page-link border-0">...</span></li>--%>
                <%--                            </c:if>--%>

                <%--                            <c:if test="${totalPage > 6 && i == page - 3 && i > 2}">--%>
                <%--                                <li class="page-item"><span class="page-link border-0">...</span></li>--%>
                <%--                            </c:if>--%>
                <%--                        </c:forEach>--%>

                <%--                        <c:if test="${page < totalPage}">--%>
                <%--                            <li class="page-item">--%>
                <%--                                <a href="/spct/index?idSP=${idSP}&trangThai=${trangThai}&page=${page + 1}&pageSize=${pageSize}"--%>
                <%--                                   class="page-link">Next</a>--%>
                <%--                            </li>--%>
                <%--                        </c:if>--%>
                <%--                    </ul>--%>
                <%--                </div>--%>
            </c:otherwise>
        </c:choose>
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
                url.push('/admin/spct?keyword=');
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
                let idSP = '${idSanPham}';
                let idSPCT = $button.data('id-spct');
                let status = $button.data('status');
                let newStatus = status === 1 ? 0 : 1;

                if (!idSPCT) return;

                $.ajax({
                    url: '/admin/san-pham/' + idSP + '/spct/changeStatus/' + idSPCT,
                    method: 'POST',
                    data: {trangThai: newStatus},
                    success: function () {
                        $button.removeClass(status === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                            .addClass(newStatus === 1 ? 'btn-outline-success' : 'btn-outline-danger')
                            .text(newStatus === 1 ? 'Đang kinh doanh' : 'Ngừng kinh doanh')
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
</div>
