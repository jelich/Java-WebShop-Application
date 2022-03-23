<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
        String id = request.getParameter("id");

        Connection conn;
        PreparedStatement pst;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("delete from products where product_id = ?");
        pst.setString(1, id);
        pst.executeUpdate();
%>

<html>
<head>
    <title>Delete Product Page</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="/header.jsp"%>
<h3 class="text-center">Product with ID number <%=id%> successfully deleted</h3>
<hr>
<div class="container text-center">
    <a href="product-list.jsp" class="btn btn-secondary">Go Back</a>
</div>
</body>
</html>
