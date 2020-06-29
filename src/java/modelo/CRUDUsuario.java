/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import conexionbd.Conexion;
import encriptador.EncriptadorAES;
import java.awt.HeadlessException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author johnc
 */
public class CRUDUsuario {

    PreparedStatement ps = null;
    ResultSet rs;
    String encriptado;
    
    public boolean DarAcceso(Usuario us) {

        try {

            Connection conn = Conexion.conectar();

            String datoOriginal = us.getContraseña();

            System.out.println("aquuuiiiii!!: " + datoOriginal);

            if (datoOriginal == null) {

                System.out.println("No hay contraseña!!");

            } else {

                try {

                    final String claveEncriptacion = "America147";

                    EncriptadorAES encriptador = new EncriptadorAES();
                    encriptado = encriptador.encriptar(datoOriginal, claveEncriptacion);

                } catch (UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeyException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
                    Logger.getLogger(encriptador.EncriptadorAES.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            ps = conn.prepareStatement("SELECT * FROM Usuario WHERE Nickname = ? AND Contraseña = ?");

            ps.setString(1, us.getNickname());
            ps.setString(2, encriptado);

            rs = ps.executeQuery();
            int total = 0;

            while (rs.next()) {

                us.setID(rs.getString("ID"));
                us.setNombre(rs.getString("Nombre"));
                us.setCorreo(rs.getString("Correo"));
                us.setRol(rs.getInt("Rol"));
                total++;

            }

            return total != 0;

        } catch (SQLException e) {

            System.err.println("Error Metodo DarAcceso: " + e);
            return false;

        }

    }

    public void Bitacora(Usuario us) {

        Connection conn = Conexion.conectar();

        if (conn != null) {

            try {

                ps = conn.prepareStatement("CALL InsertBitcora(?)");
                ps.setString(1, us.getID());
                ps.execute();

            } catch (SQLException ex) {

                System.out.println(ex);

            }
        } else {

        }

    }
    
    public List listar() {

        ArrayList<Usuario> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Usuario WHERE Estatus = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                Usuario us1 = new Usuario();
                us1.setID(rs.getString("ID"));
                us1.setNombre(rs.getString("Nombre"));
                us1.setApellidoP(rs.getString("ApellidoP"));
                us1.setApellidoM(rs.getString("ApellidoM"));
                us1.setNickname(rs.getString("Nickname"));
                us1.setTelefono(rs.getString("Telefono"));
                us1.setCorreo(rs.getString("Correo"));
                us1.setContraseña(rs.getString("Contraseña"));
                us1.setRol(rs.getInt("Rol"));
                us1.setAntiguedad(rs.getString("Antiguedad"));
                us1.setEstatus(rs.getInt("Estatus"));
                us1.setPregunta(rs.getInt("Pregunta"));
                us1.setRespuesta(rs.getString("Respuesta"));
                
                list.add(us1);
                System.out.println("Consulta Realizada correctamente");
                
            }

        } catch (HeadlessException | SQLException e) {

            System.out.println("Error: " + e);

        } finally {

            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }

        }

        return list;

    }

    public boolean Agregar(Usuario usu) {

        Calendar fecha = new GregorianCalendar();

        int year = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        int hora = fecha.get(Calendar.HOUR_OF_DAY);
        int min = fecha.get(Calendar.MINUTE);
        int seg = fecha.get(Calendar.SECOND);

        String now = year + "-" + mes + "-" + dia + " " + hora + ":" + min + ":" + seg;
        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("INSERT INTO Usuario (Nombre, ApellidoP, ApellidoM, Nickname, Telefono, Correo, Contraseña, Rol, Antiguedad, Pregunta, Respuesta)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, usu.getNombre().trim());
            ps.setString(2, usu.getApellidoP().trim());
            ps.setString(3, usu.getApellidoM().trim());
            ps.setString(4, usu.getNickname().trim());
            ps.setString(5, usu.getTelefono().trim());
            ps.setString(6, usu.getCorreo().trim());
            ps.setString(7, usu.getContraseña().trim());
            ps.setInt(8, usu.getRol());
            ps.setString(9, now);
            ps.setInt(10, usu.getPregunta());
            ps.setString(11, usu.getRespuesta().trim());
            

            ps.execute();

            return true;

        } catch (HeadlessException | SQLException e) {

            System.out.println("Error: " + e);
            return false;

        } finally {

            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }

        }

    }
    
    public List Buscar(String nombre) {

        ArrayList<Usuario> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Usuario WHERE Nombre = ? AND Estatus = 1");
            ps.setString(1, nombre.trim());

            rs = ps.executeQuery();

            while (rs.next()) {

                Usuario u1 = new Usuario();
                u1.setID(rs.getString("ID"));
                u1.setNombre(rs.getString("Nombre"));
                u1.setApellidoP(rs.getString("ApellidoP"));
                u1.setApellidoM(rs.getString("ApellidoM"));
                u1.setNickname(rs.getString("Nickname"));
                u1.setTelefono(rs.getString("Telefono"));
                u1.setCorreo(rs.getString("Correo"));
                u1.setContraseña(rs.getString("Contraseña"));
                u1.setRol(rs.getInt("Rol"));
                u1.setAntiguedad(rs.getString("Antiguedad"));
                u1.setEstatus(rs.getInt("Estatus"));
                u1.setPregunta(rs.getInt("Pregunta"));
                u1.setRespuesta(rs.getString("Respuesta"));
                list.add(u1);
                System.out.println("Consulta Realizada correctamente");

            }

        } catch (HeadlessException | SQLException e) {

            System.out.println("Error: " + e);

        } finally {

            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }

        }

        return list;

    }
    
    public boolean Modificar(Usuario usu) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Usuario SET Nombre = ?,ApellidoP = ?,ApellidoM = ?,Telefono = ?,Correo = ?,Rol = ?"
                    + " WHERE ID = " + usu.getID());

            ps.setString(1, usu.getNombre().trim());
            ps.setString(2, usu.getApellidoP().trim());
            ps.setString(3, usu.getApellidoM().trim());
            ps.setString(4, usu.getTelefono().trim());
            ps.setString(5, usu.getCorreo().trim());
            ps.setInt(6, usu.getRol());

            ps.execute();

            return true;

        } catch (HeadlessException | SQLException e) {

            System.out.println("Error: " + e);
            return false;

        } finally {

            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }

        }

    }
    
    public boolean Desactivar(Usuario usu) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Usuario SET Estatus = ?"
                    + " WHERE ID = " + usu.getID());

            ps.setInt(1, 2);//lo ponemos como inactivo

            ps.execute();

            return true;

        } catch (HeadlessException | SQLException e) {

            System.out.println("Error: " + e);
            return false;

        } finally {

            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }

        }

    }
    
}
