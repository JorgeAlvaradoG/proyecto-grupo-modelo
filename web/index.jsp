<%-- 
    Document   : index
    Created on : 26/05/2020, 01:01:40 PM
    Author     : johnc
--%>
<%String us = (String) request.getSession().getAttribute("validacion");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/jquery.js"></script>

        <link rel="icon" type="image/png" href="bootstrap/img/gm.png"/>
        <script type="text/javascript" src="bootstrap/js/deteccion.js"></script>
        <link rel="stylesheet" href="bootstrap/css/estilos.css">

        <title>Grupo Modelo</title>
    </head>
    <body>

        <div class="main">

            <div class="container">
                <center>
                    <div class="middle">
                        <div id="login">

                            <form action="validacion.do" method="get">

                                <fieldset class="clearfix">

                                    <FONT FACE="arial" SIZE=6 COLOR="white">ACCESO</FONT><br><br>

                                    <p ><span class="fa fa-user"></span><input type="text" name="nickname" Placeholder="Usuario" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
                                    <p><span class="fa fa-lock"></span><input type="password" name="contraseña" Placeholder="Contraseña" onkeyup="checkCapsWarning(event)" onfocus="checkCapsWarning(event)" onblur="removeCapsWarning()" required></p> <!-- JS because of IE support; better: placeholder="Password" -->
                                    <div style="display:none;color:white" id="caps">Tecla Mayuscula Activada!</div>
                                    <div>
                                        <span style="width:48%; text-align:left;  display: inline-block;"><a class="small-text" href="#"></a></span>
                                        <span style="width:50%; text-align:right;  display: inline-block;"><button type="submit" name="accion" value="Acceder" class="btn btn-outline-light">Acceder</button></span>
                                    </div>

                                </fieldset>
                                <div class="clearfix"></div>
                            </form>

                            <div class="clearfix"></div>
                            <%
                                System.out.println("logout: " + us);
                                if (us != null) {
                                    request.getSession().setAttribute("validacion", null);%>

                            <br><div class="alert alert-danger" align="center">Error, Contraseña o Usuario</div>

                            <%}%>
                        </div> <!-- end login -->

                        &emsp;&emsp;<img src="bootstrap/img/gm.png" width="240" height="240">

                    </div>
                </center>
            </div>

        </div>

    </body>
</html>
