<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/adminHome-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <div class="topnav sticky">
        <% String email = session.getAttribute("email").toString(); %>
        <div class="header-content">
            <h2>Online Shopping</h2>
            <div class="nav-links">
                <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
                <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
                <a href="">Messages Received <i class='fas fa-comment-alt'></i></a>
                <a href="">Orders Received <i class="fas fa-archive"></i></a>
                <a href="">Cancel Orders <i class='fas fa-window-close'></i></a>
                <a href="">Delivered Orders <i class='fas fa-dolly'></i></a>
                <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
            </div>
        </div>
    </div>
    <br>
    <!-- Table content would go here -->
</body>
</html>
