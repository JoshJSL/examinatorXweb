<%@page import="entidades.persona"%>
<%@page import="entidades.validaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%
   HttpSession sesX= request.getSession();
    String id=(String)sesX.getAttribute("id");
    String msj="";
    String clave=request.getParameter("clave")==null?"":request.getParameter("clave");
    String contra=request.getParameter("contra")==null?"":request.getParameter("contra");
    String btn=request.getParameter("Iniciar")==null?"":request.getParameter("Iniciar");
    if(id!=null){
        sesX.invalidate();
    }else{
        validaciones val=new validaciones();
        if(!btn.equals("")){
            if(!clave.equals("")&&!contra.equals("")){
                if(val.num(clave)&&val.contra(contra)){
                    persona p=new persona();
                    String ide = p.entra(clave, contra, "profe");
                    if(val.esNum(ide)){
                        sesX.setAttribute("id", ide);
                        response.sendRedirect("Profesor/Index2.jsp");
                    }else{
                        msj="Ups!  "+ide;
                    }
                }else{
                    msj="Campos inválidos: ";
                    msj+=val.num(clave)?" Clave ":"";
                    msj+=val.contra(contra)?" Contraseña ":"";
                }
            }else{
                msj="Hay campos vacios";
            }
        }
        
    }
%>


<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/estilos_formulario_1.css"  />
<style>
    
    .rec{
        font-size: 20px; 
        color:  white;
    }
    .rec:hover{
        font-weight: bolder;
    }
    
</style>
<script type="text/javascript" src="script/Formulario_1.js">
</script>



	<title>Inicia sesi&oacute;n Profesor</title>
</head>
<body>
    
	<!--ENCABEZADO DE LA PAGINA-->
	<div class="encabezado"> <div align="center"><ul> <li class="tit letra"> Examinator-X </li> </ul></div> </div>


	<br> <br> <br> <br> <br> <br><!--Perdon por los "<br>" :v-->


	<div class="Contenido">
		<div align="center">
			<ul> <li class="inicio letra"> Iniciar sesi&oacute;n </li> </ul>
                        <div class="mensaje"><%=msj%></div>
			<form method="post" action="isProfe.jsp">
			<!---SON LOS CAMPOS DE TEXTO, BOTONES ETC.. -->
                        <div class="campo" ><span class="formi letra">C&oacute;digo: &nbsp;</span>	<input id="Boleta" type="text" name="clave" class="texto" minlength="10" maxlength="10" value="<%=clave%>" onkeypress="validarBol();"></div>
				<!--La clase "formi" sirve para dar tamaÃ±o de letra a el texto del formulario -->
				<!--La classe letra sirve para dar color y fuente se le aplica a la mayoria de texto-->
				<div class="campo" ><span class="formi letra">Contrase&ntilde;a: &nbsp;</span>	<input type="password" name="contra"value="<%=contra%>" class="texto"  ></div>
                                <!--<a href="#" class="rec">¿Olvidaste tu contraseña?</a>-->
				<br> <br>

				<input type="submit" name="Iniciar" value="Iniciar" class="formi letra boton_t1" />
				<br><br><br><br>

				<div class="ncx"><li class="formi letra">¿A&uacute;n no tienes una cuenta?</li> &nbsp;<a href="registroProfe.jsp"> <li class="formi letra boton_t1">Registrate aqu&iacute;</li></a></div>

				<br>

				<a href="selectAluProfe.jsp"><li class="formi letra boton_t1">Regresar</li></a>
                        </form>

		</div>

	</div>
</body>
</html>