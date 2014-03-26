<%-- 
    Document   : studlogin.jsp
    Created on : Mar 8, 2014, 9:47:57 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Login</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">
 <nav>
            <ul>
                <li><a href="main.html">Home</a></li>
                <li   class="active"><a href="studlogin.jsp">Student Login</a></li>
                <li><a href="faclogin.jsp">Faculty Login</a></li>
                <li><a href="main.jsp">Admin Login</a></li>
                 <li><a href="#">Contact</a></li>
        
            </ul>
        </nav>

</head>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>

<body>

<form action="studlogin.jsp"  method="post" >
<TABLE border=0 cellspacing=2 cellpadding=2 width="100%"> 
<TR> 
   <TD> 
	<table cellpadding=2 cellspacing=0 border=0> 
  
                    <tr>   <td bgcolor="white" align="center" style="padding:2px;padding-bottom:4px">  
                            <b><font size=7 color="#ccc" face="Corbel">STUDENT LOGIN</font></b></tr> 
	<tr><td bgcolor="white">
                <TABLE border=0 cellspacing=2 cellpadding=2 width="80%" bgcolor="white">
		
		<tr><td>Login:</td>    <td><input type="text" name="login" value=""></td></tr>
		<tr><td>Password:</td>   <td><input type="password" name="password1"></td></tr>
		<tr><td>&nbsp;</td>    <td><input type="submit" value="ENTER"></td></tr>
		<tr><td colspan=2>&nbsp;</td>    </tr>
		<tr><td colspan=2>Lost your username or password? Find it <a href="#">here</a>!</td></tr>
                <tr><td colspan=2>Not member yet? Click <a href="ssignup.jsp">HERE</a>    to register.</font></td></tr>

	  
     	</TABLE> 
  		 </TD>
                  </TR>
		</table>
 
     
  	 </TD> 
	</TR> 
</TABLE> 




<%

String str1=request.getParameter("login");
String str2=request.getParameter("password1");
if(str1!=null && str2!= null)
{
	int flag=0;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
		Statement s= c.createStatement();
		out.println("user="+str1+" and pass= "+str2);
		String sql="select user from student where user='"+str1+"' and pass='"+str2+"'";
			ResultSet rs= s.executeQuery(sql);
			if(rs.next())
				flag=1;
			else
				flag=0;
			
			if(flag==1)
			{
					session.setAttribute("user",str1);
					%>
					<jsp:forward page="profile.jsp" />
					<%
			}
			else
					out.println("UserName/Password Not Valid");	
		rs.close();
		s.close();
		c.close();
		}catch(Exception e) {  out.println(e);}
}

 




%>
</form>
</body>
</html>
