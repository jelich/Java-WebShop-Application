<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit")!=null) {
        String id = request.getParameter("id");
        String product = request.getParameter("product");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");


        Connection conn;
        PreparedStatement pst;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("update products set product = ?, price = ?, quantity = ? where product_id = ?");
        pst.setString(1, product);
        pst.setString(2, price);
        pst.setString(3, quantity);
        pst.setString(4, id);
        pst.executeUpdate();

        response.sendRedirect("product-list.jsp");
    }
%>
<html>
<head>
    <title>Edit Product Form</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.jsp"%>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="#" method="post">
                <caption>
                    <h2>Edit Product</h2>
                </caption>
                <%
                Connection conn;
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");

                String id = request.getParameter("id");
                pst = conn.prepareStatement("select * from products where product_id = ?");
                pst.setString(1, id);
                rs = pst.executeQuery();

                while (rs.next()) {

                %>
                <input type="hidden" name="id">

                <fieldset class="form-group">
                    <label>Product</label>
                    <input type="text" class="form-control" value="<%=rs.getString("product")%>" name="product" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Price</label>
                    <input type="text" class="form-control" value="<%=rs.getString("price")%>" name="price" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Quantity</label>
                    <input type="text" class="form-control" value="<%=rs.getString("quantity")%>" name="quantity">
                </fieldset>

                <%
                    }
                %>
                <button type="submit" id="submit" name="submit" class="btn btn-secondary">Edit</button>
                <a href="product-list.jsp" class="btn btn-secondary" />Go back</a>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
