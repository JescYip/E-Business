<%@ language="javascript"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">

    <style>
        .feedback-list li {
            font-size: 30px; 
            margin-bottom: 10px;
        }
    </style>
    <title>PolyU Campus Online Store Platform</title>


</head>

<body>

    <header class="header">
        <h1 class="main-title">PolyU Campus Online Store Platform</h1>
        <nav>
            <ul class="nav">
                <li class="nav-item"><a href="search.html">Search</a></li>
                <li class="nav-item"><a href="index.html">Home</a></li>
                <li class="nav-item"><a href="feedback.html">Feedback</a></li>
                <li class="nav-item"><a href="about.html">About us</a></li>
                <li class="nav-item"><a href="sign.html">sign up</a></li>
            </ul>
        </nav>
        <a href="#" onclick="showLoginPopup(); return false;" class="cart">Cart</a>

        <!-- Login Form -->
        <form action="cart.asp" id="loginPopup" method="post">
            You need to log in first:<br>
            <label>🧑🏻‍ Username:</label>
            <input type="text" name="username" required><br>
            <label>🔑 Password:</label>
            <input type="password" name="password" required><br>
            Click "login" button to log in 👉
            <input type="submit" value="Login">
        </form>
    </header>
    
    <div class="left">
        <div class="logo-div">
            <div class="logo">
            </div>
        </div>

        <p class="category" style="font-style: normal;">Category</p>

        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/bag.png" alt="Souvenior icon">
            </div>
            <a class="sidebar" href="#souvenir">Souvenir</a>
        </div>

        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/gift.png" alt="icon">
            </div>
            <a class="sidebar" href="#gifts">Gifts</a>
        </div>

        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/Stationery.png" alt="icon">
            </div>
            <a class="sidebar" href="#stationery">Stationery</a>
        </div>
        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/design.png" alt="icon">
            </div>
            <a class="sidebar" href="#polyudesign">Polyu Design</a>
        </div>


        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/help.png" alt="icon">
            </div>

            <a class="sidebar" href="viewfd.asp">Help Center</a>
        </div>
    </div>

    <div class="main-content" style="background-color: white;">


        <center><h1 class="category-title">Product Feedbacks</h1></center>
        <hr>


        <%
        var conn, rs, sql;

        try {
            conn = Server.CreateObject("ADODB.Connection");
            conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("ise2001.mdb"));
            sql = "SELECT * FROM Feedback";
            rs = conn.Execute(sql);

            if (!rs.EOF) {
                Response.Write("<ul class='feedback-list'>");
                while (!rs.EOF) {
                    Response.Write("<li>" + rs("Product_name") + ": " + rs("Content") + "</li>");
                    rs.MoveNext();
                }
                Response.Write("</ul>");
            } else {
                Response.Write("No data available.");
            }
        } catch (e) {
            Response.Write("Error accessing the database: " + e.description);
        } finally {
            if (rs != null) {
                rs.Close();
            }
            if (conn != null) {
                conn.Close();
            }
        }
        %>
    </div>
</body>

</html>