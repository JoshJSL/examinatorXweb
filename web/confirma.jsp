<%-- 
    Document   : enviaMail
    Created on : 5/05/2017, 08:06:00 PM
    Author     : joshua
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xSes= request.getSession();
    String id=(String)xSes.getAttribute("id");
    String err="";
    String cuerpo="";
    if (id!=null) {
        out.println("<script>window.history.back();</script>");
    }
    String btn=request.getParameter("btn")==null?"":request.getParameter("btn");
    String clave =request.getParameter("mbdp5e")==null?"":request.getParameter("mbdp5e");
    String contra =request.getParameter("5cdomn")==null?"":request.getParameter("5cdomn");
    String queEs =request.getParameter("qecorc")==null?"":request.getParameter("qecorc");
    String cod=request.getParameter("clave")==null?"":request.getParameter("clave");
    entidades.persona p=new entidades.persona();
    entidades.cMD5 md5=new entidades.cMD5();
    entidades.cMail envia= new entidades.cMail();
    Random rnd= new Random();
    String mail="";
    String codigo="";
    
    if(!clave.equals("")&&!contra.equals("")&&!queEs.equals("")){
        p.obten("0", clave);
        mail=p.entra(clave, contra, "");
        codigo=md5.md5(p.getNomCompleto()+clave+(rnd.nextInt(100)+1));
        if(p.confirma("", (p.getId()), 1)){
            out.println("<script>window.history.back();</script>");
        }else{
            if(md5.md5("confirma").equals(queEs)){
                cuerpo =(envia.confirma(mail));
            }
            if(md5.md5("recupera").equals(queEs)){
                cuerpo =(envia.cambia());
            }
            if(btn.equals("")){
                if(md5.md5("confirma").equals(queEs)){

                    p.confirma(codigo, (p.getId()), 0);
                    envia.validaCuenta(mail, p.getNomCompleto(), codigo);
                }else{
                    if(md5.md5("recupera").equals(queEs)){
                    envia.recuperaContra(mail, p.getNomCompleto(), clave);
                    }
                }
            }else{
                if(p.confirma(cod, (p.getId()), 1)){
                    String dodne=request.getParameter("aop")==(4*156)+"" ?"isAlumno.jsp":"isProfe.jsp";
                    response.sendRedirect("selectAluProfe.jsp");
                }else{
                    err=("<script>var erro =document.getElementById('error');"
                            + "erro.style.display='block'"
                            + ""
                            + "</script>");
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
*
{
	padding:0px;
	margin:0px;
}
.encabezado{
	width:100%;
	height:80px;
	background-color:rgba(15, 15, 15,0.8); 
	position:fixed;
}
.Contenido
{

	margin:auto;
	width:900px;
	height: 450px;
	background-color:rgba(15, 15, 15,0.8); 
	-webkit-transition:0.6s;
	-moz-transition:0.6s;
	transition:0.6s;
        font-size: 20px;
}


.Contenido:hover
{
animation-name:formula;
animation-duration:2s;
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
.subt
{
padding-top:10px;
padding-bottom:20px;
list-style:none;
color:white;
font-size:30px;
font-family:arial;
text-align:center;
border-bottom:solid 1px grey;
background-color:#324864;
}
.instruc
{
	list-style:none;
	color:white;
	font-family:arial;
	text-align:center;
	padding-top:20px;
        

}
.Inpt
{
margin-top:40px;
width:700px;
height:50px;
font-size:30px;
letter-spacing:2px;
text-align:center;
}


.wrapper{
  margin:3em 0;
}
a,a:visited,a:hover,a:active{
  -webkit-backface-visibility:hidden;
          backface-visibility:hidden;
	position:relative;
  transition:0.5s color ease;
	text-decoration:none;
	color:#DAF7A6;
	font-size:20px;
}
a:hover{
	color:#80B07E;
}
a.before:before,a.after:after{
  content: "";
  transition:0.5s all ease;
  -webkit-backface-visibility:hidden;
          backface-visibility:hidden;
  position:absolute;
}
a.before:before{
  top:-0.25em;
}
a.after:after{
  bottom:-0.25em;
}
a.before:before,a.after:after{
  height:5px;
  height:0.35rem;
  width:0;
  background:#80B07E;
}
a.first:after{
  left:0;
}
a.before:hover:before,a.after:hover:after{
  width:100%;
}
input[type="submit"]{
    background: rgba(255,255,255,0);
    color: #FFF;
    font-family: arial;
    font-weight: bolder;
    border: solid 3px;
    border-radius: 100px;
}
input[type="submit"]:hover{
   cursor: pointer;
}

</style>
<script type="text/javascript" src="Formulario_1.js">
</script>


	<title>Confirma correo</title>
</head>
<body>
	<!--ENCABEZADO DE LA PAGINA-->
	<div class="encabezado"align="center"><ul> <li class="tit letra"> Examinator-X </li> </ul></div> 


	<br> <br> <br><br> <br> <br> <br> <br> <!--Perdon por los "<br>" :v-->
        
        <%=cuerpo%>
        <%=err%>
    </body>
</html>
