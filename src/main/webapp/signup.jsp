<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Sign Up</title>
</head>
<body>
<div id='container'>
  <div class="signup">
    <form action="signupAction.jsp" method="post">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" placeholder="Enter Name" required>
      
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Enter Email" required>
      
      <label for="mobileNumber">Mobile Number:</label>
      <input type="number" id="mobileNumber" name="mobileNumber" placeholder="Enter Mobile Number" required>
      
      <label for="securityQuestions">Security Question:</label>
      <select id="securityQuestions" name="securityQuestions" required>
        <option value="">Select a question</option>
        <option value="firstCar">What was your first car?</option>
        <option value="homeName">What is your name at home?</option>
        <option value="dreamPlace">What is your dream place to visit?</option>
        <option value="favoriteFood">What is your favorite food?</option>
      </select>
      
      <label for="answer">Answer:</label>
      <input type="text" id="answer" name="answer" placeholder="Enter Answer" required>
      
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter Password" required>
      
      <input type="submit" value="Sign Up">
    </form>
    <h2><a href="login.jsp">Login</a></h2>
  </div>
  
  <div class='whysign'>
    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) { %>
      <h1>Successfully Registered</h1>
    <% } else if ("invalid".equals(msg)) { %>
      <h1>Something Went Wrong! Try Again!</h1>
    <% } %>
    
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>
