<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.lang.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display</title>
 <link rel="stylesheet" href="css/display.css">
</head>
<body>
<table class="styled-table">
<thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>ADDRESS</th>
          <th>INCOME</th>
          <th>TAX</th>
        </tr>
      <thead>
      <tbody><% 
try
{
	

	Class.forName("com.mysql.jdbc.Driver");  
  Connection con=DriverManager.getConnection("jdbc:mysql://aws-db.coydvrnzy65u.ap-south-1.rds.amazonaws.com:3306/tax-db","admin","Monika2022"); 
	
	Statement c= con.createStatement();
	
	ResultSet rs = c.executeQuery("select * from citizen");

	while(rs.next())
	{
   
%>
        <tr>
          <td><%=rs.getInt("id") %></td>
          <td><%=rs.getString("name") %></td>
          <td><%=rs.getString("address") %></td>
          <td><%=rs.getInt("income") %></td>
          <td><%=rs.getInt("tax") %></td>
        </tr>
           
      </tbody>
   
    
           
 <%
	}
}

catch(Exception e)
{
	System.out.print(e);
}

%>
 <table/>
</body>
</html>