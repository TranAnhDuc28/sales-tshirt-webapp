<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href="<c:url value='/assets/admin/css/styles.css'/>" rel="stylesheet" />
    <script src="<c:url value='/assets/fontawesome-free/js/all.js'/>" crossorigin="anonymous"></script>
    <style>
        .error-message{
            color: red;
            font-size: 14px;
        }
        .logo {
            max-width: 100%;
            height: auto
        }
    </style>
</head>
<body class="bg-light">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg rounded-lg mt-5">
                            <div class="card-header text-center">
                                <img src="<c:url value='/assets/image/logo.png'/>" class="logo">
                            </div>
                            <div class="card-body">
                                <c:if test="${ sessionScope.errorMessage != null }">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <span> ${ sessionScope.errorMessage } </span>
                                    </div>
                                </c:if>
                                <form action="/auth/login" method="post" >
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" name="username" required/>
                                        <label for="inputEmail">Email address</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="password" required/>
                                        <label for="inputPassword">Password</label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                        <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="#">Forgot Password?</a>
                                        <button class="btn btn-primary">Login</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="#">Need an account? Sign up!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/admin/js/scripts.js'/>"></script>
</body>
</html>
