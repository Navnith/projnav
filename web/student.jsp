<%-- 
    Document   : student
    Created on : Mar 20, 2014, 2:30:34 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Details</title>
        <link rel="stylesheet" type="text/css" href="helvetica.css">
<nav>
    <ul>
<li class="active"><a href="student.jsp" title="student">Student </a> </li>
<li ><a href="studentsignup.jsp" title="studensignupt">Student req </a> </li>
<li><a href="faculty.jsp" title="faculty"> Faculty </a> </li>
<li><a href="facsignup.jsp" title="faculty signup requests">Faculty req </a> </li> 
<li><a href="pptup.jsp" title="faculty"> PPT(upload) </a> </li> 
<li><a href="pptdel.jsp" title="faculty"> PPT(del) </a> </li>
<li><a href="videoup.jsp" title="faculty"> Video(up) </a>  </li>
<li><a href="videodel.jsp" title="faculty"> Video(del) </a>  </li>
<li><a href="que1.jsp" title="faculty"> Question </a> </li>
<li><a href="ans1.jsp" title="faculty"> Answer </a> </li>
<li><a href="main.jsp" title="logout"><font size="3">Logout</font></a></li>

    </ul>
</nav>
    <br><br>
    </head>

    <SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
    <body>
    <form action="studentsignup.jsp"  method="post" >
        <center><table  width="960" border="1" cellpadding="0" cellspacing="4">
        <%
       try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
		Statement s= c.createStatement();
		String sql="select * from student";
			ResultSet rs= s.executeQuery(sql);
%>
<tr><td><b>USERNAME</b><td><b>PASSWORD</b><td><b>NAME</b><td><b>PHONE NO</b><td><b>YEAR</b><td><b>BRANCH</b> 
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
%>
<td>
<%					
		
					out.println(rs.getString(3));
%>
<td>
<%					

					out.println(rs.getString(4));
%>
<td>
<%					
		
					out.println(rs.getString(5));
%>
<td>
<%					

					out.println(rs.getString(6));
					
					
			}	
		rs.close();
       }
       catch(Exception e)
       {
                e.printStackTrace();
       }
%>		
</table>    
</center>
</form>
    </body>
</html>
