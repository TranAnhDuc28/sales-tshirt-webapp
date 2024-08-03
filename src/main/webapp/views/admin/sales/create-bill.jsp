<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/tags" %>

<h2 class="my-4">${title}</h2>

<div class="row">
    <c:if test="${ error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <span> ${ error } </span>
        </div>
    </c:if>
    <div class="card p-0 shadow col-sm-9">
        <div class="card-header">
            <div class="align-content-center">
                <i class="fas fa-table me-1"></i>
                Danh sách Hóa đơn chờ
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Mã hóa đơn</th>
                    <th>Nhân viên</th>
                    <th>Khách hàng</th>
                    <th>Ngày mua hàng</th>
                    <th>Trạng thái</th>
                    <th class="text-center">Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${billPending}" var="item" varStatus="i">
                    <tr>
                        <th scope="row" class="text-center align-content-center">${i.index + 1}</th>
                        <td>${item.id}</td>
                        <td>${item.staffName}</td>
                        <c:choose>
                            <c:when test="${item.customerId == null}">
                                <td>Khách lẻ</td>
                            </c:when>
                            <c:otherwise>
                                <td>${item.customerName} - ${item.phoneNumber}</td>
                            </c:otherwise>
                        </c:choose>
                        <td><fmt:formatDate value="${item.dateOfPurchase}" pattern="dd/MM/yyyy"/></td>
                        <td>${item.status == 0 ? "Chờ thanh toán": ""}</td>
                        <td class="align-content-center text-center">
                            <a class="btn btn-outline-success btn-sm" href="/admin/sales-counter/bill/${item.id}">Chọn</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card shadow p-4">
            <h4 class="mb-3">Thông tin hóa đơn</h4>
            <form action="${pageContext.request.contextPath}/admin/sales" method="post">
                <div class="form-group mb-3">
                    <label class="form-label">Nhân viên:</label>
                    <input class="form-control" type="hidden" name="staffId" value="${staff.id}"/>
                    <input class="form-control" type="text" value="${staff.code} - ${staff.name}" readonly/>
                </div>
                <div class="form-group mb-3">
                    <label class="form-label">Khách hàng:</label>
                    <select class="form-select" name="customerId">
                        <option hidden disabled selected> Khách lẻ</option>
                        <c:forEach items="${customerListActive}" var="item">
                            <option value="${item.id}">${item.name} - ${item.phoneNumber}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success">Tạo hóa đơn</button>
                </div>
            </form>
        </div>
    </div>
</div>



