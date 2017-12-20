/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Joshua
 */
public class cMail {
    String _error = "";
    String _para = "";
    String _cuerpoMsj = "";
    String _de = "primesoftmx@gmail.com";
    String _titulo = "";
    
    public cMail()
    {
        
    }
    
    public boolean validaCuenta(String paraMail, String nombre,String _codigo){        
        String mensajibirips=
                "<center><div style=\"width:600px; height:600px; background-color:#F0F3F4;\" >"
                + " <div style=\"width:600px; height:130px; background-color:#3F3F3F;\">"
                + "     <li style=\"list-style:none; color:white; font-size:40px; font-family:arial; padding:45px; letter-spacing:10px;\">PRIMESOFT</li>"
                + " </div>"
                + " <div style=\"background-color:#F0F3F4; width:600px; height:470;\">"
                + "     <li style=\"font-size:30px; font-family:arial; color:#3F3F3F; list-style:none; padding-top:50px;\">Hola "+nombre +"!</li>"
                + "     <li style=\"font-size:20px; font-family:arial; color:#3F3F3F; list-style:none; padding-top:30px;\">Estas a un paso de poder utilizar Examinator-X </li>			<li style=\"font-size:20px; font-family:arial; list-style:none; padding-top:30px;\">Para activar tu cuenda introduce el codigo<br/><br/><span style=\" color:#000; text-decoration:underline;\">"+_codigo+"</span><br/><br/> en la pagina que lo solicita </li>"
         
                + " </div>"
                + "</div></center>";
        
        
        
        return mandaMAil(paraMail, "Confirmar e-mail Examinator-X", mensajibirips);
    }
    
    public boolean recuperaContra(String paraMail, String nombre,String clave){
        
        cMD5 md5=new cMD5();
        String nomClav=md5.md5(nombre+clave);
        
        String mensajibirips=
                "<center><div style=\"width:600px; height:600px; background-color:#F0F3F4;\" >"
                + " <div style=\"width:600px; height:130px; background-color:#3F3F3F;\">"
                + "     <li style=\"list-style:none; color:white; font-size:40px; font-family:arial; padding:45px; letter-spacing:10px;\">PRIMESOFT</li>"
                + " </div>"
                + " <div style=\"background-color:#F0F3F4; width:600px; height:470;\">"
                + "     <li style=\"font-size:30px; font-family:arial; color:#3F3F3F; list-style:none; padding-top:50px;\">Hola"+nombre +"!</li>"
                + "     <li style=\"font-size:20px; font-family:arial; color:#3F3F3F; list-style:none; padding-top:30px;\">Solicitaste un cambio de contraseña</li>			<li style=\"font-size:20px; font-family:arial; color:#3F3F3F; list-style:none; padding-top:30px;\">Para continuar da click en el siguiente enlace</li>"
                + "	<a href=\"http://localhost:8080/Examiteitor-x_primeSoft/confirma.jsp?ndupcm="+nomClav+"\" style=\"text-decoration:none; \"><li style=\"font-size:30px; font-family:arial; color:#D35400; list-style:none; padding-top:150px; letter-spacing:5px; border-radius: 5px;border: solid #D35400 5px;\">ACTIVAR</li></a>"
                + " </div>"
                + "</div></center>";
        
        
        
        return mandaMAil(paraMail, "Confirmar e-mail Examinator-X", mensajibirips);
    }
    
    public boolean mandaMAil(String Para, String Titulo, String Msj)
    {
        
        
        
        
        
        boolean envio = false;
        this._titulo = Titulo;
        this._para  = Para;
        this._cuerpoMsj = Msj;
        
        try
        {
            
            // Configuracion de la cuenta de envio de mail
            Properties confMail = new Properties();
            confMail.setProperty("mail.smtp.host", "smtp.gmail.com");
            confMail.setProperty("mail.smtp.starttls.enable", "true");
            confMail.setProperty("mail.smtp.port", "587");
            confMail.setProperty("mail.smtp.user", "mail@gmail.com");
            confMail.setProperty("mail.smtp.auth", "true");
            // Sesion
            Session session = Session.getDefaultInstance(confMail);
            // Creamos el MAil
            MimeMessage correo = new MimeMessage(session);
            correo.setFrom(new InternetAddress(this._de));
            correo.addRecipient(Message.RecipientType.TO, new InternetAddress(this._para));
            correo.setSubject(this._titulo);
            correo.setContent(this._cuerpoMsj,"text/html");

            // Enviamos MAil .
            Transport t = session.getTransport("smtp");
            t.connect("primesoftmx@gmail.com", "qaswedfr12");
            t.sendMessage(correo, correo.getAllRecipients());

            // Cerramos conexion.
            t.close();
            envio = true;
        }
        catch (Exception e)
        {
            
            this._error = e.getMessage();
        }
        return envio;
        
        
        
    }
    
    public String confirma(String _correo){
        return"<div class=\"Contenido\">\n" +
"	<li class=\"subt\">¡Enhorabuena bienvenido a Examinator-X!</li>\n" +
"	<li class=\"instruc\">Hemos enviado un e-mail de confirmación a: "+_correo+"</li>\n" +
                "<li class=\"instruc\">Introduce la clave proporcionada en e-mail </li>\n" +
                "<li class=\"instruc\" id=\"error\" style=\"display:none;\" >Ups! codigo incorrecto</li>\n" +
"	<form method=\"post\">\n" +
"		<center><input type=\"text\" name=\"clave\" class=\"Inpt\" placeholder=\"# # # # # # # # # # # #\"></center>\n" +
                "<center><input type=\"submit\" name=\"btn\" class=\"Inpt\" value=\"Aceptar\"></center>\n" +
"	</form>\n" +
"		<br> " +
"	  <center><a class=\"first after \" href=\"#\" onclick=\"location.reload();\" class=\"first after\" name=\"btn\">Volver a enviar el correo</a></center>\n" +
"	</div>";
    }
    
    public String cambia(){
        return"<div class=\"Contenido\">\n" +
"	<li class=\"subt\">Cambiar contraseña Examinator-X</li>\n" +
"	<li class=\"instruc\">Te hemos enviado un e-mail de autenticación a tu correo </li>\n" +
                "<li class=\"instruc\">Introduce la clave proporcionada en e-mail </li>\n" +
                "<li class=\"instruc\" id=\"error\" style=\"display:none;\">Ups! codigo incorrecto</li>\n" +
"	<form method=\"post\">\n" +
"		<center><input type=\"text\" name=\"clave\" class=\"Inpt\" placeholder=\"# # # # # # # # # # # #\"></center>\n" +
                "<center><input type=\"submit\" name=\"btn\" class=\"Inpt\" value=\"Aceptar\"></center>\n" +
"	</form>\n" +
"		<br> " +
"	  <center><a class=\"first after \" href=\"#\" onclick=\"location.reload();\" class=\"first after\" name=\"btn\">Volver a enviar el correo</a></center>\n" +
"	</div>";
    }
}
