<%-- 
    Document   : Productos
    Created on : 11/06/2020, 01:20:49 PM
    Author     : johnc
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>
<%
    List list = (List) request.getSession().getAttribute("Listarp");
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
    String[] marca = {"corona extra","victoria","modelo especial","negra modelo","pacífico","estrella","montejo","león","corona light","pacífico light"};
    String[] present = {"250 ml","355 ml","500 ml","940 ml","1000 ml"};
    String[] tona = {"clara","obscura","ambar","cristalina"};
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

        <br><br><br><h1 style="color: white;"><p class="text-center">INFORMACIÓN PRODUCTOS</p></h1>

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
                <%if (!rol.equals("Administrador")) {
                                        System.out.println("1#");
                                    } else {%>
                <button id="btnEliminar" type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal3">Eliminar</button>
                <%}
                              } else {
                                  request.getSession().setAttribute("cb", null);%>
                <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                <%if (!rol.equals("Administrador")) {
                                        System.out.println("2#");
                                    } else {%>
                <button id="btnEliminar" type="button" class="btn btn-danger" title="Debe Realizar una Busqueda Especifica Para Poder Eliminar Registro" data-toggle="modal" disabled>Eliminar</button>
                <%}
                                    }
                                } else {%>
                <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                <%if (!rol.equals("Administrador")) {
                                    System.out.println("3# " + rol);
                                } else {%>
                <button id="btnEliminar" type="button" class="btn btn-danger" title="Debe Realizar una Busqueda Especifica Para Poder Eliminar Registro" data-toggle="modal" disabled>Eliminar</button>
                <%}
                                    }
                                }%>

            </div>

            <!-- Mensaje Aviso de Agregar -->    
            <div>
                <%
                    System.out.println("CONFIRMACION DE AGREGAR PRODUCTOS: " + ca + cb);
                    if (ca != null) {
                        if (ca.equals("true")) {
                            request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Producto Agregado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ca.equals("false")) {
                    request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Producto NO Agregado
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
                    System.out.println("CONFIRMACION DE MODIFICAR PRODUCTOS: " + cm + cb);
                    if (cm != null) {
                        if (cm.equals("true")) {
                            request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Producto Modificado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (cm.equals("false")) {
                    request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Producto NO Modificado
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
                    System.out.println("CONFIRMACION DE ELIMINAR PRODUCTOS: " + ce + cb);
                    if (ce != null) {
                        if (ce.equals("true")) {
                            request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Producto Eliminado con Exito!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ce.equals("false")) {
                    request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Producto NO Eliminado
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
                    <a class="navbar-brand">Tabla Productos</a>
                    <form action="controlador.do" method="get" class="form-inline">
                        <input class="form-control mr-sm-2" name = "id" type="search" placeholder="N° de Producto" aria-label="Search" required>
                        <button name="accion" value="BuscarP" class="btn btn-primary" type="submit">Buscar</button>
                    </form>
                </nav>

            </div>

            <!-- Tabla Productos -->
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">N° Producto</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Tipo de Producto</th>
                        <th scope="col">Envasado</th>
                        <th scope="col">Presentacion</th>
                        <th scope="col">Tonalidad</th>
                        <th scope="col">Disponibilidad</th>
                    </tr>
                </thead>
                <%
                    Iterator<Producto> iter = list.iterator();
                    Producto pro = null;

                    while (iter.hasNext()) {
                        System.out.println(pro = iter.next());
                %>
                <tbody>
                    <tr>
                        <%
                            int id = Integer.parseInt(pro.getID());
                            if (id < 10) {%>
                        <th scope="row">000<%= pro.getID()%></th><%} else {%>
                        <th scope="row">00<%= pro.getID()%></th><%}%>
                        <td><%= pro.getDescripcion()%></td>
                        <% for (int i = 0; i < marca.length; i++) {
                            int m = pro.getMarca();
                            if (m == i+1) {%>
                        <td><%= marca[i]%></td><%}}
                            int tipop = pro.getTipoproducto();
                            if (tipop == 1) {%>
                        <td>Cerveza</td>
                        <%} else {%>
                        <td>Cerveza sin alcohol</td>   
                        <%} int enva = pro.getEnvasado();
                            if (enva == 1) {%>
                        <td>vidrio</td>
                        <%} else if(enva == 2) {%>
                        <td>lata</td>
                        <%} else {%>
                        <td>plastico</td><%}
                        for (int i = 0; i < present.length; i++) {
                            int p = pro.getPresentacion();
                            if (p == i+1) {%>
                        <td><%= present[i]%></td><%}}
                        for (int i = 0; i < tona.length; i++) {
                            int p = pro.getTonalidad();
                            if (p == i+1) {%>
                        <td><%= tona[i]%></td><%}}
                        int dis = pro.getDisponibilidad();
                            if (dis == 1) {%>
                                <td>SI</td>
                            <%} else {%>
                                <td>NO</td><%}%>
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
                        <h5 class="modal-title text-white">Registro de Productos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" id="validationServer01" name="descripcion" placeholder="Descripcion" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba una Descripcion del producto.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Marca del Producto</label>
                                    <select class="custom-select" name="marca" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < marca.length; i++) {%>
                                        <option value="<%= i+1%>"><%= marca[i]%></option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Tipo de Producto</label>
                                    <select class="custom-select" name="tipoproducto" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">Cerveza</option>
                                        <option value="2">Cerveza sin alcohol</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Envasado</label>
                                    <select class="custom-select" name="envasado" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">vidrio</option>
                                        <option value="2">lata</option>
                                        <option value="3">plastico</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Presentacion</label>
                                    <select class="custom-select" name="presentacion" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">250 ml</option>
                                        <option value="2">355 ml</option>
                                        <option value="3">500 ml</option>
                                        <option value="4">940 ml</option>
                                        <option value="5">1000 ml</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Tonalidad</label>
                                    <select class="custom-select" name="tonalidad" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">clara</option>
                                        <option value="2">obscura</option>
                                        <option value="3">ambar</option>
                                        <option value="4">cristalina</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="modal-footer">
                                <button name="accion" value="AgregarP" type="submit" class="btn btn-outline-success">Agregar</button>
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
                        <h5 class="modal-title text-white">Modificar Producto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            
                            <input type="hidden" name="idm" value="<%= pro.getID()%>"/>
                            
                            <div class="mb-3">
                                <input type="text" class="form-control is-valid" value="<%= pro.getDescripcion()%>" id="validationServer01" name="descripcion" placeholder="Descripcion" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba una Descripcion del producto.
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Marca del Producto</label>
                                    <select class="custom-select" name="marca" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < marca.length; i++) {
                                           int mc = pro.getMarca();
                                        if (mc == i+1) {%>
                                        <option value="<%= i+1%>" selected><%= marca[i]%></option><%} 
                                        else {%>
                                            <option value="<%= i+1%>"><%= marca[i]%></option>
                                        <%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Tipo de Producto</label>
                                    <select class="custom-select" name="tipoproducto" required>
                                        <option value="">Seleccionar...</option>
                                        <%if (pro.getTipoproducto()== 1) {%>
                                        <option value="1" selected>Cerveza</option>
                                        <option value="2">Cerveza sin alcohol</option><%} else {%>
                                        <option value="1">Cerveza</option>
                                        <option value="2" selected>Cerveza sin alcohol</option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Envasado</label>
                                    <select class="custom-select" name="envasado" required>
                                        <option value="">Seleccionar...</option>
                                        <%if (pro.getEnvasado() == 1) {%>
                                        <option value="1" selected>vidrio</option>
                                        <option value="2">lata</option>
                                        <option value="3">plastico</option><%} else if(pro.getEnvasado() == 2) {%>
                                        <option value="1">vidrio</option>
                                        <option value="2" selected>lata</option>
                                        <option value="3">plastico</option><%} else {%>
                                        <option value="1">vidrio</option>
                                        <option value="2" >lata</option>
                                        <option value="3" selected>plastico</option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Presentacion</label>
                                    <select class="custom-select" name="presentacion" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < present.length; i++) {
                                           int p = pro.getPresentacion();
                                        if (p == i+1) {%>
                                        <option value="<%= i+1%>" selected><%= present[i]%></option><%} 
                                        else {%>
                                            <option value="<%= i+1%>"><%= present[i]%></option>
                                        <%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Tonalidad</label>
                                    <select class="custom-select" name="tonalidad" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < tona.length; i++) {
                                           int t = pro.getTonalidad();
                                        if (t == i+1) {%>
                                        <option value="<%= i+1%>" selected><%= tona[i]%></option><%} 
                                        else {%>
                                            <option value="<%= i+1%>"><%= tona[i]%></option>
                                        <%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                            <div class="modal-footer">
                                <button name="accion" value="EditarP" type="submit" class="btn btn-outline-warning">Modificar</button>
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
                        <h5 class="modal-title text-white">Eliminar Producto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= pro.getID()%>"/>
                            <div class="mb-3">

                                <div align="center"><img src="bootstrap/img/adv.png" width="200" height="200"></div>

                                <p class="font-weight-bold" align="center"><FONT SIZE="5">¿Está seguro que desea eliminar <%= pro.getID()%>?</font></p>
                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EliminarP" type="submit" class="btn btn-outline-danger">Si, Deseo Eliminarlo!</button>
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
