<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit")!=null) {
        String salesQuantity = request.getParameter("sales_quantity");
        String buyerID = request.getParameter("buyer_id");
        String productID = request.getParameter("product_id");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("insert into sales (sales_quantity, buyer_id, product_id) values (?,?,?)");
        pst.setString(1, salesQuantity);
        pst.setString(2, buyerID);
        pst.setString(3, productID);
        pst.executeUpdate();

        response.sendRedirect("sales-list.jsp");
    }
%>
<%ResultSet rs = null;%>
<html>
<head>
    <title>Sale Form</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@include file="/header.jsp" %>
<br>
<div class="container col-md-4">
    <div class="card">
        <div class="card-body">
            <form action="" method="post">
                <caption>
                    <h2>New Sale</h2>
                </caption>
                <input type="hidden" name="sales_id">
                    <%
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/shop?user=root&password=root");
            Statement statement = connection.createStatement();
            rs = statement.executeQuery("select * from buyers");
    %>
                <div class="form-group">
                    <label>Please select Buyer</label>
                    <select class="form-control" name="buyer_id">
                        <option value="-1">Choose Buyer</option>
                        <% while (rs.next()) { %>
                        <option value="<%=rs.getInt("buyer_id")%>"><%= rs.getString("name")%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <br>
                    <%
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>
                    <%
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/shop?user=root&password=root");
            Statement statement = connection.createStatement();
            rs = statement.executeQuery("select * from products");
    %>
                <div class="form-group">
                    <label>Please select Product</label>
                    <select class="form-control"  name="product_id">
                        <option value="-1">Choose Product</option>
                        <% while (rs.next()) { %>
                        <option value="<%=rs.getInt("product_id")%>"><%= rs.getString("product")%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <br>
                    <%
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>
                <fieldset class="form-group">
                    <label>Quantity</label>
                    <input type="text" class="form-control" name="sales_quantity" style="width: 50px">
                </fieldset>
                <button type="submit" id="submit" name="submit" class="btn btn-secondary">Submit</button>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
