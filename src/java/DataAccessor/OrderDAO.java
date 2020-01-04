/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.Order;
import Utility.DBConnectionUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acapd
 */
public class OrderDAO {
    
    private Connection conn;

    public OrderDAO() {
        conn = DBConnectionUtil.getConnection();
    }
    
    public void createOrder(String user_email,String pname, int quantity, double price, double total_price, String status){
        
        try{
            
            String sql = "INSERT INTO orders (user_email,pname,quantity,price,total_price,status) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_email);
            pstmt.setString(2, pname);
            pstmt.setInt(3, quantity);
            pstmt.setDouble(4, price);
            pstmt.setDouble(5, total_price);
            pstmt.setString(6, status);

            pstmt.executeUpdate();
        }
        catch(SQLException ex){
            
        }
    }
    
    public List<Order> getAllOrderByEmail(String user_email) {
        List<Order> orderlist = new ArrayList<>();
        try {
            
            String sql = "SELECT * FROM orders where user_email='"+user_email+"'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUser_email(rs.getString("user_email"));
                o.setPname(rs.getString("pname"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getDouble("price"));
                o.setTotal_price(rs.getDouble("total_price"));
                o.setStatus(rs.getString("status"));

                orderlist.add(o);
            }
        } 
        catch (SQLException e) {
        }
        return orderlist;
    }
    
    
    
    public Order getProductById(int id) {
        Order p = new Order();
        try {
            String sql = "SELECT * FROM orders where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setTotal_price(rs.getDouble("total_price"));
            }
        } catch (SQLException e) {

        }
        return p;
    }
    
     public void updateOrder(int id, String pname, int quantity, double price, double total_price) {
        try {

            String sql = "update orders set pname=?,quantity=?,price=?, total_price=? where id=?";
            PreparedStatement pstmt = conn
                    .prepareStatement(sql);

            pstmt.setString(1, pname);
            pstmt.setInt(2, quantity);
            pstmt.setDouble(3, price);
            pstmt.setDouble(4, total_price);
            pstmt.setInt(5, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteOrderItem(int id) {
        try {
            String sql = "DELETE FROM orders WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }
    
}
