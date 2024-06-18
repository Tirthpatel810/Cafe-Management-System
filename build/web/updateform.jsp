<%-- 
    Document   : updateform
    Created on : 06-Dec-2023, 6:35:26 PM
    Author     : RUSHABH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Data</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 320px;
            margin: auto;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        select,
        input {
            width: calc(100% - 12px);
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
            width: calc(100% - 12px);
            box-sizing: border-box;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("itemId"));
            String cat = request.getParameter("cat");
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));
        %>
        <h2>Update Item</h2>

            <form action="updateitem" method="post">
                <table>
                <tr><td><label for="categoryName">Category Name:</label></td>
                <td><select id="categoryName" name="categoryName" required>
                    <option value="">Select Category</option>
                    <option value="food">Food</option>
                    <option value="cold drink">Cold Drink</option>
                    <option value="coffee">Coffee</option>
                    <option value="ice_cream">Ice Cream</option>
                </select></td></tr>
                <input type="hidden" name="itemId" value="<%=id%>">
                <tr><td><label for="itemName">Item Name:</label></td>
                    <td><input type="text" id="itemName" name="itemName" placeholder="item name" value=<%=name%> required></td></tr>

                <tr><td><label for="itemPrice">Item Price:</label></td>
                    <td><input type="number" id="itemPrice" name="itemPrice" placeholder="item price" value=<%=price%> required></td></tr>

                <tr><td><label for="itemQuantity">Item Quantity:</label></td>
                    <td><input type="number" id="itemQuantity" name="itemQuantity" placeholder="quantity" value=<%=qty%> required></td></tr>
                </table>
                <button type="submit">Update</button>
            </form>
    </body>
</html>