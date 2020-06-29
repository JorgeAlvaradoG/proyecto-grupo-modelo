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
public class Producto implements Serializable{
    
    private String ID;
    private String descripcion;
    private int marca;
    private int tipoproducto;
    private int envasado;
    private int presentacion;
    private int tonalidad;
    private int disponibilidad;

    public Producto() {
    }

    public Producto(String ID, String descripcion, int marca, int tipoproducto, int envasado, int presentacion, int tonalidad, int disponibilidad) {
        this.ID = ID;
        this.descripcion = descripcion;
        this.marca = marca;
        this.tipoproducto = tipoproducto;
        this.envasado = envasado;
        this.presentacion = presentacion;
        this.tonalidad = tonalidad;
        this.disponibilidad = disponibilidad;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
 
    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }

    public int getTipoproducto() {
        return tipoproducto;
    }

    public void setTipoproducto(int tipoproducto) {
        this.tipoproducto = tipoproducto;
    }

    public int getEnvasado() {
        return envasado;
    }

    public void setEnvasado(int envasado) {
        this.envasado = envasado;
    }

    public int getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(int presentacion) {
        this.presentacion = presentacion;
    }

    public int getTonalidad() {
        return tonalidad;
    }

    public void setTonalidad(int tonalidad) {
        this.tonalidad = tonalidad;
    }

    public int getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(int disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    @Override
    public String toString() {
        return "Producto{" + "ID=" + ID + ", marca=" + marca + ", tipoproducto=" + tipoproducto + ", envasado=" + envasado + ", presentacion=" + presentacion + ", tonalidad=" + tonalidad + ", disponibilidad=" + disponibilidad + '}';
    }
    
}
