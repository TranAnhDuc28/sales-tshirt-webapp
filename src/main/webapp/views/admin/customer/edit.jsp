<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="my-4 text-center">${titleEdit}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/customer/update/${customerId}" method="post" modelAttribute="customer" id="form-create-kh">
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
            <div class="mb-3">
                <form:label path="status" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="1" label="Hoạt động"/>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="0" label="Ngừng hoạt động"/>
                </div>
                <form:errors path="status" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Sửa</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/customer">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>

