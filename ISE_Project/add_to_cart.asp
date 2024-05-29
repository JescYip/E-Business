<%@ language="javascript"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Sign Up</title>
</head>
<body>
    <%
    var action = String(Request.Form("action"));
    var Product_name = String(Request.Form("productName"));
    var Cost = parseInt(String(Request.Form("productPrice")).match(/\d+/)[0]);
    var Type = String(Request.Form("productType"));
    var CS_Name = String(Request.Form("username"));
    var Amount = parseInt(Request.Form("amount"));
    var password = String(Request.Form("password"));

    var conn = new ActiveXObject("ADODB.Connection");
    conn.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("ise2001.mdb"));
    var sqlVerify = "SELECT COUNT(*) AS UserCount FROM Customer WHERE CS_Name='" + CS_Name + "' AND CS_password='" + password + "'";
    var rs = conn.Execute(sqlVerify);
    if (rs("UserCount").Value > 0) {
        var sqlInsert = "INSERT INTO Shopping_cart([CS_Name], [Product_name], [Amount], [Cost]) VALUES('" + CS_Name + "', '" + Product_name + "', " + Amount + ", " + Cost + ")";
        conn.Execute(sqlInsert);
        Response.Redirect("index.html?message=Successfully added to cart.");
    } else {
        Response.Redirect("index.html?message=Invalid username or password.");
    }

    conn.Close();
   

    %>
</body>
</html>