<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>My JSP 'do_reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  

    <div class="title1" id="title1" align="center">
    <h1>Thank you <%=request.getParameter("cname") %> for registering
		Hospital Management System</h1>
		
		</div>
		
	<img src="log.jpg" height="60%" width="100%" />	
		
	<p align="right">
		<a href="../login.jsp">Start Login</a>
	</p>


  </body>
</html>
