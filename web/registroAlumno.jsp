
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%
    HttpSession sesX= request.getSession();
    String id=(String)sesX.getAttribute("id");
    String err="";
    String nombre=request.getParameter("nombre")==null?"":request.getParameter("nombre");
    String pat=request.getParameter("apePat")==null?"":request.getParameter("apePat");
    String mat=request.getParameter("apeMat")==null?"":request.getParameter("apeMat");
    String boleta=request.getParameter("boleta")==null?"":request.getParameter("boleta");
    String correo=request.getParameter("mail")==null?"":request.getParameter("mail");
    String contr=request.getParameter("contra")==null?"":request.getParameter("contra");
    String mal="";
    String conContr=request.getParameter("confiContra")==null?"":request.getParameter("confiContra");
    if(id!=null){
        err="<script>window.history.back();</script>";
    }else{
    
    if(!nombre.equals("")&&!pat.equals("")&&!mat.equals("")&&!boleta.equals("")&&!correo.equals("")&&!contr.equals("")&&!conContr.equals(""))
    {
        if(contr.equals(conContr)){
            entidades.validaciones vali= new entidades.validaciones();
            if (vali.todo(nombre, pat, mat, boleta, correo, contr, conContr)) {
                    entidades.persona alumno=new entidades.persona("alumno","0", boleta, contr, nombre, pat, mat, correo,"logoipn.jpg");
                    mal=alumno.guardarBD();
                    if(mal.equals("Usuario registrado")){
                        entidades.cMD5 md= new entidades.cMD5();
                        response.sendRedirect("confirma.jsp?mbdp5e="+md.md5(boleta)+"&"+"5cdomn="+md.md5(contr)+"&"+"qecorc="+md.md5("confirma")+"&"+"aop="+(4*156));
                    }
                }else{
                mal="Campos invalidos :";
                mal += vali.letras(nombre) ? "" : " Nombre  ";
                mal += vali.letras(pat) ? "" : " Apelido Paterno ";
                mal += vali.letras(mat) ? "" : " Apelido Materno ";
                mal += vali.num(boleta) ? "" : " Boleta ";
                mal += vali.correo(correo) ? "" : " Correo ";
                mal += vali.contra(contr) ? "" : " Contraseña ";
                mal += vali.contra(conContr) ? "" : " Confirmar Contraseña ";

            }
        }else{
            mal="Las contraseñas no coinciden";
        }
    }else{
        mal = request.getParameter("btn")==null ? "" : "<span style='color: red'> ¡ </span>  Hay campos vacios, completalos <span style='color: red'> ! </span>";

    }
    }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%=err%>

<script type="text/javascript" src="script/Formulario_1.js">

</script>
<link rel="stylesheet" type="text/css" href="css/Registro.css">
	<title>Registro Alumno</title>
</head>
<body>
	<div class="encabezado"> <div align="center"><ul> <li class="tit letra"> Examinator-X </li> </ul></div> </div>
	<br> <br> <br> <br> <br> <br>

	<div class="Contenido_e">
		<div align="center">
		<div class="Crear">
		
                   <h1 class="prt letra">Ingrese sus datos</h1><h1 class="pr letra">Alumno</h1>
				</div>
                    <div class="error">
                        <%=mal%> 
                    </div>
                            <table width="100%">
					<form method="post" onsubmit="contra();" >
					<tr>
                                            <td><li class="formi letra">Nombre &nbsp;</li>	<input type="text" name="nombre" tabindex="1" class="texto"  onkeypress="validarLet();" required="true" placeholder="Ingrese su nombre" value="<%=nombre%>"></td>
                                        <td><li class="formi letra">Correo &nbsp;</li> <input type="email" name="mail" tabindex="5" class="texto" onkeypress="validarMail();" required="true" placeholder="Ingrese su correo" value="<%=correo%>"></td>
					</tr>
					<tr>
                                            <td><li class="formi letra">Apellido paterno &nbsp;</li><input type="text" name="apePat" tabindex="2" class="texto" onkeypress="validarLet();" required="true" placeholder="Ingrese su apellido paterno" value="<%=pat%>"></td>
                                        <td><li class="formi letra">Contraseña <span style="font-size: 10px;"> (min 6 caracteres)</span>&nbsp;</li><input type="password" name="contra" tabindex="6" class="texto" required="true" placeholder="Ingrese su contraseña" minlength="6" maxlength="15"  pattern=".{6,}" id="contra" value="<%=contr%>">	</td>
					</tr>
					<tr>
						<td><li class="formi letra">Apellido Materno &nbsp;</li>	<input type="text" name="apeMat" tabindex="3" class="texto"  onkeypress="validarLet();" required="true" placeholder="Ingrese su apellido materno" value="<%=mat%>"></td>
                                        <td><li class="formi letra">Confirmar Contraseña &nbsp;</li><input type="password" tabindex="7" name="confiContra" class="texto" required="true" placeholder="Confirme su contraseña" minlength="6" maxlength="15" id="confiContra" value="<%=conContr%>">	</td>
					</tr>
					<tr>
                                            <td><li class="formi letra">Boleta<span style="font-size: 10px;"> (10 digitos)</span>&nbsp;</li>	<input type="text" name="boleta" tabindex="4" class="texto"  onkeypress="validarBol();" required="true" id="Boleta" placeholder="Ingrese su boleta o PM" maxlength="10" value="<%=boleta%>"></td>
                                        <td><li class="formi letra"> &nbsp;</li><input type="submit" value="Registrar" name="btn" class="texto botoncitoo" id="botoncitoo"  ></input> <a href="isAlumno.jsp"><Span class="texto letra formi botoncitoo " style="padding: 1px 15px;">Regresar</span></a>	</td>
					</tr>

					</form>
				</table>
                                        
		</div>
</body>
</html>