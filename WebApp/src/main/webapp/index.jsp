<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content_Type" content="text/html"; charset="UTF-8">
    <title>Index Page</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="/header.jsp"%>
<br>
<div class="container">
    <h3 class="text-center">WebShop</h3>
    <hr>
    <div class="text-center">
        <a href="buyer-list.jsp" class="btn btn-secondary" style="width: 200px">Buyers</a>
        <a href="product-list.jsp" class="btn btn-secondary" style="width: 200px">Products</a>
        <a href="sales-list.jsp" class="btn btn-secondary" style="width: 200px">Sales</a>
    </div>
    <br>
    <img src="photos/image.jpg" style="margin-left: auto; margin-right: auto; display: block; width: 100%">
</div>
</body>
</html>