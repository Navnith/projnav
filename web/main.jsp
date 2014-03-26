<%-- 
    Document   : main
    Created on : Mar 8, 2014, 7:09:51 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="helvetica.css">
        <nav>
            <ul>
                <li><a href="main.html">Home</a></li>
                <li><a href="studlogin.jsp">Student Login</a></li>
                <li><a href="faclogin.jsp">Faculty Login</a></li>
                <li  class="active"><a href="main.jsp">Admin Login</a></li>
                 <li><a href="forum.jsp">Forum</a></li>
                 <li><a href="#">Contact Us</a></li>
        
            </ul>
        </nav>

    </head>
    
    <body>
        <form action="main.jsp"  method="post" >
            <center>
            <table border=0 cellspacing=2 cellpadding=2 width="55%">
                <tr><td></tr></td>
            <tr><td></tr></td> 
             <tr><td></tr></td> 
<tr><td align="center"><font size="7">Admin Login</font></td></tr>
	<tr><td align="center"><input  type="password" value="" name="pass"></td></tr>
	<tr><td align="center" ><input type="submit" value="LOGIN" onclick="fu(this.form);" ></td></tr>	
</table>
           </center>
<%

String pass1=request.getParameter("pass");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
	Statement s= c.createStatement();
 	String sql="select pass from admin";
	ResultSet rs= s.executeQuery(sql);
	rs.next();
	if( pass1.equalsIgnoreCase(rs.getString(1)) )
	{
                %>
		<jsp:forward page="admin.jsp"></jsp:forward>
		<%
	}
	rs.close();
	s.close();
	c.close();
	}
	catch(Exception e) {}
%>
</form>

        <script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
    </body>
</html>
