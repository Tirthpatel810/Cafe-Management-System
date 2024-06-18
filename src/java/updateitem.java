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


public class updateitem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        int id = Integer.parseInt(request.getParameter("itemId"));
        String cat = request.getParameter("categoryName");
        String name = request.getParameter("itemName");
        float price = Float.parseFloat(request.getParameter("itemPrice"));
        int qty = Integer.parseInt(request.getParameter("itemQuantity"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "Tirth");

            String query = "update items set category_name='"+ cat +"',item_name='"+ name +"',item_price="+ price +",item_quantity="+ qty +" where item_id="+ id +"";
            Statement stmt = con.createStatement();
            stmt.executeUpdate(query);

            con.close();
            response.sendRedirect("adminpage.jsp");
        } catch (Exception e) {
            out.print(e);
        }
    }

}
