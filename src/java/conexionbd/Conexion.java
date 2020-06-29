/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionbd;

import java.sql.*;

/**
 *
 * @author johnc
 */
public class Conexion {
    
    public static String url = "jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_5028194434a761c?reconnect=true&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static String usuario = "b97f7d2e231782";
    public static String contraseña = "eb847aff";
    public static String clase = "com.mysql.cj.jdbc.Driver";

    public static Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName(clase);
            conexion = (Connection) DriverManager.getConnection(url, usuario, contraseña);
            System.out.println("Conexión Establecida");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return conexion;
    }
    
}
