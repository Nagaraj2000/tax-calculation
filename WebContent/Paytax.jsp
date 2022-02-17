<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayTax</title>
 <link rel="stylesheet" href="css/tax.css">

  
</head>

<body>
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
          <td><%out.print(session.getAttribute("idValue")); %></td>
          <td><%out.print(session.getAttribute("nameValue")); %></td>
          <td><%out.print(session.getAttribute("addressValue")); %></td>
          <td><%out.print(session.getAttribute("incomeValue")); %></td>
          <td><%out.print(session.getAttribute("taxValue")); %></td>
        </tr>
           
      </tbody>
    <table/>
      
  
  
</body>
</html>