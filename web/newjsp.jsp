<%-- 
    Document   : newjsp
    Created on : 27/04/2017, 07:52:15 AM
    Author     : joshua
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    entidades.cDatos bd= new entidades.cDatos();
    String strProf="<table style='color: red;'><tr><td>Nombre</td><td>codigo Profe</td><td>e-mail</td><td>contra</td></tr></table>";
    try {
            bd.conectar();
            ResultSet US=bd.ejecuta("select * from vwProfesores");
                        
            while(US.next()){
                strProf+="<tr>";
                strProf+="<td>";
                strProf+=US.getNString("Profesor");
                strProf+="</td>";
                strProf+="<td>";
                strProf+=US.getNString("CodigoProfeaor");
                strProf+="</td>";
                strProf+="<td>";
                strProf+=US.getNString("e_mail");
                strProf+="</td>";
                    
                
                
                strProf+="</tr>";
            }
            strProf+="</table>";
        } 
    catch (Exception xdxdxd) {
        out.print(xdxdxd.getMessage());
        }
    

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Profes</h1>
        <%out.print(strProf);%>
    </body>
</html>
