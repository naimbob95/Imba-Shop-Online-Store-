/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author VenoMon
 */
public class DBConnectionUtil {

    private static Connection conn = null;

    public static Connection getConnection() {
        if (conn != null) {
            return conn;
        } else {
            try {

                String driver = "com.mysql.jdbc.Driver";
                String connectURL = "jdbc:mysql://localhost:3306/imbashop";
                String username = "root";
                String password = "";
                Class.forName(driver);
                conn = DriverManager.getConnection(connectURL, username, password);
            } catch (ClassNotFoundException cnfe) {
                System.out.println(cnfe);
            } catch (SQLException sqe) {
                System.out.println(sqe);
            }
            return conn;
        }
    }

}
