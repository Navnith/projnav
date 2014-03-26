<%-- 
    Document   : videodel.jsp
    Created on : Mar 14, 2014, 5:56:03 PM
    Author     : eNVious
--%>

<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PPT/Video Delete</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">
<nav>
    <ul>
<li><a href="student.jsp" title="student">Student </a> </li>
<li><a href="studentsignup.jsp" title="studentsignup>Student req </a>  </li> 
<li><a href="faculty.jsp" title="faculty"> Faculty </a>  </li> 
<li><a href="facsignup.jsp" title="faculty signup requests">Faculty req </a>  </li>
<li><a href="fileup.jsp" title="faculty"> File Upload </a>   </li>
<li class="active"><a href="filedel.jsp" title="faculty"> File Delete </a>  </li>
<li><a href="forum.jsp" title="faculty"> Forum </a> </li>
<li><a href="main.html" title="faculty"> <font size="3">Logout</font> </a> </li>
    </ul>
</nav>
</head>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<br><br>
<body > 

<form action="filedel.jsp"  method="post" >

<table  width="960" border="0" cellpadding="0" cellspacing="4">
<tr>
    <td>
 <b>Video Name   :  </b><input type="text" value="" name="ppt"> &emsp; &emsp; <input type="submit" value="DELETE"   >
 </td></tr>
<center><table  width="960" border="0" cellpadding="0" cellspacing="4" border="1">
<tr>
 <td>

     
 <%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass", "root", "envious");
		Statement s= c.createStatement();
		String sql="select subject,ppt from video";
			ResultSet rs= s.executeQuery(sql);
%>
<tr><td><b>SUBJECT</b><td><b>FILENAME</b> 
<%			
			while( rs.next() )
			{
%>
				<tr><td>
<%					
					out.println(rs.getString(1));
%>
<td>
<%					
		     		out.println(rs.getString(2));

			}	
		rs.close();
		
		String ppt=request.getParameter("ppt");
                String sql2="select filepath from video where ppt='"+ppt+"'";
              
                        ResultSet r=s.executeQuery(sql2);
                        while(r.next())
                        {
                        File f=new File(r.getString(1));
                         f.delete();
                        }
                         r.close();
		if(ppt!=null)
                    {	
                        sql="delete from video where ppt='"+ppt+"'";
			s.execute(sql);
		}
			
		
		s.close();
		c.close();
		}catch(Exception e) {  out.println(e);}
%>
</td>
</tr>
</table> </center>

</form>

</body>
</html>

