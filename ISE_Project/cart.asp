<%@ Language="JavaScript" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
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
                <li class="nav-item"><a href="sign.html">Sign Up</a></li>
            </ul>
        </nav>
        <a href="cart.html" class="cart">Cart</a>
    </header>

    <div class="left">
        <div class="logo-div">
            <div class="logo">
            </div>
        </div>

        <p class="category" style="font-style: normal;">Category</p>

        <div class="nav-items">
            <div class="icon-div">
                <img class="icons" src="/icons/bag.png" alt="icon">
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


        <div class="help">
            <div class="icon-div">
                <img class="icons" src="/icons/help.png" alt="icon">
            </div>

             <a class="sidebar" href="viewfd.asp">Help Center</a>
        </div>

    </div>


    <div class="main-content" style="background-color: white;">
        <div class="souvenir-header">

            <h1 class="category-title">Your Shopping Cart</h1>
            <hr> <!-- 添加水平线 -->
        </div>
        <hr>

        <br><br>
        <%
            var conn, rs, sql, username, password;
            username = Request.Form("username");
            password = Request.Form("password");

            conn = Server.CreateObject("ADODB.Connection");
            conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("ise2001.mdb"));

            sql = "SELECT * FROM Customer WHERE CS_Name='" + username + "' AND CS_password='" + password + "'";
            rs = conn.Execute(sql);

            if (!rs.EOF) {

                sql = "SELECT * FROM Shopping_cart WHERE CS_Name='" + username + "'";
                rs = conn.Execute(sql);

                Response.Write("<table class='cart-table'>");
                Response.Write("<thead>");
                Response.Write("<tr><th>Product Image</th><th>Product Information</th><th>Total Cost</th></tr>");
                Response.Write("</thead>");
                Response.Write("<tbody>");


                while (!rs.EOF) {

                    sql_imagePath = "SELECT imagePath FROM Products WHERE Product_name='" + rs("Product_name") + "'";
                    rs_imagePath = conn.Execute(sql_imagePath);

                    Response.Write("<tr>");

                    Response.Write("<td style='text-align: center; align-items: center;'><img src='" + rs_imagePath("imagePath") + "' alt='Product Image' style='width:150px; height:auto;'></td>");

                    Amount = rs("Amount");
                    Cost = rs("Cost");
                    Response.Write("<td>");
                    Response.Write("<strong>" + rs("Product_name") + "</strong>" + "<br>");
                    Response.Write("$" + rs("Cost") + " / pc" + "<br>");
                    Response.Write(Amount + " * " + rs("Product_name"));
                    Response.Write("</td>");

                    Response.Write("<td>$" + Cost * Amount + "</td>");
                    Response.Write("</tr>");
                    rs.MoveNext();
                }
                Response.Write("</tbody>");
                Response.Write("</table>");
            } else {
                Response.Redirect("index.html");
            }

            rs.Close();
            rs = null;
            conn.Close();
            conn = null;
        %>
        </div>


<div class="order-summary">
    <h2>Order Summary</h2>
    <div style="display: table; width: 100%;">
        <%
            var conn, rs, sql, username, password;
            var TotalCost = 0;  // Initialize TotalCost to zero

            username = Request.Form("username");
            password = Request.Form("password");

            conn = Server.CreateObject("ADODB.Connection");
            conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("ise2001.mdb"));

            sql = "SELECT * FROM Customer WHERE CS_Name='" + username + "' AND CS_password='" + password + "'";
            rs = conn.Execute(sql);

            if (!rs.EOF) {

                sql = "SELECT * FROM Shopping_cart WHERE CS_Name='" + username + "'";
                rs = conn.Execute(sql);

                while (!rs.EOF) {
                    var Amount = rs("Amount");
                    var Cost = rs("Cost");
                    var ItemTotal = Cost * Amount;
                    TotalCost += ItemTotal;  // Accumulate total cost

                    Response.Write("<div style='display: table-row;'>");
                    Response.Write("<div style='display: table-cell; text-align: left;'>" + rs("Product_name") + " * " + Amount + "</div>");
                    Response.Write("<div style='display: table-cell; text-align: right;'>$" + ItemTotal + "</div>");
                    Response.Write("</div>");
                    rs.MoveNext();
                }
            } else {
                Response.Redirect("index.html");
            }

            rs.Close();
            rs = null;
            conn.Close();
            conn = null;

            // Display the total cost aligned to the right
            Response.Write("<div style='display: table-row;'>");
            Response.Write("<div style='display: table-cell; text-align: left;'><strong>Total:</strong></div>");
            Response.Write("<div style='display: table-cell; text-align: right;'>$" + TotalCost + "</div>");
            Response.Write("</div>");
        %>
    </div>
    <button class="add-to-cart">Continue to payment 👉</button>
</div>

</body>

</html>