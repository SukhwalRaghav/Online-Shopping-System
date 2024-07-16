<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="../footer.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Cart</title>
    <link rel="stylesheet" href="css/myCart-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: "Open Sans", sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
        .alert {
            color: #ff5722;
            font-weight: bold;
            text-align: center;
            margin: 20px 0;
            font-size: 1.1em;
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
            color: black;
            text-decoration: none;
            transition: color 0.3s;
        }
        table a:hover {
            color: #0b7dda;
        }
        .total-row {
            background-color: #f0f0f0;
        }
        .total-row th {
            background-color: brown;
        }
    </style>
</head>
<body>
    <div class="page-title">My Cart <i class='fas fa-cart-arrow-down'></i></div>
    
    <%
    String msg = request.getParameter("msg");
    if ("notPossible".equals(msg)) { %>
    <h3 class="alert">There is only one Quantity! So click on remove!</h3>
    <% }
    if ("inc".equals(msg)) { %>
    <h3 class="alert">Quantity Increased Successfully!</h3>
    <% }
    if ("dec".equals(msg)) { %>
    <h3 class="alert">Quantity Decreased Successfully!</h3>
    <% }
    if ("removed".equals(msg)) { %>
    <h3 class="alert">Product Successfully Removed!</h3>
    <% }
    
    int total = 0;
    int sno = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();

        ResultSet rs1 = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
        if (rs1.next()) {
            total = rs1.getInt(1);
        }
    %>
    <table>
        <thead>
            <tr class="total-row">
                <th scope="col" colspan="7">Total: <i class="fa fa-inr"></i> <% out.println(total); %></th>
                <% if (total > 0) { %>
                <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
                <% } %>
            </tr>
        </thead>
        <thead>
            <tr>
                <th scope="col">S.No</th>
                <th scope="col">Product Name</th>
                <th scope="col">Category</th>
                <th scope="col"><i class="fa fa-inr"></i> Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Sub Total</th>
                <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
            </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs = st.executeQuery("SELECT product.id, product.name, product.category, product.price, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email='" + email + "' AND cart.address IS NULL");
        while (rs.next()) {
            sno += 1;
        %>
            <tr>
                <td><%= sno %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("category") %></td>
                <td><i class="fa fa-inr"></i> <%= rs.getInt("price") %></td>
                <td>
                    <a href="incDecQuantityAction.jsp?id=<%= rs.getString("id") %>&quantity=inc"><i class='fas fa-plus-circle'></i></a> 
                    <%= rs.getInt("quantity") %> 
                    <a href="incDecQuantityAction.jsp?id=<%= rs.getString("id") %>&quantity=dec"><i class='fas fa-minus-circle'></i></a>
                </td>
                <td><i class="fa fa-inr"></i> <%= rs.getInt("total") %></td>
                <td><a href="removeFromCart.jsp?id=<%= rs.getString("id") %>">Remove <i class='fas fa-trash-alt'></i></a></td>
            </tr>
        <%
        }
    } catch (Exception e) {
        e.printStackTrace(); // Print the stack trace for debugging
    }
    %>
        </tbody>
    </table>
</body>
</html>
