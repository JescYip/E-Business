<%@ language="javascript"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Feedback</title>
</head>
<body>
    <%
        var CS_Name = Request.Form("CS_Name");
        var CS_Password = Request.Form("CS_password");
        var Product_Name = Request.Form("Product_name");
        var Content = Request.Form("Content");

        var conn = new ActiveXObject("ADODB.Connection");
        try {
            conn.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("ise2001.mdb"));
            var sql = "SELECT * FROM Customer WHERE CS_Name='" + CS_Name + "' AND CS_password='" + CS_Password + "'";
            var rs = conn.Execute(sql);

            if (!rs.EOF) {
                var SqlString = "INSERT INTO Feedback(CS_Name, Product_Name, Content) VALUES('" + CS_Name + "', '" + Product_Name + "', '" + Content + "')";
                conn.Execute(SqlString);
                Response.Redirect("index.html?message=Your feedback is very important for us!");
            } else {
                Response.Redirect("index.html?message=Your account information is wrong, please try again. We value honest feedback from our user.");
            }
        } catch (e) {
            Response.Write("Error: " + e.message);
        } finally {
            if (rs) {
                rs.Close();
                rs = null;
            }
            if (conn) {
                conn.Close();
                conn = null;
            }
        }
    %>
</body>
</html>

