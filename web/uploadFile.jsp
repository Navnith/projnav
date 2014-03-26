<%-- 
    Document   : uploadFile
    Created on : Mar 19, 2014, 3:08:16 PM
    Author     : eNVious
--%> 

<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<%
    String item1=null,item2=null;
    boolean isMultipart=ServletFileUpload.isMultipartContent(request);
    if(isMultipart){
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    try
    {
    List items=null;
    
    items=upload.parseRequest(request);
    Iterator iter=items.iterator();
    while(iter.hasNext())
    {
         
           FileItem item=(FileItem)iter.next();
           if(item.isFormField())
           {
               if(item.getFieldName().equals("subject")){ 
                    item1=item.getString();}
                if(item.getFieldName().equals("ppt")){ 
                    item2=item.getString(); }
                
           }
                else{
                try  {  
                
                    String filename=item.getName();
                
                File uploadedFile=new File("C:/Users/eNVious/Documents/NetBeansProjects/Project1/web/video/"+filename);
                item.write(uploadedFile);
                Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/virclass";
PreparedStatement psmnt = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "envious");
psmnt = connection.prepareStatement("insert into video(subject,ppt,filepath) values(?,?,?)");
psmnt.setString(1, item1);
psmnt.setString(2, item2);
psmnt.setString(3, uploadedFile.getPath());
int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();

}
           }
    }
    }
    catch(FileUploadException e)
    {
        e.printStackTrace();
    }catch(Exception e)
    {
        e.printStackTrace();
    }
    }
    else{
    }
                
                
   
/*
  String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File("C:/Users/eNVious/Documents/NetBeansProjects/Project1/web/video/"+saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
*/
%>
<link rel="stylesheet" type="text/css" href="helvetica.css">
<br><center>
    <table border="0">
        <tr>
            <td><b>You have successfully upload the file</b>
            </td>
        </tr>
        <tr>
            <td>
                Click <a href="fileup.jsp">HERE</a> to upload another file.
                </td>
        </tr>
    </table>
</center>
<%
/*
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/virclass";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "envious");
psmnt = connection.prepareStatement("insert into video(subject,ppt,filepath) values(?,?,?)");
psmnt.setString(1, item1);
psmnt.setString(2, item2);
psmnt.setString(3, file);
int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}

}
*/
%>

