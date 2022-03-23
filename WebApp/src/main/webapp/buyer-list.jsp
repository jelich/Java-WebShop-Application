<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <meta http-equiv="Content_Type" content="text/html"; charset="UTF-8">
    <title>Buyer List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<%@include file="/header.jsp"%>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Buyers</h3>
        <hr>
        <div class="container text-left">
            <a href="buyer-form.jsp" class="btn btn-secondary">Add New Buyer</a>
        </div>
        <br>

        <table class="table table-bordered text-center">
            <thead>
            <tr style="background-color: lightslategray; color: white">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>City</th>
                <th>Country</th>
                <th>Edit/Delete</th>
            </tr>
            </thead>
            <%
                Connection conn;
                ResultSet rs;

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");

                String query = "select * from buyers";
                Statement st = conn.createStatement();
                rs = st.executeQuery(query);

                while (rs.next()) {
                    String id = rs.getString("buyer_id");
            %>
            <tbody>
                    <tr>
                        <td><%=rs.getString("buyer_id")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("city")%></td>
                        <td><%=rs.getString("country")%></td>
                        <td style="background-color: lightslategray">
                            <a href="editBuyer-form.jsp?id=<%=id%>" class="btn-light btn-sm" />Edit</a>
                            &nbsp
                            <a href="deleteBuyer-form.jsp?id=<%=id%>" class="btn-light btn-sm" />Delete</a>
                        </td>
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