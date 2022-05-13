<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/header.js"></script>
</head>
<body>
    <header>
        <div>
            <h1>Hecipe</h1>
            <img class="navbar-toogle" onclick="toogleNavbar()" src="assets/icons8-menu.svg" alt="">
        </div>
        <nav class="navbar" id="navbar">
            <div class="navbar-nav">
                <div class="navbar-item"><a class="navbar-link" href="home.jsp">Home</a></div>
                <div class="navbar-item"><a class="navbar-link" href="">Foods</a></div>
            </div>
            <div class="navbar-nav admin-navbar">
                <div class="navbar-item"><p class="welcome-text">Welcome, (name)</p></div>
                <div class="navbar-item"><a class="navbar-link" href="">Profile</a></div>
                <div class="navbar-item"><a class="navbar-link" href="">View Transaction</a></div>
            </div>
            <div class="navbar-nav member-navbar">
                <div class="navbar-item"><p class="welcome-text">Welcome, (name)</p></div>
                <div class="navbar-item"><a class="navbar-link" href="">Profile</a></div>
                <div class="navbar-item"><a class="navbar-link" href="">View Chart</a></div>
                <div class="navbar-item"><a class="navbar-link" href="">View Transaction</a></div>
            </div>
            <div class="navbar-nav guest-navbar">
                <div class="navbar-item"><a class="navbar-link" href="">Login</a></div>
                <div class="navbar-item"><a class="navbar-link" href="register.jsp">Register</a></div>
            </div>
        </nav>
    </header>
</body>
</html>