<%@page import="entidades.examen_alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.grupo"%>
<%@page import="entidades.grupo_persona"%>
<%@page import="entidades.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesX= request.getSession();
    String id=(String)sesX.getAttribute("id");
    String nombre="";   
    String foto="";
    String crp="";
    String nombreG="";
    boolean gu=true;
    ArrayList<String[]> calif= new ArrayList<>();
    if(id==null){
        response.sendRedirect("../isAlumno.jsp");
    }else{
        persona p= new persona();
        p.obten(id, "");
        grupo_persona gp= new grupo_persona();
        examen_alumno ea= new examen_alumno();
        grupo g = new grupo();
        calif=ea.califAlum(id);
        gu =gp.alumTiene(id);
        nombreG=gp.nombreG();
        if(!gu){
            out.print(sesX.getAttribute("alrt")==null?"":"<script>alert('codigo incorrecto')</script>");
            crp="<div class=\"tablita\" ><div class=\"datos\">";
            crp+="<span> Hola! Parece ser que aún no tienes un grupo.<br/><br/>Ingresa el codigo de grupo que tu profesor te proporcionó.</span>";
            crp+="</div><br/><br/>";
            crp+="<form method=\"get\" action=\"grup.jsp\" onsubmit=\"return confirm('¿Estas seguro? ')\">";
            crp+="<input type=\"number\" name='codigo' id='codigo'/><input type=\"submit\" name='sbm' id='sbm' value='Aceptar'/>";
            crp+="</form><br/><br/><br/><br/><br/><br/><br/></div>";
        }else{
            
        }
    }



%>


<!DOCTYPE html>

<html>
    <head>
	<title>Examinator X</title>
	<meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo_profe.css">
        
	<style type="text/css">
            .datos{
                
            }
            .gr{
                text-align: center;
            }
            #grupi{
                margin: 0 auto;
            }
            select, input{
                background: #E7F5FC;
                border: solid #4791C8 5px;
            }
            select:hover, input:hover{
                background: rgba(71,145,200,0.3);
                border: solid #E7F5FC 5px;
                color:#FFF;
            }
            
            table tr:nth-child(even) {
                background-color: #C5E3FA;
            }
            
            table tr:nth-child(odd) {
                background-color: #eee;
            }
            
            table tr:nth-child(odd/*par*/):hover,table tr:nth-child(even/*impar*/):hover{
                background-color: #7AC4FD;
            }
            table tr:nth-child(1), table tr:nth-child(1):hover {
                background-color: #054576;
                color: #FFF;
                font-weight: bold;
            }
	</style>
        
</head>
<body>
    <div class="encabezado">
            <a href="Index2.jsp"><div class="barraElementos green">
                    <center>Inicio</center>
                </div></a>
            <a href="calificaciones.jsp"><div class="barraElementos blue">
                    <center>Calificaciones</center>
                </div></a>
            
            <a href="cuenta.jsp"><div class="barraElementos purp">
                    <center>Cuenta</center>
                </div></a>
            <a href="../index.html"><div class="barraElementos orange" >
                    <center>PrimeSoft</center>
                </div>
            </a>
            <a href="../examinatorX.jsp"><div class="barraElementos red" >
                    <center>Salir</center>
                </div>
            </a>
        </div>

        <br>
        <div class="contenido gr">
            <%=crp%>
            

            
            
        <div class="tablita" style="display: <%=!gu?"none":"block"%>">
            <div style="font-family: arial; color: white; font-size: 25px;">
                Tu grupo es: <%=nombreG%>
            </div>
                <table border="0"   >
                    <tbody id="tabla">
                    
                    <tr>
                        <td>
                            Examen
                        </td>
                        <td>
                            Fecha
                        </td>
                        <td>
                            Aciertos
                        </td>
                        <td>
                            Calificación
                        </td>
                    </tr>
                    <%
                    for (int i = 0; i < calif.size(); i++) {
                        out.print("<tr>");
                        
                                out.print("<td>"+calif.get(i)[0]+"</td>");
                                out.print("<td>"+calif.get(i)[1]+"</td>");
                                out.print("<td>"+calif.get(i)[2]+"</td>");
                                out.print("<td>"+calif.get(i)[3]+"</td>");
                            
                        out.print("</tr>");
                        
                        }
                    
                    
                    %>
                    
                    </tbody>
                </table>
            </div>
	</div>
</body>
</html>