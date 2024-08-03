<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Main</div>
                <a class="nav-link" href="/admin/home">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-house"></i></div>
                    Trang Chủ
                </a>
                <div class="sb-sidenav-menu-heading">Manager</div>
                <a class="nav-link" href="/admin/sales">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-cash-register"></i></div>
                    Bán Hàng Tại Quầy
                </a>
                <a class="nav-link" href="/admin/bill">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-file-invoice"></i></div>
                    Hóa Đơn
                </a>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
                   aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fa-brands fa-product-hunt"></i></div>
                    Quản Lý Sản Phẩm
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                     data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="/admin/product">Sản Phẩm</a>
                        <a class="nav-link" href="/admin/size">Kích Thước</a>
                        <a class="nav-link" href="/admin/color">Màu Sắc</a>
                    </nav>
                </div>
                <a class="nav-link" href="/admin/customer">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-user-group"></i></div>
                    Khách Hàng
                </a>
                <a class="nav-link" href="/admin/staff">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-user"></i></div>
                    Nhân viên
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer py-0">
            <hr class="my-0">
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4 py-2">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <div class="sb-nav-link-icon d-inline-block"><i class="fas fa-user fa-fw"></i>
                            <span>Tài khoản</span>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/auth/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</div>
