<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h2 class="my-4 text-center">${titleEdit}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <c:if test="${errorMessage != null}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <span>${errorMessage}</span>
            </div>
        </c:if>
        <form:form action="/admin/san-pham/${productId}/spct/update/${productDetailId}" method="post"
                   modelAttribute="productDetail" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="maSPCT" class="form-label">Mã SPCT:</form:label>
                <form:input id="maSPCT" class="form-control" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="mb-2">
                <label class="form-label">Tên sản phẩm: </label>
                <span><strong>${productDetailName}</strong></span>
                <div class="error-message"><span class="form-message"></span></div>
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
                    <form:options items="${colorListActive}" itemLabel="name" itemValue="id"/>
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
            <div class="mb-3">
                <form:label path="status" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="1" label="Đang kinh doanh" />
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="0" label="Ngừng kinh doanh"/>
                </div>
                <form:errors path="status" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="/admin/product/${productId}/product-detail">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>
