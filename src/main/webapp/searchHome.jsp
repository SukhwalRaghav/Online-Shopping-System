<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="../footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h1 {
    color: white;
    text-align: center;
}
h3 {
    color: yellow;
    text-align: center;
}
.alert {
    color: red;
}
table {
    border: 1px solid #ccc;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    width: 100%;
    table-layout: fixed;
}
table caption {
    font-size: 1.5em;
    margin: .5em 0 .75em;
}
table tr {
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    padding: .35em;
}
table th,
table td {
    padding: .625em;
    text-align: center;
}
table th {
    font-size: .85em;
    letter-spacing: .1em;
    text-transform: uppercase;
}
.footer {
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #ccc;
    color: black;
    text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

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
int z = 0;
try {
    String search = request.getParameter("search");
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from product where (name like '%" + search + "%' or category like '%" + search + "%') and active='Yes'");
    while (rs.next()) {
        z++;
%>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?product_id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
        </tr>
<%
    }
    if (z == 0) {
%>
        <tr>
            <td colspan="5"><h1 style="color:Black">Nothing to show</h1></td>
        </tr>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>
    </tbody>
</table>

<br><br><br>
<div class="footer">
    <p>All right reserved by BTech Days</p>
</div>
</body>
</html>
