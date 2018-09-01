<%--
  Created by IntelliJ IDEA.
  User: steve
  Date: 5/25/2018
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
  String id = request.getParameter("userId");
  String driverName = "org.postgresql.Driver";
  String connectionUrl = "jdbc:postgresql://localhost:5432/";
  String dbName = "records";
  String userId = "postgres";
  String password = "root";

  try {
    Class.forName(driverName);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Connection connection = null;
  Statement statement = null;
  ResultSet resultSet = null;
%>




<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Actor DB Get</title>

  <link rel="stylesheet" type="text/css" href="custom.css">

</head>
<body>


<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
  <tr>

  </tr>
  <tr>

    <td><b>First Name</b></td>
    <td><b>Last Name</b></td>
  </tr>
  <%
    try{
      connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
      statement=connection.createStatement();
      String sql ="SELECT * FROM testtableone";

      resultSet = statement.executeQuery(sql);
      while(resultSet.next()){
  %>
  <tr>


    <td><%=resultSet.getString("first_name") %></td>
    <td><%=resultSet.getString("last_name") %></td>

  </tr>

  <%
      }
      connection.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  %>
</table>

</body>
</html>
