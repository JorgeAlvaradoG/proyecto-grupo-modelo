/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CRUDCliente;
import modelo.CRUDDistribucion;
import modelo.CRUDProducto;
import modelo.CRUDUsuario;
import modelo.Cliente;
import modelo.Distribucion;
import modelo.Producto;
import modelo.Reportes;
import modelo.Usuario;

/**
 *
 * @author johnc
 */
public class Controlador extends HttpServlet {

    Reportes rep;
    CRUDCliente crudc;
    CRUDUsuario crudu;
    CRUDProducto crudp;
    CRUDDistribucion crudd;
    List<Cliente> list;
    List<Usuario> listu;
    List<Producto> listp;
    List<Distribucion> listd;
    ArrayList<String> listdnp;
    ArrayList<String> listdnc;
    Cliente cli;
    Usuario usu;
    Producto pro;
    Distribucion dis;
    String name, apellidop, apellidom, telefono, correo,
           direccion, tipo, idm, nick, contra, pregunta, respuesta,
           marc, tproducto, envasado, presentacion, tonalidad,
           desc,producto, empaquetado, precio, tipoventa, cliente, cantidad;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String accion = request.getParameter("accion");

        switch (accion) {

            case "MenuPrincipal":
                request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
                break;

            case "General":
                request.getRequestDispatcher("General.jsp").forward(request, response);
                break;

            case "Cliente":

                crudc = new CRUDCliente();
                list = crudc.listar();
                request.getSession().setAttribute("Listar", list);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;

            case "BuscarC":

                String nombre = request.getParameter("nombre");

                crudc = new CRUDCliente();
                list = crudc.Buscar(nombre);
                request.getSession().setAttribute("Listar", list);
                request.getSession().setAttribute("cb", "fila");
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;

            case "AgregarC":

                name = request.getParameter("name");
                telefono = request.getParameter("telefono");
                correo = request.getParameter("correo");
                direccion = request.getParameter("direccion");
                tipo = request.getParameter("tipo");

                crudc = new CRUDCliente();
                cli = new Cliente();

                cli.setNombre(name);
                cli.setTelefono(telefono);
                cli.setCorreo(correo);
                cli.setDireccion(direccion);
                cli.setTipocliente(Integer.parseInt(tipo));

                if (crudc.Agregar(cli)) {
                    request.getSession().setAttribute("ca", "true");//para que SI muestre que agrego un cliente
                } else {
                    request.getSession().setAttribute("ca", "false");//para que SI muestre que no agrego un cliente
                }

                list = crudc.listar();
                request.getSession().setAttribute("Listar", list);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;

            case "EditarC":

                idm = request.getParameter("idm");
                name = request.getParameter("name");
                telefono = request.getParameter("telefono");
                correo = request.getParameter("correo");
                direccion = request.getParameter("direccion");
                tipo = request.getParameter("tipo");
                System.out.println("EditarC: " + idm + "," + name + "," + telefono + "," + correo + "," + direccion + "," + tipo);
                crudc = new CRUDCliente();
                cli = new Cliente();

                cli.setID(idm);
                cli.setNombre(name);
                cli.setTelefono(telefono);
                cli.setCorreo(correo);
                cli.setDireccion(direccion);
                cli.setTipocliente(Integer.parseInt(tipo));

                if (crudc.Modificar(cli)) {
                    request.getSession().setAttribute("cm", "true");//para que SI muestre que agrego un cliente
                } else {
                    request.getSession().setAttribute("cm", "false");//para que SI muestre que no agrego un cliente
                }

                list = crudc.listar();
                request.getSession().setAttribute("Listar", list);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;

            case "EliminarC":

                idm = request.getParameter("idm");
                System.out.println("idm: " + idm);

                crudc = new CRUDCliente();
                cli = new Cliente();
                cli.setID(idm);

                if (crudc.Desactivar(cli)) {
                    request.getSession().setAttribute("ce", "true");//para que SI muestre que elimino un cliente
                } else {
                    request.getSession().setAttribute("ce", "false");//para que SI muestre que no elimino un cliente
                }

                list = crudc.listar();
                request.getSession().setAttribute("Listar", list);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;

            case "Usuario":

                crudu = new CRUDUsuario();
                listu = crudu.listar();
                request.getSession().setAttribute("Listaru", listu);
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;

            case "BuscarU":

                String nombre1 = request.getParameter("nombre");

                crudu = new CRUDUsuario();
                listu = crudu.Buscar(nombre1);
                request.getSession().setAttribute("Listaru", listu);
                request.getSession().setAttribute("cb", "fila");
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;
            case "AgregarU":

                name = request.getParameter("name");
                apellidop = request.getParameter("apeP");
                apellidom = request.getParameter("apeM");
                nick = request.getParameter("nick");
                telefono = request.getParameter("telefono");
                correo = request.getParameter("correo");
                contra = request.getParameter("contra");
                pregunta = request.getParameter("pregunta");
                respuesta = request.getParameter("respuesta");
                tipo = request.getParameter("tipo");

                crudu = new CRUDUsuario();
                usu = new Usuario();

                usu.setNombre(name);
                usu.setApellidoP(apellidop);
                usu.setApellidoM(apellidom);
                usu.setNickname(nick);
                usu.setTelefono(telefono);
                usu.setCorreo(correo);
                usu.setContraseña(contra);
                usu.setPregunta(Integer.parseInt(pregunta));
                usu.setRespuesta(respuesta);
                usu.setRol(Integer.parseInt(tipo));

                if (crudu.Agregar(usu)) {
                    request.getSession().setAttribute("ca", "true");//para que SI muestre que agrego un usuario
                } else {
                    request.getSession().setAttribute("ca", "false");//para que SI muestre que no agrego un usuario
                }

                listu = crudu.listar();
                request.getSession().setAttribute("Listaru", listu);
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;

            case "EditarU":

                idm = request.getParameter("idm");
                name = request.getParameter("name");
                apellidop = request.getParameter("apeP");
                apellidom = request.getParameter("apeM");
                telefono = request.getParameter("telefono");
                correo = request.getParameter("correo");
                tipo = request.getParameter("tipo");

                crudu = new CRUDUsuario();
                usu = new Usuario();

                usu.setID(idm);
                usu.setNombre(name);
                usu.setApellidoP(apellidop);
                usu.setApellidoM(apellidom);
                usu.setTelefono(telefono);
                usu.setCorreo(correo);
                usu.setRol(Integer.parseInt(tipo));

                if (crudu.Modificar(usu)) {
                    request.getSession().setAttribute("cm", "true");//para que SI muestre que agrego un cliente
                } else {
                    request.getSession().setAttribute("cm", "false");//para que SI muestre que no agrego un cliente
                }

                listu = crudu.listar();
                request.getSession().setAttribute("Listaru", listu);
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;

            case "EliminarU":

                idm = request.getParameter("idm");
                System.out.println("idm: " + idm);

                crudu = new CRUDUsuario();
                usu = new Usuario();
                usu.setID(idm);

                if (crudu.Desactivar(usu)) {
                    request.getSession().setAttribute("ce", "true");//para que SI muestre que elimino un usuario
                } else {
                    request.getSession().setAttribute("ce", "false");//para que SI muestre que no elimino un usuario
                }

                listu = crudu.listar();
                request.getSession().setAttribute("Listaru", listu);
                request.getRequestDispatcher("Usuario.jsp").forward(request, response);
                break;

            case "Producto":

                crudp = new CRUDProducto();
                listp = crudp.listar();
                request.getSession().setAttribute("Listarp", listp);
                request.getRequestDispatcher("Productos.jsp").forward(request, response);
                break;

            case "BuscarP":
                
                String id = request.getParameter("id");

                crudp = new CRUDProducto();
                listp = crudp.Buscar(id);
                request.getSession().setAttribute("Listarp", listp);
                request.getSession().setAttribute("cb", "fila");
                request.getRequestDispatcher("Productos.jsp").forward(request, response);
                break;
            case "AgregarP":
                
                desc = request.getParameter("descripcion");
                marc = request.getParameter("marca");
                tproducto = request.getParameter("tipoproducto");
                envasado = request.getParameter("envasado");
                presentacion = request.getParameter("presentacion");
                tonalidad = request.getParameter("tonalidad");

                crudp = new CRUDProducto();
                pro = new Producto();

                pro.setDescripcion(desc);
                pro.setMarca(Integer.parseInt(marc));
                pro.setTipoproducto(Integer.parseInt(tproducto));
                pro.setEnvasado(Integer.parseInt(envasado));
                pro.setPresentacion(Integer.parseInt(presentacion));
                pro.setTonalidad(Integer.parseInt(tonalidad));

                if (crudp.Agregar(pro)) {
                    request.getSession().setAttribute("ca", "true");//para que SI muestre que agrego un producto
                } else {
                    request.getSession().setAttribute("ca", "false");//para que SI muestre que no agrego un producto
                }
                
                listp = crudp.listar();
                request.getSession().setAttribute("Listarp", listp);
                request.getRequestDispatcher("Productos.jsp").forward(request, response);
                break;
            case "EditarP":
                
                idm = request.getParameter("idm");
                desc = request.getParameter("descripcion");
                marc = request.getParameter("marca");
                tproducto = request.getParameter("tipoproducto");
                envasado = request.getParameter("envasado");
                presentacion = request.getParameter("presentacion");
                tonalidad = request.getParameter("tonalidad");

                crudp = new CRUDProducto();
                pro = new Producto();

                pro.setID(idm);
                pro.setDescripcion(desc);
                pro.setMarca(Integer.parseInt(marc));
                pro.setTipoproducto(Integer.parseInt(tproducto));
                pro.setEnvasado(Integer.parseInt(envasado));
                pro.setPresentacion(Integer.parseInt(presentacion));
                pro.setTonalidad(Integer.parseInt(tonalidad));

                if (crudp.Modificar(pro)) {
                    request.getSession().setAttribute("cm", "true");//para que SI muestre que agrego un producto
                } else {
                    request.getSession().setAttribute("cm", "false");//para que SI muestre que no agrego un producto
                }
                
                listp = crudp.listar();
                request.getSession().setAttribute("Listarp", listp);
                request.getRequestDispatcher("Productos.jsp").forward(request, response);
                break;
            case "EliminarP":
                
                idm = request.getParameter("idm");
                System.out.println("idm: " + idm);

                crudp = new CRUDProducto();
                pro = new Producto();
                pro.setID(idm);

                if (crudp.Desactivar(pro)) {
                    request.getSession().setAttribute("ce", "true");//para que SI muestre que elimino un Producto
                } else {
                    request.getSession().setAttribute("ce", "false");//para que SI muestre que no elimino un Producto
                }

                listp = crudp.listar();
                request.getSession().setAttribute("Listarp", listp);
                request.getRequestDispatcher("Productos.jsp").forward(request, response);
                break;
            case "Distribucion":
                
                crudd= new CRUDDistribucion();
                listd = crudd.listar();
                listdnp = crudd.listarnombreproducto();
                listdnc = crudd.listarnombrecliente();
                request.getSession().setAttribute("Listard", listd);
                request.getSession().setAttribute("Listardnp", listdnp);
                request.getSession().setAttribute("Listardnc", listdnc);
                request.getRequestDispatcher("Distribuciones.jsp").forward(request, response);
                break;
            case "BuscarD":
                
                String id1 = request.getParameter("id");

                crudd = new CRUDDistribucion();
                listd = crudd.Buscar(id1);
                listdnp = crudd.listarnombreproducto();
                listdnc = crudd.listarnombreproducto();
                request.getSession().setAttribute("Listard", listd);
                request.getSession().setAttribute("Listardnp", listdnp);
                request.getSession().setAttribute("Listardnc", listdnc);
                request.getSession().setAttribute("cb", "fila");
                request.getRequestDispatcher("Distribuciones.jsp").forward(request, response);
                break;
            case "AgregarD":
                
                producto = request.getParameter("producto");
                empaquetado = request.getParameter("empaquetado");
                precio = request.getParameter("precio");
                tipoventa = request.getParameter("tipoventa");
                cliente = request.getParameter("cliente");
                cantidad = request.getParameter("cantidad");
                
                crudd = new CRUDDistribucion();
                dis = new Distribucion();

                dis.setProducto(Integer.parseInt(producto));
                dis.setEmpaquetado(Integer.parseInt(empaquetado));
                dis.setPrecio(Integer.parseInt(precio));
                dis.setTipoventa(Integer.parseInt(tipoventa));
                dis.setCliente(Integer.parseInt(cliente));
                dis.setCantidad(Integer.parseInt(cantidad));

                if (crudd.Agregar(dis)) {
                    request.getSession().setAttribute("ca", "true");//para que SI muestre que agrego un producto
                } else {
                    request.getSession().setAttribute("ca", "false");//para que SI muestre que no agrego un producto
                }
                
                listd = crudd.listar();
                listdnp = crudd.listarnombreproducto();
                listdnc = crudd.listarnombreproducto();
                request.getSession().setAttribute("Listard", listd);
                request.getSession().setAttribute("Listardnp", listdnp);
                request.getSession().setAttribute("Listardnc", listdnc);
                request.getRequestDispatcher("Distribuciones.jsp").forward(request, response);
                break;
            case "EditarD":
                
                idm = request.getParameter("idm");
                producto = request.getParameter("producto");
                empaquetado = request.getParameter("empaquetado");
                precio = request.getParameter("precio");
                tipoventa = request.getParameter("tipoventa");
                cliente = request.getParameter("cliente");
                cantidad = request.getParameter("cantidad");
System.out.println("producto en controlador seleccionado: "+producto);
                crudd = new CRUDDistribucion();
                dis = new Distribucion();

                dis.setID(idm);
                dis.setProducto(Integer.parseInt(producto));
                dis.setEmpaquetado(Integer.parseInt(empaquetado));
                dis.setPrecio(Integer.parseInt(precio));
                dis.setTipoventa(Integer.parseInt(tipoventa));
                dis.setCliente(Integer.parseInt(cliente));
                dis.setCantidad(Integer.parseInt(cantidad));
                
                if (crudd.Modificar(dis)) {
                    request.getSession().setAttribute("cm", "true");//para que SI muestre que agrego un producto
                } else {
                    request.getSession().setAttribute("cm", "false");//para que SI muestre que no agrego un producto
                }
                
                listd = crudd.listar();
                listdnp = crudd.listarnombreproducto();
                listdnc = crudd.listarnombreproducto();
                request.getSession().setAttribute("Listard", listd);
                request.getSession().setAttribute("Listardnp", listdnp);
                request.getSession().setAttribute("Listardnc", listdnc);
                request.getRequestDispatcher("Distribuciones.jsp").forward(request, response);
                break;
            case "EliminarD":
                
                idm = request.getParameter("idm");
                System.out.println("idm: " + idm);

                crudd = new CRUDDistribucion();
                dis = new Distribucion();
                dis.setID(idm);

                if (crudd.Desactivar(dis)) {
                    request.getSession().setAttribute("ce", "true");//para que SI muestre que elimino un Producto
                } else {
                    request.getSession().setAttribute("ce", "false");//para que SI muestre que no elimino un Producto
                }

                listd = crudd.listar();
                listdnp = crudd.listarnombreproducto();
                listdnc = crudd.listarnombrecliente();
                request.getSession().setAttribute("Listard", listd);
                request.getSession().setAttribute("Listardnp", listdnp);
                request.getSession().setAttribute("Listardnc", listdnc);
                request.getRequestDispatcher("Distribuciones.jsp").forward(request, response);
                break;
            case "Reportes":

                request.getRequestDispatcher("Reportes.jsp").forward(request, response);
                break;
            case "PDF":

                rep = new Reportes();

                if (rep.crearPdf()) {
                    request.getSession().setAttribute("re", "true");//para que SI muestre que creo el pdf un cliente
                } else {
                    request.getSession().setAttribute("re", "false");//para que SI muestre que no creo el pdf un cliente
                }

                request.getRequestDispatcher("Reportes.jsp").forward(request, response);
                break;
            case "Grafica":

                rep = new Reportes();

                if (rep.crearGrafica()) {
                    request.getSession().setAttribute("rg", "true");//para que SI muestre que creo la grafica del cliente
                } else {
                    request.getSession().setAttribute("rg", "false");//para que SI muestre que no creo la grafica del cliente
                }

                request.getRequestDispatcher("Reportes.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
