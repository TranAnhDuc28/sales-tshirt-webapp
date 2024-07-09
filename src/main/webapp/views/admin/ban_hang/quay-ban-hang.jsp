<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="my-4">
    <h2 class="text-center">${title}</h2>
</div>

<c:if test="${errorMessage != null}">
    <div class="row alert alert-danger alert-dismissible fade show" role="alert">
        <span> ${errorMessage} </span>
    </div>
</c:if>

<%--Hóa đơn được chọn--%>
<div class="mb-4">
    <div class="row">
        <div class="col-sm-9">
            <div class="row mb-3">
                <div class="card shadow p-0">
                    <div class="card-header">
                        <h5 class="align-content-center p-0 m-0">Giỏ hàng</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover table-bordered">
                            <thead class="text-center">
                            <tr>
                                <th>#</th>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Tổng giá</th>
                                <th class="text-center" colspan="2">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${hoaDonChiTietList}" var="item" varStatus="i">
                                <tr>
                                    <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                                    <td>${item.tenSPCT}</td>
                                    <td>${item.soLuong}</td>
                                    <td><fmt:formatNumber type="currency" value="${item.donGia}" pattern="#,###.##"/> đ
                                    </td>
                                    <td><fmt:formatNumber type="currency" value="${item.tongGia}" pattern="#,###.##"/> đ
                                    </td>
                                    <td class="align-content-center text-center">
                                        <a class="btn btn-sm btn-primary plus-one-product"
                                           href="/admin/quay-ban-hang/hoa-don/${idHoaDon}/plus-one-product-in-cart/${item.idSPCT}">
                                            <i class="fa-solid fa-plus"></i></a>
                                        <a class="btn btn-sm btn-primary minus-one-product"
                                           href="/admin/quay-ban-hang/hoa-don/${idHoaDon}/minus-one-product-in-cart/${item.idSPCT}">
                                            <i class="fa-solid fa-minus"></i></a>
                                    </td>
                                    <td class="align-content-center text-center">
                                        <a class="btn btn-sm btn-danger"
                                           href="/admin/quay-ban-hang/hoa-don/${idHoaDon}/remove-product-from-cart/${item.idSPCT}">
                                            <i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card p-0 shadow">
                    <div class="card-header p-4">
                        <label class="form-label fw-bold">Sản phẩm:</label>
                        <select class="form-select" id="product-select">
                            <c:forEach items="${sanPhamList}" var="item">
                                <option value="${item.id}">${item.ma} - ${item.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="card-body">
                        <h5 class="mb-3">Chi tiết sản phẩm</h5>
                        <table class="table table-hover table-bordered">
                            <thead class="text-center">
                            <tr>
                                <th>#</th>
                                <th>Id SPCT</th>
                                <th>Mã chi tiết SP</th>
                                <th>Sản phẩm</th>
                                <th>Kích thước</th>
                                <th>Màu sắc</th>
                                <th>Đơn giá</th>
                                <th>Số lượng tồn</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody id="content">
                            <%-- data product detail--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card shadow p-4">
                <h4 class="mb-3">Thông tin hóa đơn</h4>
                <form action="/admin/quay-ban-hang/thanh-toan" method="post" id="form-update-sp">
                    <div class="form-group mb-3">
                        <label class="form-label">Tên khách hàng:</label>
                        <input class="form-control" type="text"
                               value="${hd.tenKhachHang == null ? "Khách lẻ" : hd.tenKhachHang}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Số điện thoại:</label>
                        <input class="form-control" type="text" name="SDT"
                               value="${hd.sodienThoai == null ? "-" : hd.sodienThoai}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Nhân viên:</label>
                        <input class="form-control" type="text" name="idNhanVien" value="${hd.nhanVien}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Mã hóa đơn:</label>
                        <input class="form-control" type="text" id="idHoaDon" name="idHoaDon" value="${idHoaDon}"
                               readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Tổng tiền:</label>
                        <span><fmt:formatNumber type="currency" value="${tongGiaTriHoaDon}"
                                                pattern="#,###.##"/> đ</span>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success" onclick="return confirm('Xác nhận thanh toán ?')">
                            Thanh toán
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--Add quantity--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm sản phẩm vào giỏ hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="add-product-quantity-to-cart-form">
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Số lượng:</label>
                        <input type="number" class="form-control" id="recipient-name" name="soLuong" value="0">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button id="add-product-quantity-to-cart" class="btn btn-primary">Xác nhận</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        function loadProductDetails(idSanPham, idHoaDon) {
            let url = '';
            if (idSanPham) {
                url = '/admin/quay-ban-hang/san-pham/' + idSanPham + '/spct';
            } else {
                // empty() trong jQuery sử dụng để xóa hoặc loại bỏ tất cả các nội dung con của một phần tử đã chọn.
                $('#content').empty();
                return;
            }

            $.ajax({
                url: url,
                type: 'GET',
                // data: { // phần data chứa các dữ liệu muốn gửi đến server khi thực hiện yêu cầu Ajax
                //     idSanPham: idSanPham
                // },
                success: function (data) {
                    let content = '';

                    /** Cú pháp:
                     * $.each(array, function(index, item) {
                     *      index: chỉ số của phần tử trong mảng (0, 1, 2, ...)
                     *      item: giá trị của phần tử tại chỉ số đó
                     *  });
                     */
                    console.log($.isArray(data))
                    $.each(data, function (index, spct) {
                        content +=
                            '<tr>' +
                            '<th scope="row" class="text-center align-content-center">' + (index + 1) + '</th>' +
                            '<td>' + spct.id + '</td>' +
                            '<td>' + spct.maSPCT + '</td>' +
                            '<td>' + spct.tenSP + '</td>' +
                            '<td>' + (spct.kichThuoc != null ? spct.kichThuoc : '') + '</td>' +
                            '<td>' + (spct.mauSac != null ? spct.mauSac : '') + '</td>' +
                            '<td>' + (spct.donGia).toLocaleString('vi-VN', { minimumFractionDigits: 0, maximumFractionDigits: 0 }) + ' đ</td>' +
                            '<td>' + spct.soLuong + '</td>' +
                            '<td class="text-center">' +
                            '<button type="button" class="btn btn-sm btn-success add-cart" data-id-hoadon="' + idHoaDon +
                            '" data-id-spct="' + spct.id + '" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">' +
                            '<i class="fa-solid fa-cart-plus"></i></button>' +
                            '</td>' +
                            '</tr>';
                    });
                    $('#content').html(content);  // jQuery html() <=> innerHTML in JS
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }

        $('#product-select').on('change', function () {
            let idSanPham = $(this).val();
            let idHoaDon = $('#idHoaDon').val();
            window.localStorage.setItem('selectedProduct', idSanPham); // Lưu giá trị lựa chọn vào localStorage
            loadProductDetails(idSanPham, idHoaDon)
        });

        // Đọc giá trị từ localStorage và đặt lại lựa chọn sản phẩm
        let selectedProduct = window.localStorage.getItem('selectedProduct');
        if (selectedProduct) {
            $('#product-select').val(selectedProduct).change();
        } else {
            let firstProductId = $('#product-select option:first').val();
            let idHoaDon = $('#idHoaDon').val();
            loadProductDetails(firstProductId, idHoaDon);
        }

        // Xử lý khi người dùng thêm số lượng sản phẩm
        let idHoaDon;
        let idSPCT;

        $(document).on('click', '.add-cart', function () {
            idHoaDon = $(this).data('id-hoadon');
            idSPCT = $(this).data('id-spct');
            console.log(idHoaDon);
            console.log(idSPCT);
        });

        $(document).on('click', '#add-product-quantity-to-cart', function (e) {
            e.preventDefault();

            if (!idHoaDon) return;
            if (!idSPCT) return;

            let actionUrl = '/admin/quay-ban-hang/hoa-don/' + idHoaDon + '/add-product-to-cart/' + idSPCT;

            $('#add-product-quantity-to-cart-form').attr('action', actionUrl);
            $('#add-product-quantity-to-cart-form').submit();
        });
    });
</script>

