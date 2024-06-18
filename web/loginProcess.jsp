<%-- 
    Document   : loginProcess
    Created on : 06-Dec-2023, 3:34:56 PM
    Author     : RUSHABH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Process</title>
</head>

<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Connect to the database
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Tirth");

        // Check the user's credentials
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            response.sendRedirect("homePage.jsp");
        }
        else if (username.equals("admin") && password.equals("admin"))
        {
            response.sendRedirect("adminpage.jsp");
        }
        else {
            response.sendRedirect("registration.jsp");
        }
        
        statement.close();
        connection.close();
    %>
</body>
</html>

