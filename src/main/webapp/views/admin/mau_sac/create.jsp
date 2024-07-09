<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="mt-4 text-center">${titleCreate}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/mau-sac/create" method="post" modelAttribute="ms" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="ma" class="form-label">Mã màu sắc:</form:label>
                <form:input id="ma" class="form-control" path="ma"/>
                <form:errors path="ma" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label class="form-label" path="ten">Tên màu sắc:</form:label>
                <form:input id="ten" class="form-control" path="ten"/>
                <form:errors path="ten" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="/admin/mau-sac">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>