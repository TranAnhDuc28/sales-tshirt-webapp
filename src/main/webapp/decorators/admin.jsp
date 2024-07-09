<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
    <link href="<c:url value='/assets/simple-datatables/css/style.css'/> " rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/assets/admin/css/styles.css'/>"/>
    <script src="<c:url value='/assets/fontawesome-free/js/all.js'/>" crossorigin="anonymous"></script>
    <script src="<c:url value='/assets/jquery/jquery-3.7.1.js'/>"></script>
    <style>
        table {
            font-size: 14px;
        }

        table td {
            align-content: center;
        }
        .error-message{
            font-size: 14px;
            color: red;
        }
        input:focus, select:focus {
            box-shadow: none !important;
        }
    </style>
</head>
<body class="sb-nav-fixed">

<%@ include file="../layout/admin/header.jsp" %>

<div id="layoutSidenav">
    <%@ include file="../layout/admin/sidebar.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <sitemesh:write property='body'/>
            </div>
        </main>
        <%@ include file="../layout/admin/footer.jsp" %>
    </div>
</div>



<script src="<c:url value='/assets/bootstrap/js/bootstrap.bundle.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/admin/js/scripts.js'/>"></script>
<script src="<c:url value='/assets/chart/Chart.min.js'/>" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/admin/assets/demo/chart-area-demo.js'/>"></script>
<script src="<c:url value='/assets/admin/assets/demo/chart-bar-demo.js'/>"></script>
<script src="<c:url value='/assets/simple-datatables/umd/simple-datatables.js'/>"
        crossorigin="anonymous"></script>
<script src="<c:url value='/assets/admin/js/datatables-simple-demo.js'/>"></script>

</body>
</html>
