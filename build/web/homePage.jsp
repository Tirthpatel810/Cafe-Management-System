<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Items List</title>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh;
            
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        
        .logout-button {
            text-align: center;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>

</head>
<body >

<h1>Items List</h1>

<table>
    <thead>
        <tr>
            <th>No.</th>
            <th>Category Name</th>
            <th>Item Name</th>
            <th>Item Price</th>
            <th>Item Quantity</th>
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
                out.println("</tr>");
                num = num + 1;
            }

            statement.close();
            connection.close();
        %>

    </tbody>
</table>
        <div class="logout-button">
            <a href="login.jsp">Logout</a>
        </div>

</body>
</html>
