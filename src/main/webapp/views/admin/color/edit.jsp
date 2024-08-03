<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<h2 class="my-4 text-center">${titleEdit}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/color/update/${colorId}" method="post" modelAttribute="color" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="code" class="form-label">Mã màu sắc:</form:label>
                <form:input id="code" class="form-control" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label class="form-label" path="name">Tên màu sắc:</form:label>
                <form:input id="name" class="form-control" path="name"/>
                <form:errors path="name" cssClass="error-message"/>
            </div>
            <div class="mb-3">
                <form:label path="status" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="1" label="Hoạt động" />
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="0" label="Ngừng hoạt động"/>
                </div>
                <form:errors path="status" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/color">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>