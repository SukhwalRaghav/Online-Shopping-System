<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
    session.setAttribute("email", email);
    response.sendRedirect("admin/adminHome.jsp");
} else {
    boolean userExists = false;
    try (Connection con = ConnectionProvider.getCon();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?")) {
        
        ps.setString(1, email);
        ps.setString(2, password);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                userExists = true;
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            }
        }
        if (!userExists) {
            response.sendRedirect("login.jsp?msg=notexist");
        }
    } catch (Exception e) {
        e.printStackTrace(); // Log the exception
        response.sendRedirect("login.jsp?msg=invalid");
    }
}
%>
