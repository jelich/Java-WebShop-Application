<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit")!=null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String country = request.getParameter("country");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("insert into buyers (name, email, city, country) values (?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, city);
        pst.setString(4, country);
        pst.executeUpdate();

        response.sendRedirect("buyer-list.jsp");
    }
%>
<html>
<head>
    <meta http-equiv="Content_Type" content="text/html" ; charset="UTF-8">
    <title>Buyer Form</title>
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
                    <h2>Add New Buyer</h2>
                </caption>
                <input type="hidden" name="id">

                <fieldset class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" name="email" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>City</label>
                    <input type="text" class="form-control" name="city">
                </fieldset>

                <fieldset class="form-group">
                    <label>Country</label>
                    <input type="text" class="form-control" name="country">
                </fieldset>

                <button type="submit" id="submit" name="submit" class="btn btn-secondary">Save</button>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>