<%@page import="java.util.ArrayList"%>
<%@page import="entidades.validaciones"%>
<%@page import="entidades.grupo"%>
<%@page import="entidades.grupo_persona"%>
<%@page import="entidades.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesX = request.getSession();
    String id = (String) sesX.getAttribute("id");
    String msj = "";
    String frm = "";
    String btn="";
    
    ArrayList<String[]> grupos = new ArrayList<>();
    ArrayList<String[]> grupos2 = new ArrayList<>();
    grupo_persona gp = new grupo_persona();
    validaciones val = new validaciones();

    if (id == null) {
        response.sendRedirect("../isProfe.jsp");
    } else {
        
        String[] rr = request.getParameterValues("grupitos") == null ? new String[1] : request.getParameterValues("grupitos");
        btn = request.getParameter("sbm") == null ? "" : request.getParameter("sbm");
        if (btn.equals("Registrar")) {

            String nom = request.getParameter("grupo") == null ? "" : request.getParameter("grupo");
            String sem = request.getParameter("sem") == null ? "" : request.getParameter("sem");
            String turno = request.getParameter("turno") == null ? "" : request.getParameter("turno");
            frm = "N";
            if (val.grupi(nom) && val.esNum(sem) && Integer.parseInt(sem)<7&& Integer.parseInt(sem)>0) {
                grupo g = new grupo("0", nom, sem, turno);
                msj=g.guardarGrupo()[0][0];
                                if(msj.equals("si")){
                                    msj=gp.agregaPG(id, nom);
                                    msj=msj.equals("si")?"!Se guardó exitosamente el grupo!":msj;
                                    msj=msj.equals("ya tiene")?("!Ya tiene ese grupo"):msj;
                                    
                                }else{
                                    msj=msj.equals("existe g")?"Parece ser que ya existe ese grupo":"UPS! Ocurrio algun error";
                                }
            } else {
                msj = "UPS! Campo(s) invalidos";
                msj += val.grupi(nom) ? "":"<b><i> nombre</i></b> " ;
                msj += val.esNum(sem) ?"": "<b><i> semestre</i></b> " ;

            }

        } else {
            if (btn.equals("Agregar")) {
                frm = "E";
                
                for (int i = 0; i < rr.length; i++) {
                        msj=gp.agregaPG(id, rr[i]);
                    }
            }

        }
        grupos = gp.gruposProf(id, "profe","0");
        grupos2=gp.gruposProf(id, "profe","1");
        
        
        
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Examinator X</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo_profe.css">
        <script>
            function prendeApaga() {
                var xNuevo = document.getElementById('nuevoDiv'),
                        xTabli = document.getElementById('tabli'),
                        btn = document.getElementById('Agregar'),
                        selec = document.getElementById('grupi'),
                        btn2 = document.getElementById('Nuevo'),
                        btn3 = document.getElementById('btnSub'),
                        xExis = document.getElementById('existe'),
                        spn=document.getElementById('clave');


                if (xNuevo.style.display === "none") {

                    selec.style.visibility = "hidden";
                    btn2.style.visibility = "visible";
                    btn3.style.visibility = "visible";
                    btn.value = "Grupos";
                    xNuevo.style.display = "block";
                    xTabli.style.display = "none";
                    spn.style.display="none";

                } else {
                    selec.style.visibility = "visible";
                    btn2.style.visibility = "hidden";
                    btn3.style.visibility = "hidden";
                    btn.value = "Agregar";
                    xNuevo.style.display = "none";
                    xTabli.style.display = "block";
                    spn.style.display="block";
                    
                }
            }
            function prendeApaga2() {

                var xAgre = document.getElementById('agre'),
                        xExiste = document.getElementById('existe'),
                        btn = document.getElementById('Nuevo'),
                        btn3 = document.getElementById('btnSub')
                        
                ;
                if (xAgre.style.display === "none") {

                    xExiste.style.display = "none";
                    xAgre.style.display = "block";
                    btn3.value = "Registrar";
                    btn.value = "Existente";

                } else {

                    xExiste.style.display = "block";
                    xAgre.style.display = "none";
                    btn.value = "Nuevo";
                    btn3.value = "Agregar";


                }
            }
            function enviar(btn) {
                if (btn.value == "Agregar") {
                    document.getElementById("formAgr").submit();
                } else {
                    document.getElementById("formNue").submit();

                }
            }


            function cambiGrupo() {
                var alumnos = [
            <%
                        for (int i = 0; i < grupos.size(); i++) {
                            String[][] alumno = gp.alumnosProfe(grupos.get(i)[1]);
                            for (int j = 0; j < alumno.length; j++) {
                                if (j == alumno.length - 1 && i == grupos.size() - 1) {
                                    out.println("['" + grupos.get(i)[1] + "', '" + alumno[j][1] + "', '" + alumno[j][0] +"', '" + grupos.get(i)[2] + "']");
                                } else {
                                    out.println("['" + grupos.get(i)[1] + "', '" + alumno[j][1] + "', '" + alumno[j][0]+"', '" + grupos.get(i)[2]+ "'],");
                                }
                            }
                        }


            %>
                ];
                var grupo = document.getElementById('grupi'),
                        tabli = document.getElementById('tabla'),
                        clave=document.getElementById('clave');
                        clave.innerHTML="";
                tabli.innerHTML = "<tr><td>Alumno</td><td>Boleta</td><tr> ";
                for (var i = 0; i < alumnos.length; i++) {
                    if (grupo.value === alumnos[i][0]){
                        clave.innerHTML='Codigo grupo: '+alumnos[i][3];
                        tabli.innerHTML += "<tr><td>" + alumnos[i][2] + "</td><td>" + alumnos[i][1] + "</td></tr> ";
                }}
               
                tabli.innerHTML += "<style>" + "</style>";


            }
        </script>
        <style type="text/css">
            b{
                color: #FF3333;
            }
            .cont_n_g
            {

                margin:auto;



            }

            .tl
            {
                color:white;
                font-size:40px;
                text-align:center;
                font-family:arial;
                list-style:none;
                padding-top:20px;
            }

            .nombre
            {
                color:white;
                font-size:25px;
                font-family:arial;
                list-style:none;
                padding-top:20px;
            }
            .in
            {
                display:inline;
                margin-top:20px;
                margin-left:20px;
            }
            .sep
            {
                height:20px;
                width:500px;

            }
        </style>
        <style type="text/css">
            select, input{
                background: #E7F5FC;
                border: solid #4791C8 5px;
            }
            select:hover, input:hover{
                background: rgba(71,145,200,0.3);
                border: solid #E7F5FC 5px;
                color:#FFF;
            }
            select[multiple] option:hover{
                color: #fff;
            }

            option{
                color: #000;
                font-weight: bold;

            }

            .selcm{

                overflow: hidden;
                padding: 4px 10px;
                margin: 0 10px;

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
            .nuevoDiv{
                padding: 0;
                margin: 0;
            }
        </style>
    </head>
    <body>
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
        <form method="post" action="grupos.jsp">

            <div class="contenido">

                <div class="herr">
                    <span class="gruposLabel">Seleccione</span>
                    <br><br>
                    
                    <br>
                    <select id="grupi" onchange="cambiGrupo();" style="visibility: <%=frm.equals("") ? "visible" : "hidden"%>;">
                        <option value="Grupo">Grupos</option>
                        <%
                            for (int i = 0; i < grupos.size(); i++) {
                                out.println("<option value='" + grupos.get(i)[1] + "'>" + grupos.get(i)[1] + "</option>");
                            }

                        %>

                    </select>
                       <br/><br/>
                        <span class="gruposLabel"id="clave"></span>
                    <br/><br/><br/>

                    <input  type="button" value="<%=frm == "" ? "Agregar" : "Grupos"%>" id="Agregar" name="Agregar" onclick="prendeApaga();" />
                    <br/><br/><br/><input style="visibility: <%=frm.equals("") ? "hidden" : "visible"%>;" type="button" value="<%=frm.equals("E") ? "Nuevo" : "Existente"%>" id="Nuevo" name="Nuevo" onclick="prendeApaga2();" />
                    <br/><br/><br/><input type="submit" style="visibility: <%=frm.equals("") ? "hidden" : "visible"%>;"  value="<%=frm.equals("E") ? "Agregar" : "Registrar"%>" id="btnSub" name="sbm" />

                </div>
                <div class="tablita" >
                    <div id="tabli" style="display:  <%=frm.equals("") ? "block" : "none"%> ;">
                        <table border="0"   >
                            <tbody id="tabla">

                                <tr>
                                    <td>
                                        Alumno
                                    </td>
                                    <td>
                                        Boleta
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                    <div class="cont_n_g" id="nuevoDiv" style="display:  <%=frm.equals("") ? "none" : "block"%>;">

                             <div id="agre" style="display:  <% if (btn.equals("") || frm.equals("N")) {
                            out.print("block");
                        } else {
                            out.print("none");
                        }%>;">
                            <li class="tl">Nuevo grupo</li><br/>
                            <li class="nombre in"><%=msj%></li>
                            <br />

                            <li class="nombre in">Nombre:</li><input placeholder="Escriba nombre del grupo" type="text" name="grupo" class="in">
                            <br>
                            <div class="sep">

                            </div>
                            <br>


                            <li class="nombre in">Semestre:</li>
                            <input style="width: 170px;" placeholder="Semestre 1-6" type="number" max="6" min="1" name="sem" class="in">
                            <li class="nombre in">Turno:&nbsp;</li>
                            <select name="turno">
                                <option value="matutino">Matutino</option>
                                <option value="vespertino">Vespertino</option>
                            </select>

                        </div>
                        <div id="existe" style="display:  <%=frm.equals("E") ? "block" : "none"%>;">
                            <center>
                                <li class="tl">Agregar grupo</li>
                                <br>
                                    <li class="nombre in"><span style="font-size: 15px">(Use  <img width="30px" height="30px" src="../img/ctrl.png" alt="control"/> o <img width="30px" height="30px" src="../img/cmd.png" alt="command"/>  para seleccion multiple)</span></li><br/>
                                    <br/>
                                    <%                                        
                                        
                                        int h = 0;
                                        for (int k = 0; k < grupos2.size(); k++) {
                                            h=h==10?0:h+1;
                                            out.print(k%10==0?"</select>"+"<select class=\"selcm\" multiple size=\"10\" name='grupitos'>"+ "<option>" + grupos2.get(k)[1] + "</option>" : "<option>" + grupos2.get(k)[1] + "</option>");                                            
                                        }


                                    %>
                                    

                            </center>
                        </div>

                    </div>
                </div>
            </div>
        </form>

</body>
</html>