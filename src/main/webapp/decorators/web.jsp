
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/web/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../assets/web/css/styles.css" rel="stylesheet" />
</head>
<body>
<!-- Navigation-->
<%@ include file="../layout/web/header.jsp" %>

<!-- Section-->
<sitemesh:write property='body'/>

<!-- Footer-->
<%@ include file="../layout/web/footer.jsp" %>

<!-- Bootstrap core JS-->
<script src="../assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../assets/web/js/scripts.js"></script>
</body>
</html>
