<%-- 
    Document   : Clientes
    Created on : 30/05/2020, 12:09:29 AM
    Author     : johnc
--%>

<%@page import="modelo.CRUDCliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    List list = (List) request.getSession().getAttribute("Listar");
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

        <link rel="stylesheet" href="bootstrap/css/fondo.css">
        <title>Grupo Modelo | Clientes</title>
    </head>
    <body style="background-color:#14448e;">

        <br><br><br><h1 style="color: white;"><p class="text-center">INFORMACIÓN CLIENTES</p></h1>

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
                    System.out.println("CONFIRMACION DE AGREGAR CLIENTE: " + ca + cb);
                    if (ca != null) {
                        if (ca.equals("true")) {
                            request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Cliente Agregado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ca.equals("false")) {request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Cliente NO Agregado
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
                    System.out.println("CONFIRMACION DE MODIFICAR CLIENTE: " + cm + cb);
                    if (cm != null) {
                        if (cm.equals("true")) {
                            request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Cliente Modificado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (cm.equals("false")) {request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Cliente NO Modificado
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
                    System.out.println("CONFIRMACION DE ELIMINAR CLIENTE: " + ce + cb);
                    if (ce != null) {
                        if (ce.equals("true")) {
                            request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Cliente Eliminado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ce.equals("false")) {request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Cliente NO Eliminado
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
                        <button name="accion" value="BuscarC" class="btn btn-primary" type="submit">Buscar</button>
                    </form>
                </nav>

            </div>

            <!-- Tabla Clientes -->
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">N° Cliente</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Antiguedad</th>
                        <th scope="col">Estatus</th>
                    </tr>
                </thead>
                <%
                    Iterator<Cliente> iter = list.iterator();
                    Cliente cli = null;

                    while (iter.hasNext()) {
                        System.out.println(cli = iter.next());
                %>
                <tbody>
                    <tr>
                        <%
                            int id = Integer.parseInt(cli.getID());
                            if (id < 10) {%>
                        <th scope="row">000<%= cli.getID()%></th><%} else {%>
                        <th scope="row">00<%= cli.getID()%></th><%}%>
                        <td><%= cli.getNombre()%></td>
                        <td><%= cli.getTelefono()%></td>
                        <td><%= cli.getCorreo()%></td>
                        <td><%= cli.getDireccion()%></td>
                        <%
                            int tipo = cli.getTipocliente();
                            if (tipo == 1) {%>
                        <td>Persona Física</td>
                        <%} else {%>
                        <td>Persona Moral</td>   
                        <%}
                        %>
                        <td><%= cli.getAntiguedad()%></td>
                        <%
                            int estatus = cli.getEstatus();
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
                        <h5 class="modal-title text-white">Registro de Clientes</h5>
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
                                <input type="text" class="form-control is-valid" id="validationServer01" name="direccion" placeholder="Direccion" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba la direccion.
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Cliente</label>
                                    <select class="custom-select" name="tipo" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">Persona Física</option>
                                        <option value="2">Persona Moral</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                                
                            </div>

                            <div class="modal-footer">
                                <button name="accion" value="AgregarC" type="submit" class="btn btn-outline-success">Agregar</button>
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
                        <h5 class="modal-title text-white">Modificar Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= cli.getID()%>"/>
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= cli.getNombre()%>" id="validationServer01" name="name" placeholder="Nombre" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el nombre.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= cli.getTelefono()%>" id="validationServer01" name="telefono" placeholder="Telefono" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el telefono.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= cli.getCorreo()%>" id="validationServer01" name="correo" placeholder="Correo" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba el correo.
                                </div>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= cli.getDireccion()%>" id="validationServer01" name="direccion" placeholder="Direccion" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba la direccion.
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Cliente</label>
                                    <select class="custom-select" name="tipo" required>
                                        <option value="">Seleccionar...</option>
                                        <%if (cli.getTipocliente() == 1) {%>
                                        <option value="1" selected>Persona Física</option>
                                        <option value="2">Persona Moral</option><%} else {%>
                                        <option value="1">Persona Física</option>
                                        <option value="2" selected>Persona Moral</option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EditarC" type="submit" class="btn btn-outline-warning">Modificar</button>
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
                        <h5 class="modal-title text-white">Eliminar Cliente</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= cli.getID()%>"/>
                            <div class="mb-3">

                                <div align="center"><img src="bootstrap/img/adv.png" width="200" height="200"></div>

                                <p class="font-weight-bold" align="center"><FONT SIZE="5">¿Está seguro que desea eliminar <%= cli.getNombre()%>?</font></p>
                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EliminarC" type="submit" class="btn btn-outline-danger">Si, Deseo Eliminarlo!</button>
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
