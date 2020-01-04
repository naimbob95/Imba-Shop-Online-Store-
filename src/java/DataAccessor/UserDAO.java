package DataAccessor;

import Model.User;
import Utility.DBConnectionUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author VenoMon
 */
public class UserDAO {

    private Connection conn;

    public UserDAO() {
        conn = DBConnectionUtil.getConnection();
    }

    public List<User> getAllUser() {
        List<User> userlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users WHERE type = 'user' ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setType(rs.getString("type"));
                u.setRegisteredDate(rs.getString("registeredDate"));
                userlist.add(u);
            }
        } catch (SQLException e) {
        }
        return userlist;
    }

    public List<User> getAllUserBy5() {
        List<User> userlist = new ArrayList<>();
        try {
            String sql = "SELECT * FROM users WHERE type = 'user'  LIMIT 5;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ;
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setType(rs.getString("type"));
                u.setRegisteredDate(rs.getString("registeredDate"));
                userlist.add(u);
            }
        } catch (SQLException e) {
        }
        return userlist;
    }

    public void insertUser(String name, String email, String password, String type, String registeredDate) {

        try {

            //step 4 : prepare a statement object
            String sql = "INSERT INTO USERS"
                    + "(name,email,password,type,registeredDate)"
                    + "values(?,?,?,?,?)";

            PreparedStatement pstmt = conn.prepareStatement(sql);

            //step 5 : execute the query
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, type);
            pstmt.setString(5, registeredDate);
            pstmt.executeUpdate();

            //last step : close connection
            System.out.println("connection close succesful");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        try {
            String sql = "DELETE FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public void updateUser(int id, String name, String password) {
        try {

            String sql = "update users set name=?,password=? where id=?";
            PreparedStatement pstmt = conn
                    .prepareStatement(sql);

            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserByEmail(String email) {
        User u = new User();
        try {
            String sql = "SELECT * FROM users where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setType(rs.getString("type"));

            }
        } catch (SQLException e) {

        }
        return u;
    }

    public String authenticateUser(User user) {

        //Keeping user entered values in temporary variables.
        String email = user.getEmail();
        String password = user.getPassword();

        String usr = "user";
        String adm = "admin";

        String emailDB = "";
        String passwordDB = "";
        String typeDB = "";

        try {

            String sql = "SELECT email,password,type FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) // Until next row is present otherwise it return false
            {
                emailDB = rs.getString("email"); //fetch the values present in database
                passwordDB = rs.getString("password");
                typeDB = rs.getString("type");

                if (emailDB.equals(email) && passwordDB.equals(password) && typeDB.equals(usr)) {
                    return "USER"; ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.
                } else if (emailDB.equals(email) && passwordDB.equals(password) && typeDB.equals(adm)) {
                    return "ADMIN";
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid user credentials"; // Just returning appropriate message otherwise
    }

}
