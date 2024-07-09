<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<h2 class="mt-4 text-center">${titleCreate}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/khach-hang/create" method="post" modelAttribute="kh" id="form-create-kh">
            <div class="form-group mb-3">
                <form:label path="ma" class="form-label">Mã khách hàng:</form:label>
                <form:input id="ma" class="form-control" path="ma"/>
                <form:errors path="ma" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="ten" class="form-label">Tên khách hàng:</form:label>
                <form:input id="ten" class="form-control" path="ten"/>
                <form:errors path="ten" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="SDT" class="form-label">Số điện thoại:</form:label>
                <form:input id="SDT" class="form-control" path="SDT"/>
                <form:errors path="SDT" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Thêm</button>
                <a class="btn btn-secondary" href="/admin/khach-hang">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>


