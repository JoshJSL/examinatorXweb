<%@page import="entidades.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<%
    
    HttpSession sesX= request.getSession();
    String id=(String)sesX.getAttribute("id");
    String nombre="";   
    String foto="";   
    if(id==null){
        response.sendRedirect("../isAlumno.jsp");
    }else{
        persona p= new persona();
        p.obten(id, "");
        nombre=p.getNomCompleto();
        foto+=p.getFoto();
    }

%>
<html>
<head>
	<title>Examinator X</title>
	<meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../css/estilo_profe.css">
	<style type="text/css">

		
        .conte
	{
		width:400px;
		height: 400px;
		background-color:rgba(0,0,0,0);
		overflow:hidden;
		border-bottom:solid 1px rgb(147, 147, 147);
	}
	.circu
	{

	}
	@keyframes animacion 
	 {
    0%   {transform:translate(0px,400px)}

    100% {transform:translate(0px,100px)}
	}
	.bienvenida
	{
		list-style:none;
		font-size:50px;
		font-family:arial;
		padding-top:50px;
	}
	img
	{
		border-radius:50%;
		border: solid 10px rgba(0,0,0,0.8);	
		transform:translate(0px,400px);
		 animation-duration: 1s;
		 animation-name: animacion;
		 animation-iteration-count: 1;
		 animation-fill-mode: forwards;
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
	<div >
		<center>
			<div class="conte">
				<center><div class="circu">
                                        <img style="width: 200px;" alt="Fotografia Alumno" src="<%=foto%>">
				</div></center>
			</div>
                    <ul>
			<li class="bienvenida">Hola alumno <%=nombre%>!
                            
                        
                        </li>
                    </ul>
		</center>

	</div>
</body>
</html>