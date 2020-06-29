/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import conexionbd.Conexion;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author johnc
 */
public class CRUDCliente {

    PreparedStatement ps = null;
    ResultSet rs;

    public boolean Agregar(Cliente cli) {

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
            ps = conn.prepareStatement("INSERT INTO Cliente (Nombre,Telefono,Correo,Direccion,TipoCliente,Antiguedad)"
                    + " VALUES (?,?,?,?,?,?)");

            ps.setString(1, cli.getNombre().trim());
            ps.setString(2, cli.getTelefono().trim());
            ps.setString(3, cli.getCorreo().trim());
            ps.setString(4, cli.getDireccion().trim());
            ps.setInt(5, cli.getTipocliente());
            ps.setString(6, now);

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
    
    public List listar() {

        ArrayList<Cliente> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Cliente WHERE Estatus = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                Cliente cl = new Cliente();
                cl.setID(rs.getString("ID"));
                cl.setNombre(rs.getString("Nombre"));
                cl.setTelefono(rs.getString("Telefono"));
                cl.setCorreo(rs.getString("Correo"));
                cl.setDireccion(rs.getString("Direccion"));
                cl.setTipocliente(rs.getInt("TipoCliente"));
                cl.setAntiguedad(rs.getString("Antiguedad"));
                cl.setEstatus(rs.getInt("Estatus"));
                list.add(cl);
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

    public List Buscar(String nombre) {

        ArrayList<Cliente> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Cliente WHERE Nombre = ? AND Estatus = 1");
            ps.setString(1, nombre.trim());

            rs = ps.executeQuery();

            while (rs.next()) {

                Cliente cl = new Cliente();
                cl.setID(rs.getString("ID"));
                cl.setNombre(rs.getString("Nombre"));
                cl.setTelefono(rs.getString("Telefono"));
                cl.setCorreo(rs.getString("Correo"));
                cl.setDireccion(rs.getString("Direccion"));
                cl.setTipocliente(rs.getInt("TipoCliente"));
                cl.setAntiguedad(rs.getString("Antiguedad"));
                cl.setEstatus(rs.getInt("Estatus"));
                list.add(cl);
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
    
    public boolean Modificar(Cliente cli) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Cliente SET Nombre = ?,Telefono = ?,Correo = ?,Direccion = ?,TipoCliente = ?"
                    + " WHERE ID = " + cli.getID());

            ps.setString(1, cli.getNombre().trim());
            ps.setString(2, cli.getTelefono().trim());
            ps.setString(3, cli.getCorreo().trim());
            ps.setString(4, cli.getDireccion().trim());
            ps.setInt(5, cli.getTipocliente());

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
    
    public boolean Desactivar(Cliente cli) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Cliente SET Estatus = ?"
                    + " WHERE ID = " + cli.getID());

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
    
//    public boolean Eliminar(Cliente cli) {
//
//        Connection conn = Conexion.conectar();
//        try {
//            ps = conn.prepareStatement("DELETE FROM Cliente WHERE ID = " + cli.getID());
//
//            ps.execute();
//
//            return true;
//
//        } catch (HeadlessException | SQLException e) {
//
//            System.out.println("Error: " + e);
//            return false;
//
//        } finally {
//
//            try {
//                conn.close();
//            } catch (SQLException e) {
//                System.out.println("Error: " + e);
//            }
//
//        }
//
//    }

}
