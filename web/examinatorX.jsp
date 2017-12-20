<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% 
    
    HttpSession xSEs= request.getSession();
    xSEs.invalidate();

%>


<html>
<head>
	<title>Examinator X</title>
	<meta charset="utf-8">
	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
			font-family: Arial;
		}
		body{
			background-image: -webkit-gradient(
			linear,
			left top,
			left bottom,
			color-stop(0, #CFCFCF),
			color-stop(1, #D4D4D4)
			);
			background-image: -o-linear-gradient(bottom, #CFCFCF 0%, #D4D4D4 100%);
			background-image: -moz-linear-gradient(bottom, #CFCFCF 0%, #D4D4D4 100%);
			background-image: -webkit-linear-gradient(bottom, #CFCFCF 0%, #D4D4D4 100%);
			background-image: -ms-linear-gradient(bottom, #CFCFCF 0%, #D4D4D4 100%);
			background-image: linear-gradient(to bottom, #CFCFCF 0%, #D4D4D4 100%);
		}
		#encabezado{
			width: 100%;
			height: 10%;
			background: rgba(0, 0, 0,0.8); 
			position:relative;
		}

		.contenido
		{

			margin:auto;
			margin-top:60px;
			width:750px;
			height:500px;
			background-color:rgba(0,0,0,0.8);
			box-shadow: 0px 0px 0px 20px rgba(0,0,0,0);
			transition:0.6s;
		}
		.texto
		{
			list-style:none;
			color:white;
			font-family:arial;
			font-size:20px;
			margin-left:15px;
			margin-top:10px;
                        padding: 1% 5% 1% 3.5%;
                        text-align: justify;
		}
		.tit
		{
				font-size:40px;
				padding-top:15px;
					animation-name:fcto;
			animation-duration:4s;

		}
		.letra
		{
			font-family: arial;
			color: white;
			list-style:none;
		}
			.encabezado{
		width:100%;
		height:80px;
		background-color:rgba(15, 15, 15,0.8); 
		
	}
	.emp
	{
		width:150px;
		height:70px;
		background-color:  #56929c ;
		text-align:center;
		margin-top:30PX;

box-shadow: 0px 0px 0px 10px rgba( 133, 146, 158 ,0);
		transition:0.6s;
	}
		.emp:hover
	{
		box-shadow: 0px 0px 0px 0px rgba( 133, 146, 158 ,1);
	}
	.empT
	{
		color:white;
		font-size:18px;
		padding-top:20px;
		font-family:arial;
		list-style: none;

	}
	a:link{
		text-decoration:none;
	}
	</style>
</head>
<body>
<div class="encabezado"> <div align="center"><ul> <li class="tit letra"> Examinator-X </li> </ul></div> </div>

	<div class="contenido">
		
            <img src="img/log.png" alt="Logo Examinator-X" width="750" height="100">
                    <br/>
                    <div class="texto">
			El Software ideal para todo tipo de educación, la forma más sencilla de crear y evaluar Examenes.
			Con Examinator-X el profesor creará su examen ideal para evaluar los conocimientos adquiridos por sus alumnos gracias a una hoja de repuestas la cual será escaneada y evaluada arrojando una calificación y evitar errores al calificar.
			Está unido a la aplicación web (en donde estas ahora) de administración en el cual los profesores podran publicar los resultados y los alumnos podrán consultarlos.
                    </div>
                    <center>
			<a href="selectAluProfe.jsp">
			<div class="emp">
				<ul><li class="empT">Empezar</li></ul>
			</div>
			</a>
			</center>
        </div>
</body>
</html>