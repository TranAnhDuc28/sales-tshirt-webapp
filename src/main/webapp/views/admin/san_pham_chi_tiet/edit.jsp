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
        <form:form action="/admin/san-pham/${idSanPham}/spct/update/${idSPCT}" method="post" modelAttribute="spct" id="form-create-ms">
            <div class="form-group mb-3">
                <form:label path="maSPCT" class="form-label">Mã SPCT:</form:label>
                <form:input id="maSPCT" class="form-control" path="maSPCT"/>
                <form:errors path="maSPCT" cssClass="error-message"/>
            </div>
            <div class="mb-2">
                <label class="form-label">Tên sản phẩm: </label>
                <span><strong>${tenSP}</strong></span>
                <div class="error-message"><span class="form-message"></span></div>
            </div>
            <div class="form-group mb-3">
                <form:label path="idKichThuoc" class="form-label">Kích thước:</form:label>
                <form:select id="idKichThuoc" class="form-select" path="idKichThuoc">
                    <form:options items="${listKT}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <form:errors path="idKichThuoc" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="idMauSac" class="form-label">Màu sắc:</form:label>
                <form:select id="idMauSac" class="form-select" path="idMauSac">
                    <form:options items="${listMS}" itemLabel="ten" itemValue="id"/>
                </form:select>
                <form:errors path="idMauSac" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="soLuong" class="form-label">Số lượng:</form:label>
                <form:input id="soLuong" class="form-control" type="number" path="soLuong"/>
                <form:errors path="soLuong" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <form:label path="donGia" class="form-label">Đơn giá:</form:label>
                <form:input id="donGia" class="form-control" type="number" path="donGia"/>
                <form:errors path="donGia" cssClass="error-message"/>
            </div>
            <div class="mb-3">
                <form:label path="trangThai" class="form-label">Trạng thái:</form:label> <br/>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="trangThai" value="1" label="Đang kinh doanh" />
                </div>
                <div class="form-check form-check-inline">
                    <form:radiobutton class="form-check-input" path="trangThai" value="0" label="Ngừng kinh doanh"/>
                </div>
                <form:errors path="trangThai" cssClass="error-message"/>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <a class="btn btn-secondary" href="/admin/san-pham/${idSanPham}/spct">Hủy</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>
