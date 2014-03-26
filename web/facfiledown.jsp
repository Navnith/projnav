<%-- 
    Document   : sub1
    Created on : Mar 14, 2014, 5:48:04 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download PPT/Video</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">
<nav>
    <ul>
<li><a href="facprofile.jsp" title="Home">Profile </a> </li> 
<li><a href="facupdate.jsp" title="update"> Edit Profile </a> </li> 
<li  class="active"><a href="facfiledown.jsp" title="Download Files">Download PPT/Video</a> </li>
<li><a href="fileup.jsp" title="Upload Files">Upload PPT/Video</a> </li>
<li><a href="forum.jsp" title="ask">Forum</a></li> 
<li><a href="main.html" title="logout"><font size="3">Logout<font></a></li>
<</ul>
    </nav>
</head>
<body> 
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<form action="facfiledown.jsp" method="post" >
    <table border=0 cellspacing=0 cellpadding=0 width="55%">
    <tr>
        <td>ENTER SUBJECT : </td>
            <td>
            <select name="subject">
	<option value="OS">OS</option> 
        <option value="DAA">DAA</option>
        <option value="EEE">EEE</option>
	<option value="JAVA">JAVA</option>
            </select></td></tr>
           <tr>
               <td>
                    <input type="submit" value="SUBMIT">
                </td>
           </tr> 
             </table>
   
<%
    String subject=request.getParameter("subject");
    int length=0;
try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c1= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","1234");
		Statement s1= c1.createStatement();
String sql2="select ppt,filepath from video where subject='"+subject+"'";
ResultSet rs1= s1.executeQuery(sql2);
out.println("<table border=0 cellspacing=0 cellpadding=0 width=55>");
 while(rs1.next())
 {
    out.println("<tr><td><a href=\"download.jsp?f="+rs1.getString(2)+"\">"+rs1.getString(1)+"</a></td></tr>");
 }
%> 

<%
 out.println("</table>");
		rs1.close();
		s1.close();
		c1.close();
}	
	catch(Exception e) { }
%>
    </table>
</form>
</body>
</html>

 