<%-- 
    Document   : download.jsp
    Created on : Mar 22, 2014, 8:08:15 PM
    Author     : eNVious
--%>

<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.net.*"%>
<%!
public static String getMimeType(String fileUrl)
throws java.io.IOException, MalformedURLException
{
String type = null;
URL u = new URL(fileUrl);
URLConnection uc = null;
uc = u.openConnection();
type = uc.getContentType();
return type;
}

%>
<%
String file=request.getParameter("f");
File f = new File (file);
String filename=f.getName();
String type=getMimeType("file:"+file);

response.setContentType (type);
response.setHeader ("Content-Disposition", "attachment; filename=\""+filename+"\"");

String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
InputStream in = new FileInputStream(f);
ServletOutputStream outs = response.getOutputStream();

int bit = 256;
int i = 0;
try {
while ((bit) >= 0) {
bit = in.read();
outs.write(bit);
}
} catch (IOException ioe) {
ioe.printStackTrace(System.out);
}
outs.flush();
outs.close();
in.close();
%>
