<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/login-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div id="container">
        <div class="login-form">
            <h1>Login</h1>
            <form action="loginAction.jsp" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Enter Email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter Password" required>
                </div>
                <button type="submit">Login</button>
            </form>
            <div class="links">
                <a href="signup.jsp">Sign Up</a>
                <a href="forgotPassword.jsp">Forgot Password?</a>
            </div>
        </div>

        <div class="info-section">
            <%
            String msg = request.getParameter("msg");
            if ("notexist".equals(msg)) { %>
                <h2 class="error-message">Incorrect Username or Password</h2>
            <% } else if ("invalid".equals(msg)) { %>
                <h2 class="error-message">Something Went Wrong! Try Again!</h2>
            <% } %>

            <h2>Welcome to Online Shopping</h2>
            <p>The Online Shopping System allows you to shop conveniently from home without the need to visit physical stores.</p>
        </div>
    </div>
</body>
</html>
