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
import java.util.List;

/**
 *
 * @author johnc
 */
public class CRUDProducto {

    PreparedStatement ps = null;
    ResultSet rs;

    public boolean Agregar(Producto pro) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("INSERT INTO Producto (Descripcion, Marca, TipoProducto, Envasado, Presentacion, Tonalidad)"
                    + " VALUES (?,?,?,?,?,?)");

            ps.setString(1, pro.getDescripcion().trim());
            ps.setInt(2, pro.getMarca());
            ps.setInt(3, pro.getTipoproducto());
            ps.setInt(4, pro.getEnvasado());
            ps.setInt(5, pro.getPresentacion());
            ps.setInt(6, pro.getTonalidad());

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

        ArrayList<Producto> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {

            ps = conn.prepareStatement("SELECT * FROM Producto WHERE Disponibilidad = 1");

            rs = ps.executeQuery();

            while (rs.next()) {

                Producto pr = new Producto();
                pr.setID(rs.getString("ID"));
                pr.setDescripcion(rs.getString("Descripcion"));
                pr.setMarca(rs.getInt("Marca"));
                pr.setTipoproducto(rs.getInt("TipoProducto"));
                pr.setEnvasado(rs.getInt("Envasado"));
                pr.setPresentacion(rs.getInt("Presentacion"));
                pr.setTonalidad(rs.getInt("Tonalidad"));
                pr.setDisponibilidad(rs.getInt("Disponibilidad"));
                list.add(pr);
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

        ArrayList<Producto> list = new ArrayList<>();
        Connection conn = Conexion.conectar();
        try {
            System.out.println("id_:" + numero(id));
            ps = conn.prepareStatement("SELECT * FROM Producto WHERE ID = ? AND Disponibilidad = 1");
            ps.setInt(1, numero(id));

            rs = ps.executeQuery();

            while (rs.next()) {

                Producto pr = new Producto();
                pr.setID(rs.getString("ID"));
                pr.setDescripcion(rs.getString("Descripcion"));
                pr.setMarca(rs.getInt("Marca"));
                pr.setTipoproducto(rs.getInt("TipoProducto"));
                pr.setEnvasado(rs.getInt("Envasado"));
                pr.setPresentacion(rs.getInt("Presentacion"));
                pr.setTonalidad(rs.getInt("Tonalidad"));
                pr.setDisponibilidad(rs.getInt("Disponibilidad"));
                list.add(pr);
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

    public boolean Modificar(Producto pro) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Producto SET Descripcion = ?,Marca = ?,TipoProducto = ?,Envasado = ?,Presentacion = ?,Tonalidad = ?"
                    + " WHERE ID = " + pro.getID());

            ps.setString(1, pro.getDescripcion().trim());
            ps.setInt(2, pro.getMarca());
            ps.setInt(3, pro.getTipoproducto());
            ps.setInt(4, pro.getEnvasado());
            ps.setInt(5, pro.getPresentacion());
            ps.setInt(6, pro.getTonalidad());

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

    public boolean Desactivar(Producto pro) {

        Connection conn = Conexion.conectar();
        try {
            ps = conn.prepareStatement("UPDATE Producto SET Disponibilidad = ?"
                    + " WHERE ID = " + pro.getID());

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

    public int numero(String id) {

        String n;
        n = id;
        int num;
        num = Integer.parseInt(n);
        System.out.println("ddd "+num);

        return num;
    }

}
