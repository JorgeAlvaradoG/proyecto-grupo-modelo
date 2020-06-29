/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CRUDUsuario;
import modelo.Usuario;

/**
 *
 * @author johnc
 */
public class Validacion extends HttpServlet {

    CRUDUsuario crud = new CRUDUsuario();
    Usuario us = new Usuario();

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

        if (accion.equalsIgnoreCase("Acceder")) {

            String nickname = request.getParameter("nickname");
            String password = request.getParameter("contraseña");

            us.setNickname(nickname);
            us.setContraseña(password);

            if (crud.DarAcceso(us)) {
                System.out.println("asd145654345");
                crud.Bitacora(us);
                request.getSession().setAttribute("validacion", null);
                request.getSession().setAttribute("Usuario", us);
                
                switch (us.getRol()) {
                    case 1:
                        request.getSession().setAttribute("rol", "Administrador");//para acceso tipo ADMINISTRADOR
                        break;
                    case 2:
                        request.getSession().setAttribute("rol", "Supervisor");//para acceso tipo SUPERVISOR
                        break;
                    case 3:
                        request.getSession().setAttribute("rol", "Vendedor");//para acceso tipo VENDEDOR
                        break;
                    default:
                        break;
                }
                
                request.getRequestDispatcher("controlador.do?accion=MenuPrincipal").forward(request, response);

            } else {

                request.getSession().setAttribute("validacion", "error");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }

        } else {

            request.getRequestDispatcher("index.jsp").forward(request, response);
            
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
