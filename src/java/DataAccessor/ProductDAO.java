/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccessor;

import Model.Product;
import Utility.DBConnectionUtil;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
public class ProductDAO {

    private Connection conn;

    public ProductDAO() {
        conn = DBConnectionUtil.getConnection();
    }

    public void createProduct(String pname, int quantity, double price, Part photo) throws IOException {

        try {
            InputStream inputStream = null;
            if (photo != null) {
                // obtains input stream of the upload file
                inputStream = photo.getInputStream();
            }

            String sql = "INSERT INTO products (pname,quantity,price,photo) values(?,?,?,?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pname);
            pstmt.setInt(2, quantity);
            pstmt.setDouble(3, price);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pstmt.setBlob(4, inputStream);
            }
            pstmt.executeUpdate();

        } catch (SQLException ex) {
        }
    }

    public List<Product> getAllProduct() {
        List<Product> productlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM products";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                productlist.add(p);
            }
        } catch (SQLException e) {
        }
        return productlist;
    }

    public List<Product> getAllProductBy5() {
        List<Product> productlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM products LIMIT 5;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                productlist.add(p);
            }
        } catch (SQLException e) {
        }
        return productlist;
    }

    public Product getProductById(int id) {
        Product p = new Product();
        try {
            String sql = "SELECT * FROM products where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
            }
        } catch (SQLException e) {

        }
        return p;
    }

    public List<Product> getAllProductByPname(String pname) {
        List<Product> productlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM products where pname LIKE '%" + pname + "%';";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setPname(rs.getString("pname"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                productlist.add(p);
            }
        } catch (SQLException e) {
        }
        return productlist;
    }

    public void updateProduct(int id, String pname, int quantity, double price) {
        try {

            String sql = "update products set pname=?,quantity=?,price=? where id=?";
            PreparedStatement pstmt = conn
                    .prepareStatement(sql);

            pstmt.setString(1, pname);
            pstmt.setInt(2, quantity);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM products WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }

}
