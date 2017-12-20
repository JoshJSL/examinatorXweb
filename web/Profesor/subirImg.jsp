<%-- 
    Document   : subir
    Created on : 3/05/2017, 08:49:56 AM
    Author     : Usuario
--%>

<%@page import="entidades.persona"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesX = request.getSession();
    String id = (String) sesX.getAttribute("id");
    persona p= new persona();
    if (id == null) {
        response.sendRedirect("../isProfe.jsp");

    }else{
    p.obten(id, "");
    File file;
    int maxFileSize =7000 * 1024;
    int maxMemSize = 7000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("rutaArchivos");

    // Verify the content type
    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File(filePath));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            
            // Process the uploaded file items
            Iterator i = fileItems.iterator();


            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    
                    // Write the file
                    if (fileName.lastIndexOf(".") >= 0) {
                        file = new File(filePath+p.getClave()+p.getNombre()+p.getApePater()+p.getApeMater()// Aqui!!!!!!!!!!!!
                                + fileName.substring(fileName.lastIndexOf(".")));
                    } else {
                        file = new File(filePath+p.getClave()+p.getNombre()+p.getApePater()+p.getApeMater()
                                + fileName.substring(fileName.lastIndexOf(".") + 1));
                    }
                    
                    fi.write(file);
                    p.setFoto(p.getClave()+p.getNombre()+p.getApePater()+p.getApeMater()+"."+ fileName.substring(fileName.lastIndexOf(".") + 1));
                    p.guardarBD();
                    out.print("<script>location.reload(true);</script>");
                }
            }

        } catch (Exception ex) {

        }
    } else {

        out.println("<script>alert('no se cargo :'C')</script>");

    }
    response.sendRedirect("cuenta.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
