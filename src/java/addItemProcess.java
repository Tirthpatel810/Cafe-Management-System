/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class addItemProcess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String cat = request.getParameter("categoryName");
        String name = request.getParameter("itemName");
        String price = request.getParameter("itemPrice");
        String qty = request.getParameter("itemQuantity");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Tirth");
            Statement stmt = con.createStatement();
            String query1="Select max(item_id) maxnum from items";
            ResultSet rs=stmt.executeQuery(query1);
            int id = 0;
            while(rs.next())
            {
                id=rs.getInt("maxnum");
            }
            id = id+1;
            String query2 = "insert into items values(" + id + ",'" + cat + "','" + name + "'," + price + "," + qty + ")";
            stmt.executeUpdate(query2);
            con.close();
            response.sendRedirect("adminpage.jsp");
        } catch (Exception e) {
            out.print(e);
        }
    }
}
