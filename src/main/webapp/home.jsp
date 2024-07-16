<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="../footer.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body {
        font-family: "Open Sans", sans-serif;
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 0;
    }
    h3 {
        color: #4CAF50;
        text-align: center;
    }
    .alert {
        color: #ff5722;
        font-weight: bold;
        text-align: center;
        margin: 20px 0;
    }
    .content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    .page-title {
        color: #fff;
        background-color: #2196F3;
        padding: 20px;
        text-align: center;
        font-size: 30px;
        margin-bottom: 20px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    table th, table td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    table th {
        background-color: #2196F3;
        color: white;
        text-transform: uppercase;
    }
    table tr:hover {
        background-color: #f1f1f1;
    }
    table a {
        color: #2196F3;
        text-decoration: none;
        transition: color 0.3s;
    }
    table a:hover {
        color: #0b7dda;
    }

</style>
</head>
<body>
<div class="page-title">Home <i class="fa fa-institution"></i></div>
<div class="content">
<%
String msg = request.getParameter("msg");
if ("added".equals(msg)) {
%>
<h3 class="alert">Product added successfully!</h3>
<%
} else if ("exist".equals(msg)) {
%>
<h3 class="alert">Product already exists in your cart! Quantity increased!</h3>
<%
} else if ("invalid".equals(msg)) {
%>
<h3 class="alert">Something went wrong! Try again!</h3>
<%
}
%>
<table>
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where active='Yes'");
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </tbody>
</table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
