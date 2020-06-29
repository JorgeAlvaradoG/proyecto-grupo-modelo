<%-- 
    Document   : Usuario
    Created on : 11/06/2020, 10:32:38 AM
    Author     : johnc
--%>

<%@page import="modelo.CRUDUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    List list = (List) request.getSession().getAttribute("Listaru");
    String ca = "";
    ca = (String) request.getSession().getAttribute("ca");
    String cb = "";
    cb = (String) request.getSession().getAttribute("cb");
    String cm = "";
    cm = (String) request.getSession().getAttribute("cm");
    String ce = "";
    ce = (String) request.getSession().getAttribute("ce");
    String rol = "";
    rol = (String) request.getSession().getAttribute("rol");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="bootstrap/js/jquery.js"></script>
        <script type="text/javascript" src="bootstrap/js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        
        <title>JSP Page</title>
    </head>
    <body style="background-color:#14448e;">
        
        <br><br><br><h1 style="color: white;"><p class="text-center">INFORMACIÓN USUARIOS</p></h1>

        <!-- Botones Agregar, Modificar y Eliminar -->
        <div class="p-md-5 pt-5">

            <div style='margin-bottom: 10px'>

                &nbsp;<button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Agregar</button>&emsp;

                <%if (rol != null) {
                        System.out.println(rol);
                        if (cb != null) {
                            if (cb.equals("fila") && !list.isEmpty()) {
                                request.getSession().setAttribute("cb", null);%>
                                <button id="btnEditar" type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2">Editar</button>&emsp;
                                <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {System.out.println("1#");
                                } else {%>
                                    <button id="btnEliminar" type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal3">Eliminar</button>
                              <%}
                            } else {
                                request.getSession().setAttribute("cb", null);%>
                                <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                                <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {System.out.println("2#");
                                  } else {%>
                                        <button id="btnEliminar" type="button" class="btn btn-danger" title="Debe Realizar una Busqueda Especifica Para Poder Eliminar Registro" data-toggle="modal" disabled>Eliminar</button>
                                <%}
                            }
                        } else {%>
                            <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                            <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {System.out.println("3# " +rol);
                              } else {%>
                                    <button id="btnEliminar" type="button" class="btn btn-danger" title="Debe Realizar una Busqueda Especifica Para Poder Eliminar Registro" data-toggle="modal" disabled>Eliminar</button>
                            <%}
                        }
                }%>

            </div>
        
            <!-- Mensaje Aviso de Agregar -->    
            <div>
                <%
                    System.out.println("CONFIRMACION DE AGREGAR USUARIO: " + ca + cb);
                    if (ca != null) {
                        if (ca.equals("true")) {
                            request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Usuario Agregado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ca.equals("false")) {request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Usuario NO Agregado
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%}
                    }%>
            </div>

            <!-- Mensaje Aviso de Modificar -->
            <div>
                <%
                    System.out.println("CONFIRMACION DE MODIFICAR USUARIO: " + cm + cb);
                    if (cm != null) {
                        if (cm.equals("true")) {
                            request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Usuario Modificado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (cm.equals("false")) {request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Usuario NO Modificado
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%}
                    }%>
            </div>

            <!-- Mensaje Aviso de Eliminar -->
            <div>
                <%
                    System.out.println("CONFIRMACION DE ELIMINAR USUARIO: " + ce + cb);
                    if (ce != null) {
                        if (ce.equals("true")) {
                            request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Usuario Eliminado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ce.equals("false")) {request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Usuario NO Eliminado
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%}
                    }%>
            </div>
                
            <!-- Barra Buscar -->
            <div>

                <nav class="navbar navbar-dark bg-dark">
                    <a class="navbar-brand">Tabla Clientes</a>
                    <form action="controlador.do" method="get" class="form-inline">
                        <input class="form-control mr-sm-2" name = "nombre" type="search" placeholder="Ingrese el Nombre" aria-label="Search" required>
                        <button name="accion" value="BuscarU" class="btn btn-primary" type="submit">Buscar</button>
                    </form>
                </nav>

            </div>

            <!-- Tabla Usuarios -->
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">N° Usuario</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido Materno</th>
                        <th scope="col">Apellido Paterno</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Tipo de Acceso</th>
                        <th scope="col">Antiguedad</th>
                        <th scope="col">Estatus</th>
                    </tr>
                </thead>
                <%
                    Iterator<Usuario> iter = list.iterator();
                    Usuario usu = null;

                    while (iter.hasNext()) {
                        System.out.println(usu = iter.next());
                %>
                <tbody>
                    <tr>
                        <%
                            int id = Integer.parseInt(usu.getID());
                            if (id < 10) {%>
                        <th scope="row">000<%= usu.getID()%></th><%} else {%>
                        <th scope="row">00<%= usu.getID()%></th><%}%>
                        <td><%= usu.getNombre()%></td>
                        <td><%= usu.getApellidoP()%></td>
                        <td><%= usu.getApellidoM()%></td>
                        <td><%= usu.getTelefono()%></td>
                        <td><%= usu.getCorreo()%></td>
                        <%
                            int tipoR = usu.getRol();
                            if (tipoR == 1) {%>
                        <td>Administrador</td>
                        <%} else if (tipoR == 2) {%>
                        <td>Supervisor</td>   
                        <%} else {%>
                        <td>Vendedor</td>
                        <%}
                        %>
                        <td><%= usu.getAntiguedad()%></td>
                        <%
                            int estatus = usu.getEstatus();
                            if (estatus == 1) {%>
                        <td>Activo</td>
                        <%} else {%>
                        <td>Inactivo</td>   
                        <%}
                        %>

                    </tr>
                    <%}%>
                </tbody>
            </table>

            <!-- Mensaje De Buscar -->
            <%
                if (list.isEmpty()) {%>
            <div class="alert alert-warning alert-dismissible fade show" align="center" role="alert">
                No Existe el Registro
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%}%>
        </div>
            
        <!-- Modal Agregar -->
        <div class="modal" tabindex="-1" role="dialog" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-success">
                        <h5 class="modal-title text-white">Registro de Usuarios</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="name" placeholder="Nombre" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el nombre.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="apeP" placeholder="Apellido Paterno" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el apellido paterno.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="apeM" placeholder="Apellido Materno" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el apellido materno.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="nick" placeholder="Nickname" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el nickname.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <input type="tel" class="form-control is-valid" id="validationServer01" name="telefono" placeholder="Telefono" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el telefono.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="email" class="form-control is-valid" id="validationServer01" name="correo" placeholder="Correo" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el correo.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="password" class="form-control is-valid" id="validationServer01" name="contra" placeholder="Contraseña" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba la contraseña que asignara.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="validationServer01">Pregunta Para Recuperacion de Contraseña</label>
                                    <select class="custom-select" name="pregunta" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">¿Cual es el nombre de tu mascota?</option>
                                        <option value="2">¿Cual es tu pelicula favorita?</option>
                                        <option value="3">¿Cual es tu deporte favorito?</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="respuesta" placeholder="Respuesta" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba la contraseña que asignara.
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Acceso</label>
                                    <select class="custom-select" name="tipo" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">Administrador</option>
                                        <option value="2">Supervisor</option>
                                        <option value="2">Vendedor</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button name="accion" value="AgregarU" type="submit" class="btn btn-outline-success">Agregar</button>
                                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        
        <%if (!list.isEmpty()) {%>
        <!-- Modal Editar -->
        <div class="modal" tabindex="-1" role="dialog" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title text-white">Modificar Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= usu.getID()%>"/>
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= usu.getNombre()%>" id="validationServer01" name="name" placeholder="Nombre" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el nombre.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= usu.getApellidoP()%>" id="validationServer01" name="apeP" placeholder="Appellido Paterno" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el Apellido Paterno.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= usu.getApellidoM()%>" id="validationServer01" name="apeM" placeholder="Apellido Materno" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el Apellido Materno.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= usu.getTelefono()%>" id="validationServer01" name="telefono" placeholder="Telefono" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el telefono.
                                </div>
                            </div>
                                
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= usu.getCorreo()%>" id="validationServer01" name="correo" placeholder="Correo Electronico" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el Correo Electronico.
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Acceso</label>
                                    <select class="custom-select" name="tipo" required>
                                        <option value="">Seleccionar...</option>
                                        <%if (usu.getRol() == 1) {%>
                                        <option value="1" selected>Administrador</option>
                                        <option value="2">Supervisor</option>
                                        <option value="3">Vendedor</option><%} else if(usu.getRol() == 2) {%>
                                        <option value="1">Administrador</option>
                                        <option value="2" selected>Supervisor</option>
                                        <option value="3">Vendedor</option><%} else {%>
                                        <option value="1">Administrador</option>
                                        <option value="2" >Supervisor</option>
                                        <option value="3" selected>Vendedor</option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EditarU" type="submit" class="btn btn-outline-warning">Modificar</button>
                                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!-- Modal Eliminar -->
        <div class="modal" tabindex="-1" role="dialog" id="myModal3">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-danger">
                        <h5 class="modal-title text-white">Eliminar Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= usu.getID()%>"/>
                            <div class="mb-3">

                                <div align="center"><img src="bootstrap/img/adv.png" width="200" height="200"></div>

                                <p class="font-weight-bold" align="center"><FONT SIZE="5">¿Está seguro que desea eliminar el usuario <%= usu.getNombre()%>?</font></p>
                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EliminarU" type="submit" class="btn btn-outline-danger">Si, Deseo Eliminarlo!</button>
                                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%}%>
        
        <script src="bootstrap/js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/popper.js"></script>
        <script src="bootstrap/js/main.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        
    </body>
</html>
