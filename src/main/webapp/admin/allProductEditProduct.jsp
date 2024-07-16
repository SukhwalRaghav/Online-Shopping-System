<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3 {
    color: yellow;
    text-align: center;
}
.table-container {
    margin: 0 auto;
    width: 90%;
    overflow-x: auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    color: white;
    background-color: #333;
}
th, td {
    padding: 10px;
    border: 1px solid #555;
    text-align: center;
}
th {
    background-color: #444;
}
td {
    background-color: #222;
}
.alert {
    color: red;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>

<%
String msg = request.getParameter("msg");
if ("done".equals(msg)) { %>
    <h3 class="alert">Product Successfully Updated!</h3>
<% } else if ("wrong".equals(msg)) { %>
    <h3 class="alert">Something went wrong! Try again!</h3>
<% } %>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Status</th>
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
            <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                con = ConnectionProvider.getCon();
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM product");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><i class="fa fa-inr"></i><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><a href="editProduct.jsp?id=<%= rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (st != null) st.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
        </tbody>
    </table>
</div>

<br>
<br>
<br>

</body>
</html>
