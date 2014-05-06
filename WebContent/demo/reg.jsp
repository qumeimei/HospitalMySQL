<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="green.jpg">

  <script type="text/javascript">
	
		function checkInput(){
			var ousername= document.getElementById("cname");
			var opwd = document.getElementById("cpwd");
			var opwd2 = document.getElementById("cpwd2");
			var oemail = document.getElementById("email");
			var orole = document.getElementById("urole")
			if(ousername && opwd && opwd2 && oemail && orole){
				if(ousername.value==""){
				alert("username can not be blank!");
				ousername.focus();
				return false;}
			
				else if(opwd.value==""){
				alert("password can not be blank!");
				ousername.focus();
				return false;}

				else if(opwd.value!=opwd2.value){
				alert("passwords are not the same!");
				opwd.focus();
				return false;
				}
				
				else if(oemail.value==""){
					alert("email cannot be blank!");
					omail.focus();
					return false;
					}
				
				else if(orole.value=="default"){
					alert("You need to choose a role!");
					opwd.focus();
					return false;
					}
				
				else {return ture;}
			}
			else {
				return false;}
		}	
	</script>
	 <h1>New York Health Care Registration </h1>

  
      <%--jsp comments --%>
   
  
   <div>
<img src="log.jpg" height="60%" width="100%" />
</div>
    <form name="form1" method="post" action="action/do_reg.jsp" onsubmit="return checkInput()">
		<table border="0" align="center">
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="cname" id="cname">
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="cpwd" id="cpwd"></td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td><input type="password" name="cpwd2" id="cpwd2"></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
				<tr>
				<td>Role</td>
				<td><select name="urole" id="urole">
					    <option value="default">choose one</option>
						<option value="e_doctor">doctor</option>
						<option value="e_nurse">nurse</option>
						<option value="e_patient">patient</option>
				</select>
				</td>
			</tr>
		
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="submit" value="submit reg"/>
					<input type="reset" value="reset1"/>
					<a href = "javascript:history.go(-1)" >Return</a>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
