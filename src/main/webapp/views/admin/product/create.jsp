<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="my-4 text-center">${titleCreate}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/product/create" method="post" modelAttribute="productRequest" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="code" class="form-label">Mã sản phẩm:</form:label>
                <form:input id="code" class="form-control" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label class="form-label" path="name">Tên sản phẩm:</form:label>
                <form:input id="name" class="form-control" path="name"/>
                <form:errors path="name" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/product">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>