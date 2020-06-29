package modelo;

import java.io.Serializable;

/**
 *
 * @author johnc
 */
public class Usuario implements Serializable{
    
    private String ID;
    private String nombre;
    private String apellidoP;
    private String apellidoM;
    private String nickname;
    private String telefono;
    private String correo;
    private String contraseña;
    private int rol;
    private String antiguedad;
    private int estatus;
    private int pregunta;
    private String respuesta;

    public Usuario() {
    }

    public Usuario(String ID, String nombre, String apellidoP, String apellidoM, String nickname, String telefono, String correo, String contraseña, int rol, String antiguedad, int estatus, int pregunta, String respuesta) {
        this.ID = ID;
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.nickname = nickname;
        this.telefono = telefono;
        this.correo = correo;
        this.contraseña = contraseña;
        this.rol = rol;
        this.antiguedad = antiguedad;
        this.estatus = estatus;
        this.pregunta = pregunta;
        this.respuesta = respuesta;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(String antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

    public int getPregunta() {
        return pregunta;
    }

    public void setPregunta(int pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    @Override
    public String toString() {
        return "Usuario{" + "ID=" + ID + ", nombre=" + nombre + ", apellidoP=" + apellidoP + ", apellidoM=" + apellidoM + ", nickname=" + nickname + ", telefono=" + telefono + ", correo=" + correo + ", contrase\u00f1a=" + contraseña + ", rol=" + rol + ", antiguedad=" + antiguedad + ", estatus=" + estatus + ", pregunta=" + pregunta + ", respuesta=" + respuesta + '}';
    }
    
}
