<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="my-4 text-center">${titleEdit}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/staff/update/${staffId}" method="post" modelAttribute="staff" id="form-update-nv">
            <div class="form-group mb-3">
                <form:label path="code" class="form-label">Mã nhân viên:</form:label>
                <form:input id="code" class="form-control" type="text" path="code"/>
                <form:errors path="code" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="name" class="form-label">Tên nhân viên:</form:label>
                <form:input id="name" class="form-control" type="text" path="name"/>
                <form:errors path="name" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="email" class="form-label">email:</form:label>
                <form:input id="email" class="form-control" type="email" path="email" placeholder="name@example.com"/>
                <form:errors path="email" cssClass="error-message"/>
            </div>
            <div class="mb-3">
                <form:label path="status" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="1" label="Làm việc"/>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="status" value="0" label="Đã nghỉ việc"/>
                </div>
                <form:errors path="status" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Sửa</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/staff">Quay lại</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>


