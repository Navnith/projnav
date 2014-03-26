<%-- 
    Document   : videoup
    Created on : Mar 14, 2014, 11:43:34 PM
    Author     : eNVious
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Video Upload</title>
<link rel="stylesheet" type="text/css" href="helvetica.css">

<nav>
    
<ul>
    <li><a href="student.jsp" title="student">Student </a>  </li>
    <li><a href="studentsignup.jsp" title="studensignupt">Student request </a> </li>
    <li><a href="faculty.jsp" title="faculty"> Faculty </a>  </li>
    <li><a href="facsignup.jsp" title="faculty signup requests">Faculty request </a> </li>
    <li><a href="facfiledown.jsp" title="Download Files">Download PPT/Video</a> </li>
<li><a href="fileup.jsp" title="Upload Files">Upload PPT/Video</a> </li>
<li><a href="forum.jsp" title="ask">Forum</a></li>
<li><a href="main.jsp" title="faculty"><font size="3">Logout</font> </a> </li> 
</ul>
</nav>
<br><br>
</head>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT> 
   
<body>
    <form action="uploadFile.jsp" method="post" enctype="multipart/form-data" >
<table border=0 cellspacing=0 cellpadding=0 width="55%">
    <tr>
        <td>SUBJECT: </td>
            <td>
            <input type="text" name="subject" value="" font="helvetica" color="#ccc" ></td></tr>
    <tr><td>
            VIDEO NAME :  </td>
            <td><input type="text" name="ppt" value="" font="helvetica" color="#ccc" >
            </td></tr>

    <tr><td>UPLOAD FILE :<td>
            <td><input type="file" name="file" value="CHOOSE FILE" font="helvetica" color="#ccc" ></td></tr>
    <tr><td>
            <input type="submit" value="Upload">
        </td></tr>
</table>
  
        
    

</form>
</body>
</html>


