<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesX= request.getSession();
    String id=(String)sesX.getAttribute("id");
    if(id!=null){
        out.print("<script>window.history.back();</script>");
    }


%>



<!DOCTYPE html>


<html>
<head>
<meta charset="utf-8">
<script type="text/javascript">
	//Aqui va el codigo amiguitos
</script>

<link rel="stylesheet" type="text/css" href="css/estilos_formulario_1.css">


	<title>Seleccion de perfil</title>
</head>
<body>

	<div class="encabezado"> <div align="center"><ul> <li class="tit letra"> Examinator-X </li> </ul></div> </div>


	<br> <br> <br> <br> <br> <br>

	<a href="isProfe.jsp">
		<div class="T_or_S">
			<div align="center">
				<span class="letra inicio">Profesor </span>
			</div>
		</div>
	</a>

	<a href="isAlumno.jsp">
		<div class="T_or_S">
			<div align="center">
				<span class="letra inicio">Alumno</span>
			</div>	
		</div>
	</a>
</body>
</html>