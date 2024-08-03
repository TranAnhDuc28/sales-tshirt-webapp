<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<h2 class="mt-4 text-center">${titleCreate}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/customer/create" method="post" modelAttribute="customerRequest" id="form-create-kh">
            <div class="form-group mb-3">
                <form:label path="code" class="form-label">Mã khách hàng:</form:label>
                <form:input id="code" class="form-control" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="name" class="form-label">Tên khách hàng:</form:label>
                <form:input id="name" class="form-control" path="name"/>
                <form:errors path="name" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="phone-number" class="form-label">Số điện thoại:</form:label>
                <form:input id="phone-number" class="form-control" path="phoneNumber"/>
                <form:errors path="phoneNumber" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Thêm</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/customer">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>


