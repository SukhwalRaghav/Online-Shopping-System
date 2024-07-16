<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Shopping</title>
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <div class="topnav sticky">
        <div class="header-content">
            <center><h2>Online Shopping</h2></center>
            <% String email = session.getAttribute("email").toString(); %>
            <h2>
                <a href=""><% out.println(email); %> <i class="fas fa-user-alt"></i></a>
            </h2>
            <a href="home.jsp">Home <i class="fa fa-institution"></i></a>
            <a href="myCart.jsp">My Cart <i class="fas fa-cart-arrow-down"></i></a>
            <a href="">My Orders <i class="fab fa-elementor"></i></a>
            <a href="">Change Details <i class="fa fa-edit"></i></a>
            <a href="">Message Us <i class="fas fa-comment-alt"></i></a>
            <a href="">About <i class="fa fa-address-book"></i></a>
            <a href="logout.jsp">Logout <i class="fas fa-share-square"></i></a>
            <div class="search-container">
                <form action="searchHome.jsp">
                    <input type="text" name="search" placeholder="Search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
    </div>
    <br>
    <!-- Table -->

    <!-- Your table code here -->

</body>
</html>
