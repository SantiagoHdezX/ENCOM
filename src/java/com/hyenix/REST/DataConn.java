/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hyenix.REST;

/**
 *
 * @author Alumnos
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataConn {

    public static Connection connect() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/";
        String db = "ENCOM";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "n0m3l0";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url + db, user, pass);
            if (con == null) {
                return null;
            }
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }

    }
}
