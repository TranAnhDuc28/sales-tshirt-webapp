<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<h2 class="my-4 text-center">${titleEdit}</h2>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <form:form action="/admin/kich-thuoc/update/${idKichThuoc}" method="post" modelAttribute="kt" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="ma" class="form-label">Mã kích thước:</form:label>
                <form:input id="ma" class="form-control" path="ma"/>
                <form:errors path="ma" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label class="form-label" path="ten">Tên kích thước:</form:label>
                <form:input id="ten" class="form-control" path="ten"/>
                <form:errors path="ten" cssClass="error-message"/>
            </div>
            <div class="mb-3">
                <form:label path="trangThai" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="trangThai" value="1" label="Hoạt động"/>
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="trangThai" value="0" label="Ngừng hoạt động"/>
                </div>
                <form:errors path="trangThai" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="/admin/mau-sac">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>

