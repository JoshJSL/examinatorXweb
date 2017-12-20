<%@page import="entidades.validaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<%
    HttpSession sesX = request.getSession();
    String id = (String) sesX.getAttribute("id");

    if (id == null) {
        response.sendRedirect("../isProfe.jsp");

    }
    entidades.persona perso = new entidades.persona();
    validaciones val = new validaciones();
    perso.obten(id, "");
    String correo = perso.getCorreo();
    String clave = perso.getClave();
    String nom = perso.getNombre();
    String pat = perso.getApePater();
    String mat = perso.getApeMater();
    String foto = perso.getFoto();
    String eror = "";

    String botn = request.getParameter("btn");

    if (botn != null) {

        nom = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
        pat = request.getParameter("pat") == null ? "" : request.getParameter("pat");
        mat = request.getParameter("mat") == null ? "" : request.getParameter("mat");
        correo = request.getParameter("correo") == null ? "" : request.getParameter("correo");

        if (!nom.equals("") && !correo.equals("") && !pat.equals("") && !mat.equals("")) {
            if (val.correo(correo) && val.letras(nom) && val.letras(pat) && val.letras(mat)) {
                perso.setNombre(nom);
                perso.setApPat(pat);
                perso.setApMat(mat);
                perso.setCorreo(correo);
                perso.setId(id);
                perso.guardarBD();
            } else {
                eror = "alert('campos invalidos";
                eror += val.correo(correo) ? " correo " : "";
                eror += val.letras(nom) ? " nombre " : "";
                eror += val.letras(pat) ? " apellido paterno " : "";
                eror += val.letras(mat) ? " apellido materno " : "";
                eror += "');editaDatos(); ";
            }
        } else {
            eror = "alert('algun campo vacio XD');editaDatos();";
            nom = perso.getNombre();
            pat = perso.getApePater();
            mat = perso.getApeMater();
            correo = perso.getCorreo();
            clave = perso.getClave();
        }
    }


%>


<html>
    <head>
        <title>Examinator X</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo_profe.css">
        <script type="text/javascript" src="../script/Formulario_1.js" ></script>
        <script>

            function error(erro) {
                alert(erro);
            }
            function enviar() {
                document.frm2.submit();
                document.frm1.submit();

            }
            function cambiaImg() {
                var foto = document.getElementById('foto'),
                        formu = document.getElementById('formu'),
                        alrt = 'Si cambiaste algo aqui debes guardarlo antes'
                        ;
                if (confirm(alrt)) {
                    foto.style.display = 'block';
                    formu.style.display = 'none';
                }
            }
            function cImg() {
                var fto = document.getElementById('nvImg'),
                        archi = console.log(this.files[0].mozFullPath);
                fto.src = archi.value;
                alert(archi);
                alert(archi.value);

            }
        </script>

        <style type="text/css">
            select, input{
                background: #FDFDB5;
                border: solid #EFEF4A 5px;
            } 

            select:hover, input[type="button"]:hover, input[type="submit"]:hover{
                background: #EFEF4A;
                border: solid #FDFDB5 5px;
            }

            table tr:nth-child(even) {
                background-color: #FAFA91;
            }

            table tr:nth-child(odd) {
                background-color: #eee;
            }

            table tr:nth-child(odd/*par*/):hover {
                background-color: #EFEF4A;
            }

            table tr:nth-child(even/*impar*/):hover {
                background-color: #EFEF4A;
            }

            table tr:nth-child(1):hover {
                background-color: #B2B20B;
            }
            table tr:nth-child(1) {
                background-color: #B2B20B;
                color: #FFF;
                font-weight: bold;
            }
        </style>
    </head>
    <body onload="<%=eror%>">
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

        <div class="contenido" >

            <div class="tablita" id="datos" >
                <div class="gruposLabel"style="text-align: left">
                    Nombre: <%=nom + " " + pat + " " + mat%>
                </div>
                <br />
                <div class="gruposLabel"style="text-align: left">
                    Correo: <%=correo%>
                </div>
                <br />

                <div class="gruposLabel"style="text-align: left">
                    Clave: <%=clave%>
                </div>
                <br />
                <div class="gruposLabel"style="text-align: left">
                    Fotografia &nbsp;&nbsp;&nbsp;<img alt="Fotografia Profesor" width="150px"src="<%=foto%>">
                </div>
                <br /><br /><input  type="button" value="Editar" onclick="editaDatos();" />
                <br/><br/><br/><br/><br/><br/>


            </div>
            <div class=" tablita" id="formu" style="text-align: left">
                <div>
                    <span class="gruposLabel">Nombre &nbsp;</span>	
                    <br/><br/><br/><span class="gruposLabel">Apellido paterno &nbsp;</span>
                    <br/><br/><br/><br/><span class=" gruposLabel">Apellido Materno &nbsp;</span>
                    <br/><br/><br/><br/><span class="gruposLabel">Correo &nbsp;</span> 
                    <br/><br/><br/><span class="gruposLabel">Foto &nbsp;</span> 
                    <br/><br/><input type="button" name="imgD" id="imgD" value="Cambiar imagen" onclick="cambiaImg();" />
                    <br/><br/><span class="gruposLabel"> &nbsp;</span>
                </div>
                <div >
                    <form method="post" action="cuenta.jsp" name="frm1">
                        <input value="<%=nom%>" type="text" name="nombre" class="texto"  onkeypress="validarLet();" required="true" placeholder="Ingrese nombre">
                        <br/><br/><br/><input value="<%=pat%>" type="text" name="pat" class="texto" onkeypress="validarLet();" required="true" placeholder="Ingrese apellido paterno">
                        <br/><br/><br/><br/><input value="<%=mat%>" type="text" name="mat" class="texto"  onkeypress="validarLet();" required="true" placeholder="Ingrese apellido materno">
                        <br/><br/><br/><br/><input value="<%=correo%>" type="email" name="correo" class="texto" onkeypress="validarMail();" required="true" placeholder="Ingrese correo">
                        <br/><br/><br/><img style="width: 100px;" alt="Fotografia Profesor" src="<%=foto%>">

                        <br/><br/><br/><span class="gruposLabel"> &nbsp;</span><input type="submit" name="btn" value="Guardar" class="texto" id="btn"/>

                    </form> 

                </div>

            </div>
            <div class=" tablita" id="foto" style="display: none;">
                <span class="gruposLabel" ><center>Tardará un poco en subir tu imagen, si no cambia al instante no te asustes C: &nbsp;</center></span>
                <br/><br/><br/><span class="gruposLabel">Foto actual </span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;   
                <span class="gruposLabel">Foto Nueva &nbsp;</span>
                <br/><br/><br/><img style="width: 200px;" alt="Fotografia Profesor" src="<%=foto%>" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                <img id="nvImg" style="width: 200px;" alt="Fotografia Profesor" src="<%=foto%>" />
                <br/><br/><br/>
                <form action="subirImg.jsp" method="post" enctype="multipart/form-data">

                    <input type="file" id="archivo" name="archivo" onchange="cImg();" accept="image/*"/><br />
                    <br/><br/>
                    <input type="submit" value="Guardar foto" id="btnF"/>

                </form>
                <script>
                    if (window.FileReader) {
                        function seleccionArchivo(evt) {
                            var files = evt.target.files;
                            var f = files[0];
                            var leerArchivo = new FileReader();
                            
                            leerArchivo.onload = (function (elArchivo) {
                                
                                return function (e) {
                                    
                                    document.getElementById('nvImg').src =e.target.result;
                                };
                                
                            })(f);

                            leerArchivo.readAsDataURL(f);
                        }
                    } else {
                        alert( "El navegador no soporta vista previa");
                    }

                    document.getElementById('archivo').addEventListener('change', seleccionArchivo, false);


                </script>
            </div>
        </div>
    </body>
</html>