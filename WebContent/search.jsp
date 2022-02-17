<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.lang.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Record</title>
 <link rel="stylesheet" href="css/tax.css">
</head>
<body>
<%
String i=request.getParameter("id");
int Id=Integer.parseInt(i);

try
{
	

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://aws-db.coydvrnzy65u.ap-south-1.rds.amazonaws.com:3306/tax-db","admin","Monika2022"); 
	
	Statement c= con.createStatement();
	
	ResultSet rs = c.executeQuery("select * from citizen where id="+Id);

	if(rs.next())
	{
   
		int id =rs.getInt(1);
		String name=rs.getString(2);
		String address=rs.getString(3);
		int income =rs.getInt(4);
		int tax =rs.getInt(5);
%>
<table>
      <thead>
        <tr>
          <th>ID</th>
          <th>NAME</th>
          <th>ADDRESS</th>
          <th>INCOME</th>
          <th>TAX</th>
        </tr>
      <thead>
      <tbody>
        <tr>
          <td><%out.print(id); %></td>
          <td><%out.print(name); %></td>
          <td><%out.print(address); %></td>
          <td><%out.print(income); %></td>
          <td><%out.print(tax); %></td>
        </tr>
           
      </tbody>
    <table/>
    
           
 <%
	}
	else
	{
		%>
		<script type="text/javascript">
			alert("Record not found");
		</script>
		<% 
	}
}

catch(Exception e)
{
	System.out.print(e);
}

%>

</body>
</html>