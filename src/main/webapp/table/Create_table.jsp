<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try (Connection con = ConnectionProvider.getCon();
     Statement st = con.createStatement()) {
    
    String q1 = "CREATE TABLE user (" +
                "name VARCHAR(100), " +
                "email VARCHAR(100) PRIMARY KEY, " +
                "mobileNumber BIGINT, " +
                "securityQuestions VARCHAR(200), " +
                "answer VARCHAR(200), " +
                "password VARCHAR(100), " +
                "address VARCHAR(500), " +
                "city VARCHAR(100), " +
                "state VARCHAR(100), " +
                "country VARCHAR(100))";
    
    String q2 = "CREATE TABLE product (" +
                "id INT, " +
                "name VARCHAR(500), " +
                "category VARCHAR(200), " +
                "price INT, " +
                "active VARCHAR(200))";
    
    String q3 = "CREATE TABLE cart (" +
	            "email varchar(100), " +
	            "product_id int, " +
	            "quantity int, " +
	            "price int, " +
	            "total int, "+
	            "address varchar(500), "+
	            "city varchar(100), "+
	            "state varchar(100), "+
	            "country varchar(100), "+
	            "mobileNumber bigint, "+
	            "orderDate varchar(100), "+
	            "deliveryDate varchar(100), "+
	            "paymentMethod varchar(100), "+
	            "transactionId varchar(100), "+
	            "status varchar(10))";
    
    //st.execute(q1);
    //st.execute(q2);
    st.execute(q3);
    
    out.println("Tables Created");
} catch (Exception e) {
    e.printStackTrace(); 
    out.println("Error: " + e.getMessage());
}
%>
