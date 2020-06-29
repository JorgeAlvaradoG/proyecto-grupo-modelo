<%-- 
    Document   : Distribuciones
    Created on : 11/06/2020, 10:17:36 PM
    Author     : johnc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Distribucion"%>
<%@page import="java.util.List"%>
<%
    List list = (List) request.getSession().getAttribute("Listard");
    ArrayList<String> listnp;
    listnp = (ArrayList) request.getSession().getAttribute("Listardnp");
    ArrayList<String> listnc;
    listnc = (ArrayList) request.getSession().getAttribute("Listardnc");
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
    String[] empa = {"Paquete Chico","Paquete Mediano","Paquete Grande","Caja Chica","Caja Mediano","Caja Grande"};
    String[] preci = {"$22","$70","$90","$115","$236","$320","$396","$446"};
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

        <br><br><br><h1 style="color: white;"><p class="text-center">INFORMACIÓN VENTA Y DISTRIBUCION</p></h1>

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
                <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {
                                        System.out.println("1#");
                                    } else {%>
                <button id="btnEliminar" type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal3">Eliminar</button>
                <%}
                              } else {
                                  request.getSession().setAttribute("cb", null);%>
                <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {
                                        System.out.println("2#");
                                    } else {%>
                <button id="btnEliminar" type="button" class="btn btn-danger" title="Debe Realizar una Busqueda Especifica Para Poder Eliminar Registro" data-toggle="modal" disabled>Eliminar</button>
                <%}
                                    }
                                } else {%>
                <button id="btnEditar" type="button" class="btn btn-warning" title="Debe Realizar una Busqueda Especifica Para Poder Editar Registro" data-toggle="modal" disabled>Editar</button>&emsp;
                <%if (!rol.equals("Supervisor") && !rol.equals("Administrador")) {
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
                    System.out.println("CONFIRMACION DE AGREGAR DISTRIBUCION: " + ca + cb);
                    if (ca != null) {
                        if (ca.equals("true")) {
                            request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Distribucion Realizada Correctamente!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ca.equals("false")) {
                    request.getSession().setAttribute("ca", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Distribucion NO Realizada Correctamente
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
                    System.out.println("CONFIRMACION DE MODIFICAR DISTRIBUCION " + cm + cb);
                    if (cm != null) {
                        if (cm.equals("true")) {
                            request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Distribucion Modificada Correctamente!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (cm.equals("false")) {
                    request.getSession().setAttribute("cm", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Distribucion NO Modificada Correctamente
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
                    System.out.println("CONFIRMACION DE ELIMINAR DISTRIBUCION " + ce + cb);
                    if (ce != null) {
                        if (ce.equals("true")) {
                            request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                    Distribucion Cancelada Correctamente!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <%} else if (ce.equals("false")) {
                    request.getSession().setAttribute("ce", null);%>

                <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                    Error!!,Distribucion NO Cancelada Correctamente
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
                    <a class="navbar-brand">Tabla Distribucion</a>
                    <form action="controlador.do" method="get" class="form-inline">
                        <input class="form-control mr-sm-2" name = "id" type="search" placeholder="N° de Producto" aria-label="Search" required>
                        <button name="accion" value="BuscarD" class="btn btn-primary" type="submit">Buscar</button>
                    </form>
                </nav>

            </div>

            <!-- Tabla Productos -->
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">N° Distribucion</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Empaquetado</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Tipo de Venta</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Cantidad #</th>
                        <th scope="col">Fechar de Registro</th>
                    </tr>
                </thead>
                <%
                    Iterator<Distribucion> iter = list.iterator();
                    Distribucion dis = null;

                    while (iter.hasNext()) {
                        System.out.println(dis = iter.next());
                %>
                <tbody>
                    <tr>
                        <%
                            int id = Integer.parseInt(dis.getID());
                            if (id < 10) {%>
                        <th scope="row">000<%= dis.getID()%></th><%} else {%>
                        <th scope="row">00<%= dis.getID()%></th><%}%>
                        
                        <% for (int i = 0; i < listnp.size(); i++) {
                                int g = dis.getProducto();
                                if (g == i+1) {%>
                                    <td><%= listnp.get(g)%></td><%}}
                           for (int i = 0; i < empa.length; i++) {
                                int e = dis.getEmpaquetado();
                                if (e == i+1) {%>
                                    <td><%= empa[i]%></td><%}}
                           for (int i = 0; i < preci.length; i++) {
                                int p1 = dis.getPrecio();
                                if (p1 == i+1) {%>
                                    <td><%= preci[i]%></td><%}}
                                    int di = dis.getTipoventa();
                                if (di == 1) {%>
                                    <td>Menudeo</td>
                              <%} else {%>
                                    <td>Mayoreo</td><%}
                            for (int i = 0; i < listnc.size(); i++) {
                                int t = dis.getCliente();
                                if (t == i+1) {%>
                                    <td><%= listnc.get(t)%></td><%}}%>
                           <td><%= dis.getCantidad()%> Piezas</td>
                           <td><%= dis.getFecharegistro()%></td>
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
                        <h5 class="modal-title text-white">Registro de Distribucion</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Producto</label>
                                    <select class="custom-select" name="producto" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < listnp.size(); i++) {
                                            if (listnp.get(i) != null) {%>
                                        <option value="<%= i%>"><%= listnp.get(i)%></option><%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                        <div class="form-row">        
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Empaquetado</label>
                                    <select class="custom-select" name="empaquetado" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < empa.length; i++) {%>
                                        <option value="<%= i+1%>"><%= empa[i]%></option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                                    
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Precio</label>
                                    <select class="custom-select" name="precio" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < preci.length; i++) {%>
                                        <option value="<%= i+1%>"><%= preci[i]%></option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div> 
                        </div>
                                    
                            <div class="mb-3">
                                    <label for="validationServer01">Cliente</label>
                                    <select class="custom-select" name="cliente" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < listnc.size(); i++) {
                                            if (listnc.get(i) != null) {%>
                                        <option value="<%= i%>"><%= listnc.get(i)%></option><%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>        
                            
                        <div class="form-row">            
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Venta</label>
                                    <select class="custom-select" name="tipoventa" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="1">Menudeo</option>
                                        <option value="2">Mayoreo</option>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="validationServer01">Cantidad #</label>
                                <input type="number" min="1" max="999" class="form-control is-valid" id="validationServer01" name="cantidad" placeholder="Seleccionar..." required>
                                <div class="invalid-feedback">
                                    Por favor, escriba o seleccione la Cantidad total.
                                </div>
                            </div>
                        </div>    
                                    
                            <div class="modal-footer">
                                <button name="accion" value="AgregarD" type="submit" class="btn btn-outline-success">Agregar</button>
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
                            
                            <input type="hidden" name="idm" value="<%= dis.getID()%>"/>
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Producto</label>
                                    <select class="custom-select" name="producto" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < listnp.size(); i++) {
                                            if (listnp.get(i) != null) {
                                                if (dis.getProducto() == i) {%>
                                        <option value="<%= i%>" selected><%= listnp.get(i)%></option><%}
                                        else {%>
                                        <option value="<%= i%>"><%= listnp.get(i)%></option><%}}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                            
                        <div class="form-row">        
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Empaquetado</label>
                                    <select class="custom-select" name="empaquetado" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < empa.length; i++) {
                                        if (dis.getEmpaquetado() == i+1) {%>
                                        <option value="<%= i+1%>" selected><%= empa[i]%></option><%}
                                        else {%>
                                        <option value="<%= i+1%>"><%= empa[i]%></option><%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                                
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Precio</label>
                                    <select class="custom-select" name="precio" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < preci.length; i++) {
                                        if (dis.getPrecio() == i+1) {%>
                                        <option value="<%= i+1%>" selected><%= preci[i]%></option><%}
                                        else {%>
                                        <option value="<%= i+1%>"><%= preci[i]%></option><%}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>
                        </div>    
                            
                            <div class="mb-3">
                                    <label for="validationServer01">Cliente</label>
                                    <select class="custom-select" name="cliente" required>
                                        <option value="">Seleccionar...</option>
                                        <%for (int i = 0; i < listnc.size(); i++) {
                                            if (listnc.get(i) != null) {
                                                if (dis.getCliente() == i) {%>
                                        <option value="<%= i%>" selected><%= listnc.get(i)%></option><%}
                                        else {%>
                                        <option value="<%= i%>"><%= listnc.get(i)%></option><%}}}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                            </div>    
                                    
                        <div class="form-row">            
                            <div class="col-md-6 mb-3">
                                    <label for="validationServer01">Tipo de Venta</label>
                                    <select class="custom-select" name="tipoventa" required>
                                        <option value="">Seleccionar...</option>
                                        <%if (dis.getTipoventa()== 1) {%>
                                        <option value="1" selected>Menudeo</option>
                                        <option value="2">Mayoreo</option><%} else {%>
                                        <option value="1">Menudeo</option>
                                        <option value="2" selected>Mayoreo</option><%}%>
                                    </select>
                                    <div class="invalid-feedback">Porfavor, elija una opcion</div>
                                </div>
                            
                            <div class="col-md-6 mb-3">
                                <label for="validationServer01">Cantidad #</label>
                                <input type="number" min="1" max="999" class="form-control is-valid" value="<%= dis.getCantidad()%>" id="validationServer01" name="cantidad" placeholder="Seleccionar..." required>
                                <div class="invalid-feedback">
                                    Por favor, escriba o seleccione la Cantidad total.
                                </div>
                            </div>
                        </div>         
                                
                            <div class="modal-footer">
                                <button name="accion" value="EditarD" type="submit" class="btn btn-outline-warning">Modificar</button>
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
                        <h5 class="modal-title text-white">Eliminar Distribucion</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="was-validated" method="get" action="controlador.do">
                            <input type="hidden" name="idm" value="<%= dis.getID()%>"/>
                            <div class="mb-3">

                                <div align="center"><img src="bootstrap/img/adv.png" width="200" height="200"></div>

                                <p class="font-weight-bold" align="center"><FONT SIZE="5">¿Está seguro que desea eliminar <%= dis.getID()%>?</font></p>
                            </div>
                            <div class="modal-footer">
                                <button name="accion" value="EliminarD" type="submit" class="btn btn-outline-danger">Si, Deseo Eliminarlo!</button>
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
