<%-- 
    Document   : profile
    Created on : Mar 9, 2014, 10:07:45 AM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to your Profile</title>
<link rel="stylesheet" type="text/css" href="helvetica2.css">
<nav>
    <ul>
        <li class="active"><a href="profile.jsp" title="Home">Profile </a> </li> 
<li><a href="update.jsp" title="update"> Edit Profile </a></li>
<li><a href="studfiledown.jsp" title="Download Files">Download PPT/Video</a> </li>
<li><a href="forum.jsp" title="ask">Forum</a></li> 
<li><a href="main.html" title="logout"><font size="3">Logout<font></a></li>
    </ul>
    </nav>
<br>
<br><br>
</head>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
 

<form action="profile.jsp"  method="post" >

<%
String user =(String)session.getAttribute("user");



try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/virclass","root","envious");
		Statement s= c.createStatement();
		String sql="select * from student where user='"+user+"'";
	
		/*out.println("branch = "+branch+" and year = "+year);*/
			ResultSet rs= s.executeQuery(sql);
		rs.next();
		

%>
  
      
<div id="card">
  <h2>PROFILE</h2>
  <table border=0 cellspacing=3 cellpadding=2 width="80%" bgcolor="white">
      <tr><td>Logged in as:</td> <td><input type="text" name="user" value="<% out.println(rs.getString(1)); %>"</td> </tr>
         <td> Name:   </td>     <td><input disabled type="text" name="name" value="<% out.println(rs.getString(3)); %>"</td></tr>
  <td>Branch:  </td>    <td><input disabled type="text" name="branch" value="<% out.println(rs.getString(6)); %>"</td></tr>
  <td>Year:     </td>   <td><input disabled type="text" name="year" value="<% out.println(rs.getString(5)); %>"</td></tr> 
  <td>Contact No:  </td> <td><input disabled type="text" name="phno" value="<% out.println(rs.getString(4)); %>"</td></tr>
</table>
</div>

<%		
		
		String branch=rs.getString(6);
		String year=rs.getString(5);
		session.setAttribute("branch",branch);
		session.setAttribute("year",year);
		rs.close();
		s.close();
		c.close();
	}
	catch(Exception e) { out.println(e);  }


 




%>


</form>
</body>
</html>

