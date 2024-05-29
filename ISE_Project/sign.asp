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
    var username = String(Request.Form("username"));
    var password = String(Request.Form("password"));
    var Email = String(Request.Form("Email"));
    var Age = String(Request.Form("Age"));
    var Contact_number = String(Request.Form("Contact number"));


    var conn = new ActiveXObject("ADODB.Connection");
    conn.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("ise2001.mdb"));

    var SqlString = "INSERT INTO Customer([CS_Name], [CS_password], [Email_address], [Age], [Contact_number]) VALUES('" + username + "', '" + password + "', '" + Email + "', '" + Age + "', '" + Contact_number + "')";
    conn.Execute(SqlString);

    Response.Redirect("index.html?message=The information saved sucessfully!");



    conn.Close();

    %>
</body>
</html>