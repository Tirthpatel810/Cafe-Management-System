<%-- 
    Document   : registerProcess
    Created on : 06-Dec-2023, 4:00:29 PM
    Author     : RUSHABH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Process</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    // Connect to the Oracle database
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Tirth");

    // Register the new user
    PreparedStatement statement = connection.prepareStatement("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
    statement.setString(1, username);
    statement.setString(2, password);
    statement.setString(3, email);
    int rowsAffected = statement.executeUpdate();

    if (rowsAffected == 1) {
        // User registered successfully, redirect to login page
        response.sendRedirect("login.jsp");
    } else {
        // User registration failed, display error message
        out.println("Error registering user.");
    }

    statement.close();
    connection.close();
%>

</body>
</html>

