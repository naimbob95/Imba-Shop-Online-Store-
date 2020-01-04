/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.PaidOrder;
import Utility.DBConnectionUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VenoMon
 */
public class PaidOrderDAO {

    private Connection conn;

    public PaidOrderDAO() {
        conn = DBConnectionUtil.getConnection();
    }

    public void insertPaidOrder(String pname, String quantity, String price, String status, String address, String user_email) {

        try {

            String sql = "INSERT INTO paid_orders (pname,quantity,price,status,address,user_email) values(?,?,?,?,?,?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pname);
            pstmt.setString(2, quantity);
            pstmt.setString(3, price);
            pstmt.setString(4, status);
            pstmt.setString(5, address);
            pstmt.setString(6, user_email);

            pstmt.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public List<PaidOrder> getAllPaidOrder() {
        List<PaidOrder> paidorderlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM paid_orders";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaidOrder o = new PaidOrder();
                o.setId(rs.getString("id"));
                o.setUser_email(rs.getString("user_email"));
                o.setPname(rs.getString("pname"));
                o.setQuantity(rs.getString("quantity"));
                o.setPrice(rs.getString("price"));
                o.setStatus(rs.getString("status"));
                o.setAddress(rs.getString("address"));

                paidorderlist.add(o);
            }
        } catch (SQLException e) {
        }
        return paidorderlist;
    }

    public void UpdateStatus(int id, String status) {
        try {

            String sql = "update paid_orders set status=? where id=?";
            PreparedStatement pstmt = conn
                    .prepareStatement(sql);

            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<PaidOrder> getAllPaidOrderByEmail(String user_email) {
        List<PaidOrder> paidorderlist = new ArrayList<>();
        try {

            String sql = "SELECT * FROM paid_orders where user_email='" + user_email + "';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PaidOrder o = new PaidOrder();
                o.setId(rs.getString("id"));
                o.setUser_email(rs.getString("user_email"));
                o.setPname(rs.getString("pname"));
                o.setQuantity(rs.getString("quantity"));
                o.setPrice(rs.getString("price"));
                o.setStatus(rs.getString("status"));

                paidorderlist.add(o);
            }
        } catch (SQLException e) {
        }
        return paidorderlist;
    }
}
