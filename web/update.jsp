<%-- 
    Document   : update
    Created on : Mar 11, 2014, 10:54:04 AM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Student Details</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">
<nav>
    <ul>
<li><a href="profile.jsp" title="Home">Profile </a> </li> 
<li  class="active"><a href="update.jsp" title="update"> Edit Profile </a></li>
<li><a href="studfiledown.jsp" title="Download Files">Download PPT/Video</a> </li>
<li><a href="forum.jsp" title="ask">Forum</a></li> 
<li><a href="main.html" title="logout"><font size="3">Logout<font></a></li>
</ul>
    </nav>
</head>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body> 
    <br>
    <br>
<form  action="update.jsp" method="post" >


<%
String name=request.getParameter("name");
String username=request.getParameter("username");
String pas=request.getParameter("pass");

String branch=request.getParameter("branch");
String year=request.getParameter("year");
String phno=request.getParameter("ph_no");
/*out.println("branch = "+branch+" and year = "+year);*/
String user =(String)session.getAttribute("user");
try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
		Statement s= c.createStatement();
		String sql="select * from student where user='"+user+"'";
		ResultSet rs= s.executeQuery(sql);
		rs.next();
		

%>


<center>
        <table cellpadding=2 cellspacing=0 border=0 width=80%>
            <tr>   
                <td align=center style="padding:2;padding-bottom:2">
                       <b><font size="25"> Edit Profile</font></b>
            
            </td>
            </tr>

           </table>

                                <table cellpadding=0 cellspacing=0 border=0 width=60%>   
                                    <tr>
                                        
                                        <td bgcolor="white" align=center style="padding:2;padding-bottom:4"> 
                    
                                            <b>Personal info</b>
	
                                            <center>
                                                <table>
	
                                                    <tr><td> Name:</font></td>  <td>  <input type="text" name="name" value="<% out.println(rs.getString(3)); %>">  </td>  </tr>
	
	
                                                    <tr><td>   User_name:</font></td>  <td>   <input type="text" name="username" value="<% out.println(rs.getString(1)); %>">  </td>  </tr>
	
	
                                                    <tr><td>  Password:</font></td>  <td>   <input type="text" name="pass" value="<% out.println(rs.getString(2)); %>">  </td>  </tr>
	

	
                                                    <tr><td> Branch:</font></td>   <td><select name="branch">
									<option value="IT">IT</option> 
									<option value="MECH">MECH</option>
									<option value="CSE">CSE</option>
									<option value="EEE">EEE</option>
									</select></td></tr>
		
	
                                                    <tr><td>Year:</td>   <td><select name="year">
									<option value="I">I</option> 
									<option value="II">II</option>
									<option value="III">III</option>
									<option value="IV">IV</option>
									</select></td></tr>
		
	
                                                    <tr><td>  Contact No:</td>  <td>   <input type="text" name="ph_no" value="<% out.println(rs.getString(4)); %>">  </td>  </tr>
	
        
                                                    <tr><td>&nbsp;</td><td><input type="submit" value="UPDATE"></td></tr>
	
                                               </table></center>
</td></tr>
                                    </table>
                      
<%		
String str1=request.getParameter("username");
String sql1="update student set user='"+username+"',pass='"+pas+"',name='"+name+"',ph_no='"+phno+"',year='"+year+"',branch='"+branch+"' where user='"+user+"'"; 

s.execute(sql1);
session.setAttribute("user",str1);
	%>
		<jsp:forward page="profile.jsp" />
	<%

    
		
			s.close();
		c.close();
	}
	catch(Exception e) {  }


 %>

</center>
</form>


</body>
</html>

