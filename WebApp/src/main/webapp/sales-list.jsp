<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <meta http-equiv="Content_Type" content="text/html"; charset="UTF-8">
    <title>Sales List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="/header.jsp"%>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Sales</h3>
        <hr>
        <div class="container text-left">
            <a href="sale-form.jsp" class="btn btn-secondary">New Sale</a>
        </div>
        <br>
        <table class="table table-bordered text-center">
            <thead>
            <tr style="background-color: lightslategray; color: white">
                <th>ID</th>
                <th>Name</th>
                <th>Product</th>
                <th>Quantity</th>
            </tr>
            </thead>
            <%
                Connection conn;
                ResultSet rs;

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");

                String query = "SELECT buyers.name, products.product, sales.sales_quantity, sales.sales_id  \n" +
                        "FROM buyers, products, sales \n" +
                        "WHERE  buyers.buyer_id = sales.buyer_id \n" +
                        "AND products.product_id = sales.product_id \n" +
                        "ORDER BY sales_id";
                Statement st = conn.createStatement();
                rs = st.executeQuery(query);

                while (rs.next()) {
            %>
            <tbody>
                <tr>
                    <td><%=rs.getString("sales_id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("product")%></td>
                    <td><%=rs.getString("sales_quantity")%></td>
                </tr>
            </tbody>
            <%
                }
            %>

        </table>
    </div>
</div>
</body>
</html>