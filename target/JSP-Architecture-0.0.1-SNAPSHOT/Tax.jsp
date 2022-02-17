<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,java.lang.*,javax.servlet.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tax Details</title>
</head>
<body>
<%
String i=request.getParameter("id");
int id=Integer.parseInt(i);
String name=request.getParameter("name");
String address=request.getParameter("address");
String ic=request.getParameter("income");
int income=Integer.parseInt(ic);
int tax;

if(income <= 180000)
{
	tax=0;
}
else if(income > 180000 && income <= 500000)
{
	tax=income*10/100;
}
else if(income > 500000 && income <= 800000) 
{
	tax=32000+(income*20/100);
}
else
{
	tax=92000+(income*30/100);
}
session.setAttribute("idValue",id);
session.setAttribute("nameValue",name);
session.setAttribute("addressValue",address);
session.setAttribute("incomeValue",income);
session.setAttribute("taxValue",tax);

try
{
	

	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/tax_db","root","Nagaraj@26"); 
 
 PreparedStatement s=con.prepareStatement("insert into citizen values(?,?,?,?,?)");
 
 s.setInt(1,id);
 s.setString(2,name);
 s.setString(3,address);
 s.setInt(4,income);
 s.setInt(5,tax);
 
int r = s.executeUpdate();

 if(r!=0)
 {
	
		 System.out.print("record updated");
		 if(tax != 0)
		 {
		 response.sendRedirect("Paytax.jsp");
		 }
		 else
		 {
		 response.sendRedirect("noTax.jsp");
		 }
		
 }
 else
 {
	 System.out.print("Error ocuured");
 }

}

catch(Exception e)
{
	System.out.print(e);
}


%>

</body>
</html>