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
    
    public static String url = "jdbc:mysql://localhost/grupomodelo?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static String usuario = "root";
    public static String contraseña = "sasa";
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
