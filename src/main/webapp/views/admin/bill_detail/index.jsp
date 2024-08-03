<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h2 class="my-4">${title}</h2>
<%-- Danh sách --%>
<div class="row card mb-4">
    <div class="card-header">
        <div class="align-content-center">
            <i class="fas fa-table me-1"></i>
            Hóa đơn: ${billId}
        </div>
    </div>
    <div class="card-body">
        <c:choose>
            <c:when test="${ empty billDetailList }">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <span> Không có dữ liệu để hiển thị. </span>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="text-center">
                    <tr>
                        <th>#</th>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Tổng giá</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${billDetailList}" var="item" varStatus="i">
                        <tr>
                            <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                            <td>${item.detailProductName}</td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber type="currency" value="${item.price}" pattern="#,###.##"/> đ</td>
                            <td><fmt:formatNumber type="currency" value="${item.totalPrice}" pattern="#,###.##"/> đ</td>
                            <td>${item.status == 0 ? "Trả hàng": "Tính tiền"}</td>
                            <td>
                                    <%--<a class="btn btn-warning" href="/hdct/edit?id=${item.id}">Sửa</a>--%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="text-lg-end">
                    <h4>Tổng tiền: <fmt:formatNumber type="currency" value="${totalBill}" pattern="#,###.##"/> đ</h4>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>


