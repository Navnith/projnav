<%-- 
    Document   : fsignup
    Created on : Mar 14, 2014, 7:39:25 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" buffer="100kb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Yourself</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">
<center><p><font face="helvetica" color="#ccc" size="3">Click <a href="main.html">here</a> to redirect to home page</font></p></center>
</head>
<body>


<script language="javascript">
function fu(form)
{
	 alert('A request is sent to the admin to approve your signup ');
}
	function fun1(form)
	{

	var l=form.pass.value.length;

	for(var i=0; i < l ; i++)
	{
		if(form.pass1.value.substr(i,1) != form.pass.value.substr(i,1) )
		{
			form.pass.value="";
			form.pass1.value="";
			alert('Passwords Not Equal');
			break;
		}
	
	}
	}

function fun2(form)
	{

	var l=form.phno.value.length;
	for(var i=0; i < l ; i++)
	{
		if( (form.phno.value.substr(i,1)>= 'a' && form.phno.value.substr(i,1)>= 'z'  ) ||(form.phno.value.substr(i,1)>= 'A' && form.phno.value.substr(i,1)>= 'Z'  ) )
		{
			form.pass.value="";
			form.pass1.value="";
			alert('invalid phone no.');
			break;
		}
	
	}
	}

		
</script>
<form action="fsignup.jsp" method="post" >

<table align="center" cellpadding=2 cellspacing=0 border=0 width=80%>


<tr>  <td><table align="center" cellpadding=0 cellspacing=0 border=0 width=100%>   
            <tr>   <td align="center" style="padding:2;padding-bottom:4">  <font size="5"><b>Faculty Sign Up</b></font></tr>
<tr><td bgcolor="white" style="padding:5">
<center><table align="center">
	<tr><td> Name:</td>  <td>  <input type="text" name="name" value="">  </td>  </tr>
	
	<tr><td>  User Name:</td>  <td>   <input type="text" name="username" value="" > </td>  </tr>
	
	<tr><td>   Password:</td>  <td>   <input type="password" name="pass" value="">  </td>  </tr>
	
	<tr><td> Confirm Password:</td>  <td>   <input type="password" name="pass1" value="">  </td>  </tr>
	<tr><td> Contact Number:</td>  <td>   <input type="text" name="phno" value="" onblur="fun1(this.form);">  </td>  </tr>
	
	<tr><td>  Subject:</td> <td>   <input type="text" name="subject" value="" onblur="fun2(this.form);">  </td>  </tr>
	
	<tr><td>   Branch:</td>   <td><select name="branch" >
									<option value="IT">IT</option> 
									<option value="MECH">MECH</option>
									<option value="EEE">EEE</option>
									<option value="CSE">CSE</option>
									</select></td></tr>
		
    
	
	
	<tr><td>&nbsp;</td><td><input type="submit" value="REGISTER" onclick="fu(this.form);" ></td></tr>
	
</table></center>



</td></tr></table></td></tr></table>
 

<%

String name=request.getParameter("name");
String username=request.getParameter("username");
String pas=request.getParameter("pass");
String pas1=request.getParameter("pass1");
String branch=request.getParameter("branch");
String subject=request.getParameter("subject");
String phno=request.getParameter("phno");
  

	  

	try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
			Statement s= c.createStatement();
			String sql="insert into facultysignup values('"+username+"','"+pas+"','"+name+"','"+phno+"','"+subject+"','"+branch+"' )"; 
			
			if(name!=""&&name!=null)
			{
			s.execute(sql);
			}
			s.close();
			c.close();
			}
			catch(Exception e) {}



%>


</form>

</body>
</html>
