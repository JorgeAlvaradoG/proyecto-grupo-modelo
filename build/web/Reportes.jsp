<%-- 
    Document   : Reportes
    Created on : 9/06/2020, 01:13:11 AM
    Author     : johnc
--%>

<%
    String re = "";
    re = (String) request.getSession().getAttribute("re");
    String rg = "";
    rg = (String) request.getSession().getAttribute("rg");
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
        <br><br><br><h1 style="color: white;"><p class="text-center">GENERAR REPORTES</p></h1>
        <div align="center">
            <div class="p-md-4" style="width: 500px; height: 400px">
                <img src='bootstrap/img/graficoBarra_1.jpg' style="border: sienna 5px solid;"  class="d-block w-100" alt="...">
            </div>

            <br><form class="was-validated" method="get" action="controlador.do">
                <div style='margin-bottom: 10px'>

                    <button name="accion" value="PDF" type="submit" class="btn btn-danger">Generar Tabla</button>&emsp;
                    <button name="accion" value="Grafica" type="submit" class="btn btn-primary">Generar Grafica</button>

                </div>
            </form>
        </div>
        
        <!-- Mensaje Aviso de PDF -->    
        <div>
            <%
                System.out.println("CONFIRMACION DE GENERAR PDF DE CLIENTE: " + re);
                if (re != null) {
                    if (re.equals("true")) {
                        request.getSession().setAttribute("re", null);%>

            <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                Reporte PDF de la Tabla Cliente Generado correctamente!!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%} else if (re.equals("false")) {%>

            <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                Error!!,Reporte PDF de la Tabla Cliente NO se Genero
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%}
                }%>
        </div>

        <!-- Mensaje Aviso de Grafica -->    
        <div>
            <%
                System.out.println("CONFIRMACION DE GENERAR Grafica DE CLIENTE: " + rg);
                if (rg != null) {
                    if (rg.equals("true")) {
                        request.getSession().setAttribute("rg", null);%>

            <div class="alert alert-success alert-dismissible fade show" align="center" role="alert">
                Grafica de la Ventas Generada correctamente!!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%} else if (rg.equals("false")) {%>

            <div class="alert alert-danger alert-dismissible fade show" align="center" role="alert">
                Error!!,Grafica de las Ventas NO se Genero
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%}
                }%>
        </div>
        
        <script src="bootstrap/js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/popper.js"></script>
        <script src="bootstrap/js/main.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    </body>
</html>
