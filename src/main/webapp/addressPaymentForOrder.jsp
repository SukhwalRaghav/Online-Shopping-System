<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <script>
        // Fixed JavaScript: Corrected typos and removed unnecessary code
        if (window.history.forward(1) != null) {
            window.history.forward(1);
        }
    </script>
</head>
<body>
    <br>
    <table>
        <thead>
            <tr>
                <th scope="col">
                    <a href="myCart.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a>
                </th>
                <th scope="col" style="background-color: yellow;">
                    Total: <i class="fa fa-inr"></i> <% 
                    String email = session.getAttribute("email").toString();
                    int total = 0;
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs1 = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND address IS NULL");
                        if (rs1.next()) {
                            total = rs1.getInt(1);
                        }
                    %>
                    <%= total %>
                    <% 
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                    %>
                </th>
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
            </tr>
        </thead>
        <tbody>
            <% 
            int sno = 0;
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT product.id, product.name, product.category, product.price, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email='" + email + "' AND cart.address IS NULL");
                while (rs.next()) {
            %>
            <tr>
                <td><%= ++sno %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("category") %></td>
                <td><i class="fa fa-inr"></i> <%= rs.getDouble("price") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><i class="fa fa-inr"></i> <%= rs.getDouble("total") %></td>
            </tr>
            <% 
                }
                // Fetching user details for the form
                ResultSet rs2 = st.executeQuery("SELECT * FROM user WHERE email='" + email + "'");
                if (rs2.next()) {
            %>
        </tbody>
    </table>

    <hr style="width: 100%">
    <form action="addressPaymentForOrderAction.jsp" method="post">
        <div class="left-div">
            <h3>Enter Address</h3>
            <input class="style-input" type="text" name="address" value="<%= rs2.getString(7) %>" placeholder="Enter the Address">
        </div>

        <div class="right-div">
            <h3>Enter City</h3>
            <input class="style-input" type="text" name="city" value="<%= rs2.getString(8) %>" placeholder="Enter the City">
        </div> 

        <div class="left-div">
            <h3>Enter State</h3>
            <input class="style-input" type="text" name="state" value="<%= rs2.getString(9) %>" placeholder="Enter the State">
        </div>

        <div class="right-div">
            <h3>Enter Country</h3>
            <input class="style-input" type="text" name="country" value="<%= rs2.getString(10) %>" placeholder="Enter the Country">
        </div>

        <h3 style="color: red">*If there is no address, it means that you did not set your address!</h3>
        <h3 style="color: red">*This address will also be updated to your profile</h3>
        <hr style="width: 100%">

        <div class="left-div">
            <h3>Select Way of Payment</h3>
            <select class="input-style" name="paymentMethod"> 
                <option value="Cash on Delivery(COD)">Cash on Delivery(COD)</option>
                <option value="Online Payment">Online Payment</option>
            </select>
        </div>

        <div class="right-div">
            <h3>Pay online at: Raghav@pay.com</h3>
            <input class="style-input" type="text" name="transactionID" placeholder="Enter the Transaction ID">
            <h3 style="color: red">*If you select online payment, then enter your transaction ID here; otherwise, leave this blank</h3>
        </div>

        <hr style="width: 100%">

        <div class="left-div">
            <h3>Mobile Number</h3>
            <input class="input-style" type="text" name="mobileNumber" value="<%= rs2.getString(3) %>" placeholder="Enter the Mobile Number" required>
            <h3 style="color: red">*This mobile number will also be updated to your profile</h3>
        </div>

        <div class="right-div">
            <h3 style="color: red">*If you enter the wrong transaction ID, your order may be canceled!</h3>
            <button class="button" type="submit">Proceed to Generate the Bill <i class='far fa-arrow-alt-circle-right'></i></button>
            <h3 style="color: red">*Fill the form correctly</h3>
        </div>
    </form>
    <% 
        } // End of user details ResultSet
    } catch(Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
