<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="my-4">
    <h2 class="text-center">${titleEdit}</h2>
</div>

<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6 card shadow p-4">
        <c:if test="${errorMessage != null}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <span>${errorMessage}</span>
            </div>
        </c:if>
        <form:form action="/admin/hoa-don/update/${idHoaDon}" method="post" id="form-update-hd" modelAttribute="hd">
            <div class="form-group mb-3">
                <label for="id-hd" class="form-label">Mã hóa đơn:</label>
                <input id="id-hd" class="form-control" type="number" name="id" value="${idHoaDon}" readonly="true"/>
            </div>
            <div class="form-group mb-3">
                <label for="select-nv" class="form-label">Nhân viên:</label>
                <form:select id="select-nv" class="form-select" path="idNhanVien">
                    <c:forEach items="${dsNV}" var="item">
                        <form:option value="${item.id}">
                                ${item.ma} - ${item.ten}
                        </form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="idNhanVien" cssClass="error-message"/>
            </div>
            <div class="form-group mb-3">
                <label for="select-kh" class="form-label">Khách hàng:</label>
                <form:select id="select-kh" class="form-select" path="idKhachHang">
                    <option value="" selected>---</option>
                    <c:forEach items="${dsKH}" var="item">
                        <form:option value="${item.id}">
                            ${item.ma} - ${item.ten}
                        </form:option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="mb-3 text-center">
                <button type="submit" class="btn btn-warning">Sửa</button>
                <a class="btn btn-secondary" href="/admin/hoa-don">Quay lại</a>
            </div>
        </form:form>
    </div>
    <div class="col-sm-3"></div>
</div>

