<%-- 
    Document   : grup
    Created on : 15/05/2017, 07:04:15 PM
    Author     : joshua
--%>

<%@page import="entidades.validaciones"%>
<%@page import="entidades.grupo_persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xSes=request.getSession();
    String id=(String)xSes.getAttribute("id");
    if(id==null){
        response.sendRedirect("../isAlumno.jsp");
    }else{
        grupo_persona gp= new grupo_persona();
        validaciones val= new validaciones();
        String nomG=request.getParameter("codigo")==null?"":request.getParameter("codigo");
        if (val.esNum(nomG)) {
                String si=gp.agregaPG(id, nomG);
                if(si.equals("si")){
                    response.sendRedirect("calificaciones.jsp");
                }else{
                    xSes.setAttribute("alrt", "cod");
        response.sendRedirect("calificaciones.jsp");
                }
                        
                        
        }else{
            xSes.setAttribute("alrt", "cod");
        response.sendRedirect("calificaciones.jsp");
        }
        
        
        
    }


%>