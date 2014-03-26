<%-- 
    Document   : signup
    Created on : Mar 9, 2014, 10:07:32 AM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="helvetica.css">
<nav>
    <ul>
<li><a href="student.jsp" title="student">Student </a> </li>
<li  class="active"><a href="studentsignup.jsp" title="studensignupt">Student request </a> </li>
<li><a href="faculty.jsp" title="faculty"> Faculty </a> </li>
<li><a href="facsignup.jsp" title="faculty signup requests">Faculty request </a> </li> 
<li><a href="fileup.jsp" title="faculty"> File Upload </a>   </li>
<li><a href="filedel.jsp" title="faculty"> File Delete </a>  </li>
<li><a href="forum.jsp" title="faculty"> Forum </a> </li>
<li><a href="main.html" title="logout"><font size="3">Logout<font></a></li>

    </ul>
</nav>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student</title>

</head>
<body>
<form action="studentsignup.jsp"  method="post" >

<br>
<br>
<table border=0 cellspacing=0 cellpadding=0 width="55%">
    <tr><td >username:<input type="text" value="" name="user"></td></tr>
            <tr><td><input type="submit" value="DELETE" ></td></tr>
</table>
<center>
<table  width="960" border="1" cellpadding="0" cellspacing="4">
 <%
  int count=1;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
		Statement s= c.createStatement();
		String sql="select * from studentsignup ";
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
		
		String user=request.getParameter("user");
		String sql1;
		if(user!=null)
		{	
			sql1="select * from studentsignup where user='"+user+"' ";
			ResultSet rs1= s.executeQuery(sql1);
			rs1.next();
			out.println("user :  "+user);
			sql1="insert into student values('"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"','"+rs1.getString(6)+"' )"; 
			s.execute(sql1);
		
			sql="delete from studentsignup where user='"+user+"'";
			s.execute(sql);
			rs1.close();
		}
			
		
		s.close();
		c.close();
		}catch(Exception e) {  out.println(e);}
%>
</td>
</tr>
</table> 
</center>
</form>
</body>
</html>

