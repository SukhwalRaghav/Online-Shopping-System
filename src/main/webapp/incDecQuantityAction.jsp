<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incdec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = ConnectionProvider.getCon();
    String query = "SELECT price, total, quantity FROM cart WHERE email=? AND product_id=? AND address IS NULL";
    ps = con.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, id);
    rs = ps.executeQuery();

    if (rs.next()) {
        price = rs.getInt("price");
        total = rs.getInt("total");
        quantity = rs.getInt("quantity");
    }

    if (quantity == 1 && "dec".equals(incdec)) {
        response.sendRedirect("myCart.jsp?msg=notPossible");
    } else if (quantity != 1 && "dec".equals(incdec)) {
        total -= price;
        quantity -= 1;
        query = "UPDATE cart SET total=?, quantity=? WHERE email=? AND product_id=? AND address IS NULL";
        ps = con.prepareStatement(query);
        ps.setInt(1, total);
        ps.setInt(2, quantity);
        ps.setString(3, email);
        ps.setString(4, id);
        ps.executeUpdate();
        response.sendRedirect("myCart.jsp?msg=dec");
    } else if ("inc".equals(incdec)) {
        total += price;
        quantity += 1;
        query = "UPDATE cart SET total=?, quantity=? WHERE email=? AND product_id=? AND address IS NULL";
        ps = con.prepareStatement(query);
        ps.setInt(1, total);
        ps.setInt(2, quantity);
        ps.setString(3, email);
        ps.setString(4, id);
        ps.executeUpdate();
        response.sendRedirect("myCart.jsp?msg=inc");
    }
} catch (Exception e) {
    System.out.println(e);
} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>