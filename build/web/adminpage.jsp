<%-- 
    Document   : adminpage
    Created on : 06-Dec-2023, 4:49:47 PM
    Author     : RUSHABH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;     
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .add-item-form, .items-table {
            margin-bottom: 20px;
        }

        form, table {
            width: 100%;
        }

        label { 
            margin-bottom: 5px;
            color: #333;           
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .logout-button {
            text-align: center;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        a:hover {
            color: #4CAF50;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Cafe Management System</h1>

        <div class="add-item-form">
            <h2>Add Item</h2>

            <form action="addItemProcess" method="post">
                <table>
                <tr><td><label for="categoryName">Category Name:</label></td>
                <td><select id="categoryName" name="categoryName" required>
                    <option value="">Select Category</option>
                    <option value="food">Food</option>
                    <option value="cold drink">Cold Drink</option>
                    <option value="coffee">Coffee</option>
                    <option value="ice_cream">Ice Cream</option>
                </select></td></tr>

                <tr><td><label for="itemName">Item Name:</label></td>
                    <td><input type="text" id="itemName" name="itemName" placeholder="item name" required></td></tr>

                <tr><td><label for="itemPrice">Item Price:</label></td>
                    <td><input type="number" id="itemPrice" name="itemPrice" placeholder="item price" required></td></tr>

                <tr><td><label for="itemQuantity">Item Quantity:</label></td>
                    <td><input type="number" id="itemQuantity" name="itemQuantity" placeholder="quantity" required></td></tr>
                </table>
                <button type="submit">Add Item</button>
            </form>
        </div>

        <div class="items-table">
            <h2>Items</h2>

            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Category Name</th>
                        <th>Item Name</th>
                        <th>Item Price</th>
                        <th>Item Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        // Connect to the Oracle database
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Tirth");

                        // Fetch all items from the database
                        PreparedStatement statement = connection.prepareStatement("SELECT * FROM items");
                        ResultSet resultSet = statement.executeQuery();
                        int num=1;
                        while (resultSet.next()) {
                            int itemId = resultSet.getInt("item_id");
                            String categoryName = resultSet.getString("category_name");
                            String itemName = resultSet.getString("item_name");
                            double itemPrice = resultSet.getDouble("item_price");
                            int itemQuantity = resultSet.getInt("item_quantity");
                            
                            out.println("<tr>");
                            out.println("<td>" + num + "</td>");
                            out.println("<td>" + categoryName + "</td>");
                            out.println("<td>" + itemName + "</td>");
                            out.println("<td>" + itemPrice + "</td>");
                            out.println("<td>" + itemQuantity + "</td>");
                            out.println("<td>");
                            out.println("<a href='updateform.jsp?itemId="+ itemId +"&cat="+ categoryName +"&name="+ itemName +"&price="+ itemPrice +"&qty="+ itemQuantity +"'>Update</a> | ");
                            out.println("<a href='deleteitem?itemId=" + itemId + "' onclick=\"return confirm('Are you sure you want to delete?');\">Delete</a>");
                            out.println("</td>");
                            out.println("</tr>");
                            num = num + 1;
                        }

                        statement.close();
                        connection.close();
                    %>

                </tbody>
            </table>
        </div>

        <div class="logout-button">
            <a href="login.jsp">Logout</a>
        </div>
    </div>

</body>
</html>

