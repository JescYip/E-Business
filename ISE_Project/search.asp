<%@ Language="JavaScript" %>
<html lang="en">
<body>

<%
var conn, rs, sql, search;

search = String(Request.QueryString("search"));

conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" + Server.MapPath("ise2001.mdb"));

sql = "SELECT Product_name FROM Products WHERE " +
      "ProductName LIKE '%" + search + "%'";
rs = conn.Execute(sql);
return rs(Product_Name);
rs.Close();
conn.Close();
%>
</body>
</html>