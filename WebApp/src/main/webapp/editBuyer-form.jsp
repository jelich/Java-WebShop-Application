<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit")!=null) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String country = request.getParameter("country");

        Connection conn;
        PreparedStatement pst;

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");
        pst = conn.prepareStatement("update buyers set name = ?, email = ?, city = ?, country = ? where buyer_id = ?");
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, city);
        pst.setString(4, country);
        pst.setString(5, id);
        pst.executeUpdate();

        response.sendRedirect("buyer-list.jsp");
    }
%>
<html>
<head>
    <title>Edit Buyer Form</title>
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
                    <h2>Edit Buyer</h2>
                </caption>
                <%
                Connection conn;
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?autoReconnect=true&useSSL=false", "root", "root");

                String id = request.getParameter("id");
                pst = conn.prepareStatement("select * from buyers where buyer_id = ?");
                pst.setString(1, id);
                rs = pst.executeQuery();

                while (rs.next()) {

                %>
                <input type="hidden" name="id">

                <fieldset class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" value="<%=rs.getString("name")%>" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" value="<%=rs.getString("email")%>" name="email" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>City</label>
                    <input type="text" class="form-control" value="<%=rs.getString("city")%>" name="city">
                </fieldset>

                <fieldset class="form-group">
                    <label>Country</label>
                    <input type="text" class="form-control" value="<%=rs.getString("country")%>" name="country">
                </fieldset>

                <%
                    }
                %>
                <button type="submit" id="submit" name="submit" class="btn btn-secondary">Edit</button>
                <a href="buyer-list.jsp" class="btn btn-secondary" />Go back</a>
                <br>
            </form>
        </div>
    </div>
</div>
</body>
</html>
