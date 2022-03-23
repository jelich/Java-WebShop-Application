<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit")!=null) {
        String product = request.getParameter("product");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("insert into products (product, price, quantity) values (?,?,?)");
        pst.setString(1, product);
        pst.setString(2, price);
        pst.setString(3, quantity);
        pst.executeUpdate();

        response.sendRedirect("product-list.jsp");
    }
%>
<html>
<head>
    <meta http-equiv="Content_Type" content="text/html" ; charset="UTF-8">
    <title>Product Form</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="/header.jsp"%>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="" method="post">
                <caption>
                    <h2>Add New Product</h2>
                </caption>
                <input type="hidden" name="id">

                <fieldset class="form-group">
                    <label>Product</label>
                    <input type="text" class="form-control" name="product" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Price</label>
                    <input type="text" class="form-control" name="price" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Quantity</label>
                    <input type="text" class="form-control" name="quantity">
                </fieldset>

                <button type="submit" id="submit" name="submit" class="btn btn-secondary">Save</button>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>