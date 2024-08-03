<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="my-4 text-center">${titleCreate}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/product/${productId}/product-detail/create" method="post" modelAttribute="pdRequest">
            <div class="form-group mb-3">
                <form:label path="code" class="form-label">Mã SPCT:</form:label>
                <form:input id="code" class="form-control" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="mb-2">
                <label class="form-label">Sản phẩm: </label>
                <span><strong>${productName}</strong></span>
            </div>
            <div class="form-group mb-3">
                <form:label path="sizeId" class="form-label">Kích thước:</form:label>
                <form:select id="sizeId" class="form-select" path="sizeId">
                    <form:options items="${sizeListActive}" itemLabel="name" itemValue="id"/>
                </form:select>
                <form:errors path="sizeId" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="colorId" class="form-label">Màu sắc:</form:label>
                <form:select id="colorId" class="form-select" path="colorId">
                    <form:options items="${sizeListActive}" itemLabel="name" itemValue="id"/>
                </form:select>
                <form:errors path="colorId" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="quantity" class="form-label">Số lượng:</form:label>
                <form:input id="quantity" class="form-control" type="number" path="quantity"/>
                <form:errors path="quantity" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="price" class="form-label">Đơn giá:</form:label>
                <form:input id="price" class="form-control" type="number" path="price"/>
                <form:errors path="price" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="/admin/product/${productId}/product-detail">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>