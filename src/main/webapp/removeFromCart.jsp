<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;

try {
    con = ConnectionProvider.getCon();
    String query = "DELETE FROM cart WHERE email = ? AND product_id = ? AND address IS NULL";
    ps = con.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, product_id);
    int rowsAffected = ps.executeUpdate();
    if (rowsAffected > 0) {
        response.sendRedirect("myCart.jsp?msg=removed");
    } else {
        response.sendRedirect("myCart.jsp?msg=notFound");
    }
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("myCart.jsp?msg=error");
} finally {
    try {
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
