/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author johnc
 */
public class Distribucion implements Serializable {
    
    private String ID;
    private int producto;//aumentará
    private int empaquetado;
    private int precio;
    private int tipoventa;
    private int cliente;//aumentará
    private int cantidad;
    private int cancelacion;
    private String fecharegistro;
    private String fechacancelacion;

    public Distribucion() {
    }

    public Distribucion(String ID, int producto, int empaquetado, int precio, int tipoventa, int cliente, int cantidad, int cancelacion, String fecharegistro, String fechacancelacion) {
        this.ID = ID;
        this.producto = producto;
        this.empaquetado = empaquetado;
        this.precio = precio;
        this.tipoventa = tipoventa;
        this.cliente = cliente;
        this.cantidad = cantidad;
        this.cancelacion = cancelacion;
        this.fecharegistro = fecharegistro;
        this.fechacancelacion = fechacancelacion;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public int getEmpaquetado() {
        return empaquetado;
    }

    public void setEmpaquetado(int empaquetado) {
        this.empaquetado = empaquetado;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getTipoventa() {
        return tipoventa;
    }

    public void setTipoventa(int tipoventa) {
        this.tipoventa = tipoventa;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCancelacion() {
        return cancelacion;
    }

    public void setCancelacion(int cancelacion) {
        this.cancelacion = cancelacion;
    }

    public String getFecharegistro() {
        return fecharegistro;
    }

    public void setFecharegistro(String fecharegistro) {
        this.fecharegistro = fecharegistro;
    }

    public String getFechacancelacion() {
        return fechacancelacion;
    }

    public void setFechacancelacion(String fechacancelacion) {
        this.fechacancelacion = fechacancelacion;
    }

    @Override
    public String toString() {
        return "Distribucion{" + "ID=" + ID + ", producto=" + producto + ", empaquetado=" + empaquetado + ", precio=" + precio + ", tipoventa=" + tipoventa + ", cliente=" + cliente + ", cantidad=" + cantidad + ", cancelacion=" + cancelacion + ", fecharegistro=" + fecharegistro + ", fechacancelacion=" + fechacancelacion + '}';
    }
    
}
