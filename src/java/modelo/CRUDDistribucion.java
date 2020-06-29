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
public class CRUDDistribucion {

    PreparedStatement ps = null;
    ResultSet rs;

    public boolean Agregar(Distribucion dis) {

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
            ps = conn.prepareStatement("INSERT INTO Distribucion (Producto, Empaquetado, Precio, TipoVenta, Cliente, Cantidad, FecharRegistro)"
                    + " VALUES (?,?,?,?,?,?,?)");

            ps.setInt(1, dis.getProducto());
            ps.setInt(2, dis.getEmpaquetado());
            ps.setInt(3, dis.getPrecio());
            ps.setInt(4, dis.getTipoventa());
            ps.setInt(5, dis.getCliente());
            ps.setInt(6, dis.getCantidad());
            ps.setString(7, now);

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

        ArrayList<Distribucion> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Distribucion WHERE Cancelacion = 2");

            rs = ps.executeQuery();

            while (rs.next()) {

                Distribucion di = new Distribucion();
                di.setID(rs.getString("ID"));
                di.setProducto(rs.getInt("Producto"));
                di.setEmpaquetado(rs.getInt("Empaquetado"));
                di.setPrecio(rs.getInt("Precio"));
                di.setTipoventa(rs.getInt("TipoVenta"));
                di.setCliente(rs.getInt("Cliente"));
                di.setCantidad(rs.getInt("Cantidad"));
                di.setCancelacion(rs.getInt("Cancelacion"));
                di.setFecharegistro(rs.getString("FecharRegistro"));
                di.setFechacancelacion(rs.getString("FecharCancelacion"));
                list.add(di);
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

    public List Buscar(String id) {

        ArrayList<Distribucion> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            int n = Integer.parseInt(id);

            ps = conn.prepareStatement("SELECT * FROM Distribucion WHERE ID = ? AND Cancelacion = 2");
            ps.setInt(1, n);

            rs = ps.executeQuery();

            while (rs.next()) {

                Distribucion di = new Distribucion();
                di.setID(rs.getString("ID"));
                di.setProducto(rs.getInt("Producto"));
                di.setEmpaquetado(rs.getInt("Empaquetado"));
                di.setPrecio(rs.getInt("Precio"));
                di.setTipoventa(rs.getInt("TipoVenta"));
                di.setCliente(rs.getInt("Cliente"));
                di.setCantidad(rs.getInt("Cantidad"));
                di.setCancelacion(rs.getInt("Cancelacion"));
                di.setFecharegistro(rs.getString("FecharRegistro"));
                di.setFechacancelacion(rs.getString("FecharCancelacion"));
                list.add(di);
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

    public boolean Modificar(Distribucion dis) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Distribucion SET Producto = ?, Empaquetado = ?, Precio = ?, TipoVenta = ?, Cliente = ?, Cantidad = ?"
                    + " WHERE ID = " + dis.getID());

            ps.setInt(1, dis.getProducto());
            ps.setInt(2, dis.getEmpaquetado());
            ps.setInt(3, dis.getPrecio());
            ps.setInt(4, dis.getTipoventa());
            ps.setInt(5, dis.getCliente());
            ps.setInt(6, dis.getCantidad());

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

    public boolean Desactivar(Distribucion dis) {

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
            ps = conn.prepareStatement("UPDATE Distribucion SET Cancelacion = ?, FecharCancelacion = ?"
                    + " WHERE ID = " + dis.getID());

            ps.setInt(1, 1);//lo ponemos como inactivo
            ps.setString(2, now);

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

    public ArrayList<Integer> listaridproducto() {

        ArrayList<Integer> list = new ArrayList<>();
        int r;
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT ID FROM Producto WHERE Disponibilidad = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                r = Integer.parseInt(rs.getString("ID"));
                list.add(r);
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

    public ArrayList<String> listarnombreproducto() {

        ArrayList<Integer> idcl;
        idcl = listaridproducto();
        ArrayList<String> list = new ArrayList<>();
        String r;
        int j = 0;
        for (int i = 0; i < idcl.size(); i++) {
            list.add(null);
        }
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT Descripcion FROM Producto WHERE Disponibilidad = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                r = rs.getString("Descripcion");
                list.add(idcl.get(j), r);
                System.out.println("Consulta Realizada correctamente");
                j++;

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

    public ArrayList<Integer> listaridcliente() {

        ArrayList<Integer> list = new ArrayList<>();
        int r;
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT ID FROM Cliente WHERE Estatus = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                r = Integer.parseInt(rs.getString("ID"));
                list.add(r);
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

    public ArrayList<String> listarnombrecliente() {

        ArrayList<Integer> idcl;
        idcl = listaridcliente();
        ArrayList<String> list = new ArrayList<>();
        String r;
        int j = 0;
        for (int i = 0; i < idcl.size(); i++) {
            list.add(null);
        }
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT Nombre FROM Cliente WHERE Estatus = 1");

            rs = ps.executeQuery();

            while (rs.next()) {
                r = rs.getString("Nombre");
                list.add(idcl.get(j), r);
                System.out.println("Consulta Realizada correctamente");
                j++;
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

}
