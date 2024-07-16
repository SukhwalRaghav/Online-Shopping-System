<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="footer.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="css/bill.css">
    <title>Bill</title>
</head>
<body>

<%
String email = session.getAttribute("email").toString();
int total = 0;
int sno = 0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND status='bill'");
    if (rs.next()) {
        total = rs.getInt(1);
    }
    ResultSet rs2 = st.executeQuery("SELECT * FROM user INNER JOIN cart ON user.email = cart.email WHERE cart.email='" + email + "' AND cart.status='bill'");
    if (rs2.next()) {
%>
<h3>Online Shopping Bill</h3>
<hr>
<div class="left-div"><h3>Name: <%= rs2.getString("user.name") %></h3></div>
<div class="right-div-right"><h3>Email: <%= email %></h3></div>
<div class="right-div"><h3>Mobile Number: <%= rs2.getString("user.mobileNumber") %></h3></div>  

<div class="left-div"><h3>Order Date: <%= rs2.getString("cart.orderDate") %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%= rs2.getString("cart.paymentMethod") %></h3></div>
<div class="right-div"><h3>Expected Delivery: <%= rs2.getString("cart.deliveryDate") %></h3></div> 

<div class="left-div"><h3>Transaction Id: <%= rs2.getString("cart.transactionID") %></h3></div>
<div class="right-div-right"><h3>City: <%= rs2.getString("user.city") %></h3></div> 
<div class="right-div"><h3>Address: <%= rs2.getString("user.address") %></h3></div> 

<div class="left-div"><h3>State: <%= rs2.getString("user.state") %></h3></div>
<div class="right-div-right"><h3>Country: <%= rs2.getString("user.country") %></h3></div>  

<hr>
<%
    }
%>

<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Sub Total</th>
  </tr>

<%
    ResultSet rs3 = st.executeQuery("SELECT product.name, product.category, product.price, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email='" + email + "' AND cart.status='bill'");
    while (rs3.next()) {
%>
  <tr>
    <td><%= ++sno %></td>
    <td><%= rs3.getString("product.name") %></td>
    <td><%= rs3.getString("product.category") %></td>
    <td><%= rs3.getDouble("product.price") %></td>
    <td><%= rs3.getInt("cart.quantity") %></td>
    <td><%= rs3.getDouble("cart.total") %></td>
  </tr>
<%
    }
%>
</table>

<h3>Total: <%= total %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>

<%
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
