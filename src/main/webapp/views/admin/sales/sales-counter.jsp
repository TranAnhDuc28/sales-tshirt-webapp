<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="my-4">
    <h2 class="text-center">${title}</h2>
</div>

<c:if test="${error != null}">
    <div class="row alert alert-danger alert-dismissible fade show" role="alert">
        <span> ${error} </span>
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
                            <c:forEach items="${billDetailList}" var="item" varStatus="i">
                                <tr>
                                    <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                                    <td>${item.detailProductName}</td>
                                    <td>${item.quantity}</td>
                                    <td><fmt:formatNumber type="currency" value="${item.price}" pattern="#,###.##"/> đ
                                    </td>
                                    <td><fmt:formatNumber type="currency" value="${item.totalPrice}" pattern="#,###.##"/> đ
                                    </td>
                                    <td class="align-content-center text-center">
                                        <a class="btn btn-sm btn-primary plus-one-product"
                                           href="/admin/sales-counter/bill/${billId}/plus-one-product-in-cart/${item.productDetailId}">
                                            <i class="fa-solid fa-plus"></i></a>
                                        <a class="btn btn-sm btn-primary minus-one-product"
                                           href="/admin/sales-counter/bill/${billId}/minus-one-product-in-cart/${item.productDetailId}">
                                            <i class="fa-solid fa-minus"></i></a>
                                    </td>
                                    <td class="align-content-center text-center">
                                        <a class="btn btn-sm btn-danger"
                                           href="/admin/sales-counter/bill/${billId}/remove-product-from-cart/${item.productDetailId}">
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
                            <c:forEach items="${productList}" var="item">
                                <option value="${item.id}">${item.code} - ${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="card-body">
                        <h5 class="mb-3">Chi tiết sản phẩm</h5>
                        <table class="table table-hover table-bordered">
                            <thead class="text-center">
                            <tr>
                                <th>#</th>
<%--                                <th>Id spct</th>--%>
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
                <form action="${pageContext.request.contextPath}/admin/sales-counter/pay" method="post"
                      id="form-update-sp">
                    <div class="form-group mb-3">
                        <label class="form-label">Tên khách hàng:</label>
                        <input class="form-control" type="text"
                               value="${bill.customerName == null ? "Khách lẻ" : bill.customerName}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Số điện thoại:</label>
                        <input class="form-control" type="text" name="SDT"
                               value="${bill.phoneNumber == null ? "-" : bill.phoneNumber}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Nhân viên:</label>
                        <input class="form-control" type="text" name="staffId"
                               value="${bill != null ? bill.staffId : 1}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Mã hóa đơn:</label>
                        <input class="form-control" type="text" id="billId" name="billId" value="${billId}" readonly/>
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Tổng tiền:</label>
                        <span><fmt:formatNumber type="currency" value="${totalBill}" pattern="#,###.##"/> đ</span>
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
                        <input type="number" class="form-control" id="recipient-name" name="quantity" value="0">
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
        function loadProductDetails(productId, billId) {
            let url = '';
            if (productId) {
                url = '/admin/sales-counter/product/' + productId + '/product-detail';
            } else {
                // empty() trong jQuery sử dụng để xóa hoặc loại bỏ tất cả các nội dung con của một phần tử đã chọn.
                $('#content').empty();
                return;
            }

            $.ajax({
                url: url,
                type: 'GET',
                // data: { // phần data chứa các dữ liệu muốn gửi đến server khi thực hiện yêu cầu Ajax
                //     productId: productId
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
                    data.forEach((item, index) => {
                        content +=
                            '<tr>' +
                            '<th scope="row" class="text-center align-content-center">' + (index + 1) + '</th>' +
                            '<td>' + item.code + '</td>' +
                            '<td>' + item.productName + '</td>' +
                            '<td>' + (item.sizeName != null ? item.sizeName : '') + '</td>' +
                            '<td>' + (item.colorName != null ? item.colorName : '') + '</td>' +
                            '<td>' + (item.price).toLocaleString('vi-VN', { minimumFractionDigits: 0, maximumFractionDigits: 0 }) + ' đ</td>' +
                            '<td>' + item.quantity + '</td>' +
                            '<td class="text-center">' +
                            '<button type="button" class="btn btn-sm btn-success add-cart" data-id-bill="' + billId +
                            '" data-id-pd="' + item.id + '" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">' +
                            '<i class="fa-solid fa-cart-plus"></i></button>' +
                            '</td>' +
                            '</tr>';
                    })
                    $('#content').html(content);  // jQuery html() <=> innerHTML in JS
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }

        $('#product-select').on('change', function () {
            let productId = $(this).val();
            let billId = $('#billId').val();
            window.localStorage.setItem('selectedProduct', productId); // Lưu giá trị lựa chọn vào localStorage
            loadProductDetails(productId, billId)
        });

        // Đọc giá trị từ localStorage và đặt lại lựa chọn sản phẩm
        let selectedProduct = window.localStorage.getItem('selectedProduct');
        if (selectedProduct) {
            $('#product-select').val(selectedProduct).change();
        } else {
            let firstProductId = $('#product-select option:first').val();
            let billId = $('#billId').val();
            loadProductDetails(firstProductId, billId);
        }

        // Xử lý khi người dùng thêm số lượng sản phẩm
        let billId;
        let pdId;

        $(document).on('click', '.add-cart', function () {
            billId = $(this).data('id-bill');
            pdId = $(this).data('id-pd');
            console.log(billId);
            console.log(pdId);
        });

        $(document).on('click', '#add-product-quantity-to-cart', function (e) {
            e.preventDefault();

            if (!billId) return;
            if (!pdId) return;

            let actionUrl = '/admin/sales-counter/bill/' + billId + '/add-product-to-cart/' + pdId;

            $('#add-product-quantity-to-cart-form').attr('action', actionUrl);
            $('#add-product-quantity-to-cart-form').submit();
        });
    });
</script>

