<%@page import="entidades.examen_alumno"%>
<%@page import="entidades.examen_grupo"%>
<%@page import="entidades.grupo_persona"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>


<%
    HttpSession sesX = request.getSession();
    String id = (String)sesX.getAttribute("id");
    
    ArrayList<String[]> grupos = new ArrayList<>();
    ArrayList<String[]> grup = new ArrayList<>();
    ArrayList<ArrayList<String[]>> exam = new ArrayList<>();
    grupo_persona gp= new grupo_persona();
    examen_grupo eg= new examen_grupo();
    examen_alumno ea= new examen_alumno();
    String grp= "";
    String mat= "";
    String fec= "";
    exam.add(grup);
    if (id == null) {
        response.sendRedirect("../isProfe.jsp");
    }else{
        grupos = gp.gruposProf(id, "profe","0");    
        exam= eg.exmGrupos(id, grupos);
        grup= ea.alumPorProf(id);   
        String btn=request.getParameter("boton")==null?" ":request.getParameter("boton");
        if(!btn.equals(" ")){
            grp=request.getParameter("grup")==null?"":request.getParameter("grup");
             mat=request.getParameter("examen")==null?"":request.getParameter("examen");
             fec=request.getParameter("fech")==null?"":request.getParameter("fech");
            if(!grp.equals("")&&!mat.equals("")&&!fec.equals("")){
                String msj=eg.sube(mat, fec, grp, id);
                out.print("<script>alert('"+msj+"')</script>");
            }
    }
    }
%>


<!DOCTYPE html> 
<html>
    <head>
        <title>Examinator X</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo_profe.css">
        <script>
            function vaciaT(){
                var bot=document.getElementById('btn');
                bot.style.visibility="hidden";
              var tabli=document.getElementById('tablita');
              tabli.innerHTML='<tr><td>Alumno</td><td>Boleta</td><td>Aciertos</td><td>Calificación</td></tr>';
            }
            function enviar() {
                var bot=document.getElementById('btn');
                bot.style.visibility="hidden";
                var btn = document.getElementById('editar');
                if (btn.value == 'Guardar') {
                    document.getElementById('formi').submit();
                    document.getElementById('formi2').submit();
                }

            }
            function exame (  grup){
                var bot=document.getElementById('btn');
                bot.style.visibility="hidden";
                vaciaT();
            var selcxm = document.getElementById('examen');
        var exam = [
                    
            <%  if(!exam.get(0).equals("[]")){
                        for (int i = 0; i < exam.size(); i++) {
                            
                                for (int j = 0; j < exam.get(i).size(); j++) {
                                if (j == exam.get(i).size() - 1 && i == exam.size() - 1) {
                                    out.println("['" + exam.get(i).get(j)[0] + "', '" + exam.get(i).get(j)[1] + "', '" + exam.get(i).get(j)[2] + "', '" + exam.get(i).get(j)[3] + "', '" + exam.get(i).get(j)[4] + "']");
                                } else {
                                    out.println("['" + exam.get(i).get(j)[0] + "', '" + exam.get(i).get(j)[1] + "', '" + exam.get(i).get(j)[2] + "', '" + exam.get(i).get(j)[3] +"', '" + exam.get(i).get(j)[4] +  "'],");
                                }
                                    
                                }
                            }
            }
                %>
                            ]
            selcxm.innerHTML='<option value="examen">Examenes</option>';
            for (var i = 0; i < exam.length; i++) {
                    if(grup.value==exam[i][0]){
                        selcxm.innerHTML+='<option value="'+exam[i][1]+'">'+exam[i][1]+'</option>';
}
            
                            
            
            
            
            
            }
            
            }
            
            
            function fecha(mat){
            var bot=document.getElementById('btn');
            bot.style.visibility="hidden";
            vaciaT();
            var selgru = document.getElementById('grup');
              var selfch = document.getElementById('fech');
                var exam = [
                    
            <%  if(!exam.get(0).equals("[]")){
                        for (int i = 0; i < exam.size(); i++) {
                                    for (int j = 0; j < exam.get(i).size(); j++) {
                                if (j == exam.get(i).size() - 1 && i == exam.size() - 1) {
                                    out.println("['" + exam.get(i).get(j)[0] + "', '" + exam.get(i).get(j)[1] + "', '" + exam.get(i).get(j)[2] + "', '" + exam.get(i).get(j)[3] + "', '" + exam.get(i).get(j)[4] + "']");
                                } else {
                                    out.println("['" + exam.get(i).get(j)[0] + "', '" + exam.get(i).get(j)[1] + "', '" + exam.get(i).get(j)[2] + "', '" + exam.get(i).get(j)[3] +"', '" + exam.get(i).get(j)[4] +  "'],");
                                }
                                    
                                }
                            }
            }
                %>
                            ]
                            
                            selfch.innerHTML='<option value="fecha">Fecha</option>';
            for (var i = 0; i < exam.length; i++) {
                    if(mat.value==exam[i][1]&&selgru.value==exam[i][0]){
                        selfch.innerHTML+='<option value="'+exam[i][2]+'">'+exam[i][2]+'</option>';
}
            
                            
            
            
            
            
            }
                            
            
            }
            
            
            
            function alum(){
            
            vaciaT();
            var selgru = document.getElementById('grup');
              var selfch = document.getElementById('fech');
              var selcxm = document.getElementById('examen');
              var tabli=document.getElementById('tablita');
              var bot=document.getElementById('btn');
              bot.style.visibility="hidden";
              var alumn=[
                  <%
                      
                      for (int i = 0; i < grup.size(); i++) {
                              if(i==grup.size()-1){
                                  out.println("['" + grup.get(i)[0] + "', '" + grup.get(i)[1] + "', '" + grup.get(i)[2] + "', '" + grup.get(i)[3] + "', '" + grup.get(i)[4] + "', '" + grup.get(i)[5] +"', '" + grup.get(i)[6] +"', '" + grup.get(i)[7] + "', '" + grup.get(i)[8] +"', '" + grup.get(i)[9] +"']");
                              }else{
                                  out.println("['" + grup.get(i)[0] + "', '" + grup.get(i)[1] + "', '" + grup.get(i)[2] + "', '" + grup.get(i)[3] + "', '" + grup.get(i)[4] +"', '" + grup.get(i)[5] +"', '" + grup.get(i)[6] +"', '" + grup.get(i)[7] + "', '" + grup.get(i)[8] +"', '" + grup.get(i)[9] +"'], ");
                              }
                          }
                  %>];
                  for (var i = 0; i < alumn.length; i++) {
                      if(alumn[i][7]==selgru.value&&alumn[i][8]==selcxm.value&&alumn[i][9]==selfch.value){
                          tabli.innerHTML+='<tr><td>'+alumn[i][6]+'</td><td>'+alumn[i][5]+'</td><td>'+alumn[i][3]+'</td><td>'+alumn[i][4]+'</td></tr>';
                        bot.style.visibility="visible";
}
                  
                      }
                      
                  }
                  
              
            
            
            
        </script>
        <style type="text/css">
            .editar{
                border: solid #F94EFF 5px;
                display: none;
                width: 30%;
                margin: 0 auto;
            }
            .texti{
                display: block;

            }
            select, input{
                background: #EC8FEF;
                border: solid #F94EFF 5px;
            }

            select:hover, input:hover{
                background: #F94EFF;
                border: solid #EC8FEF 5px;
            }

            table tr:nth-child(even) {
                background-color: #EC8FEF;
            }

            table tr:nth-child(odd) {
                background-color: #eee;
            }

            table tr:nth-child(odd/*par*/):hover {
                background-color: #F94EFF;
            }

            table tr:nth-child(even/*impar*/):hover {
                background-color: #F94EFF;
            }

            table tr:nth-child(1):hover {
                background-color: #8F0D94;
            }
            table tr:nth-child(1) {
                background-color: #8F0D94;
                color: #fff;
                font-weight: bold;
            }
        </style>
    </head>
    <body >
        <div class="encabezado">
            <a href="Index2.jsp"><div class="barraElementos green">
                    <center>Inicio</center>
                </div></a>
            <a href="grupos.jsp"><div class="barraElementos blue">
                    <center>Grupos</center>
                </div></a>
            <a href="subir.jsp"><div class="barraElementos pur">
                    <center>Subir</center>
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

        <div class="contenido">
            <div class="herr">
                <form id="formi2" method="post" action="">
                <span class="gruposLabel">Seleccione </span>
                <br/><br/><br/>
                <select name="grup" id="grup" onchange="exame(this);">
                    <option value="grupo">Grupos</option>
                    <%
                            for (int i = 0; i < grupos.size(); i++) {
                                out.println("<option value='" + grupos.get(i)[1] + "'>" + grupos.get(i)[1] + "</option>");
                            }

                        %>
                </select>
                <br/><br/><br/>
                <select id="examen" name="examen" onchange="fecha(this);">
                    <option value="examen">Examenes</option>
                    
                </select>
                                <br/><br/><br/>

                <select name="fech" id="fech" onchange="alum();">
                    <option value="fech">Fecha</option>
                    
                </select>
                <br/><br/><br/>
                
                <br/><br/><br/>
                <input  type="submit" style="visibility: hidden;"style="display: none"  id="btn" name="boton" value="Subir"/>
                </form>
            </div>                

            <div class="tablita" style="padding-top: 0px;">
                <form id="formi" method="post" action="">
                    <table border="0" >
                        <tbody id="tablita">
                            <tr>
                                <td>
                                    Alumno
                                </td>
                                <td>
                                    Boleta
                                </td>
                                <td>
                                    Aciertos
                                </td>
                                <td>
                                    Calificación
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>