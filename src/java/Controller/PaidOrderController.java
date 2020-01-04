package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DataAccessor.PaidOrderDAO;
import Model.PaidOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VenoMon
 */
@WebServlet(urlPatterns = {"/PaidOrderController"})
public class PaidOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String driver = "com.mysql.jdbc.Driver";
        String connectURL = "jdbc:mysql://localhost:3306/imbashop";
        String username = "root";
        String password = "";

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user_email");

        PaidOrder po;
        List<PaidOrder> listPaidOrder = new ArrayList<>();

        String[] pid = request.getParameterValues("id");
        String[] pname = request.getParameterValues("pname");
        String[] quantity = request.getParameterValues("quantity");
        String[] price = request.getParameterValues("price");
        String[] status = request.getParameterValues("status");
        String[] user_email = request.getParameterValues("user_email");

        String address = request.getParameter("address");
        for (int i = 0; i < pid.length; i++) {
            po = new PaidOrder();
            po.setId(pid[i]);
            po.setPname(pname[i]);
            po.setQuantity(quantity[i]);
            po.setPrice(price[i]);
            po.setStatus(status[i]);
            po.setUser_email(user_email[i]);

            listPaidOrder.add(po);
        }

        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(connectURL, username, password);
            String sql = "INSERT INTO paid_orders(pname,quantity,price,status,user_email,address) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            for (PaidOrder o : listPaidOrder) {
                ps.setString(1, o.getPname());
                ps.setString(2, o.getQuantity());
                ps.setString(3, o.getPrice());
                ps.setString(4, o.getStatus());
                ps.setString(5, o.getUser_email());
                ps.setString(6, address);
                ps.executeUpdate();
            }
            String sql2 = "DELETE FROM orders WHERE user_email='" + user + "' AND status='in process';";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.executeUpdate();
            conn.close();
            response.sendRedirect("thanks.jsp");
        } catch (Exception e) {
            System.out.println("OrderDAO error" + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
