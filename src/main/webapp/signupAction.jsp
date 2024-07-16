<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestions = request.getParameter("securityQuestions");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = ""; // Assuming these fields will be filled later
String city = "";
String state = "";
String country = "";

if(name != null && email != null && mobileNumber != null && securityQuestions != null && answer != null && password != null) {
    try (Connection con = ConnectionProvider.getCon();
         PreparedStatement ps = con.prepareStatement("INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
        
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobileNumber);
        ps.setString(4, securityQuestions);
        ps.setString(5, answer);
        ps.setString(6, password);
        ps.setString(7, address);
        ps.setString(8, city);
        ps.setString(9, state);
        ps.setString(10, country);
        
        ps.executeUpdate();
        response.sendRedirect("signup.jsp?msg=valid");
    } catch (Exception e) {
        e.printStackTrace(); // Log the exception
        response.sendRedirect("signup.jsp?msg=invalid");
    }
} else {
    response.sendRedirect("signup.jsp?msg=invalid");
}
%>
