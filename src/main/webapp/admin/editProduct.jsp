<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp"%>
<%@ include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back {
    color: white;
    margin-left: 2.5%;
}
</style>
</head>
<body>
<h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

<%
String id = request.getParameter("id");
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    con = ConnectionProvider.getCon();
    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM product WHERE id='" + id + "'");

    if (rs.next()) {
%>

<form action="editProductAction.jsp" method="post">
    <input type="hidden" name="id" value="<%out.println(id);%>">

    <div class="left-div">
        <h3>Enter Name</h3>
        <input class="input-Style" type="text" name="name" value="<%= rs.getString(2) %>" required>
        <hr>
    </div>

    <div class="right-div">
        <h3>Enter Category</h3>
        <input class="input-Style" type="text" name="category" value="<%= rs.getString(3) %>" required>
        <hr>
    </div>

    <div class="left-div">
        <h3>Enter Price</h3>
        <input class="input-Style" type="number" name="price" value="<%= rs.getString(4) %>" required>
        <hr>
    </div>

    <div class="right-div">
        <h3>Active</h3>
        <select class="input-style" name="active">
            <option value="Yes" <%= "Yes".equals(rs.getString(5)) ? "selected" : "" %>>Yes</option>
            <option value="No" <%= "No".equals(rs.getString(5)) ? "selected" : "" %>>No</option>
        </select>
        <hr>
    </div>
    <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>

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

</body>
<br><br><br>
</body>
</html>
