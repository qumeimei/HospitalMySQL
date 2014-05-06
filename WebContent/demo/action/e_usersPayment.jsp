<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String username = request.getParameter("uname");

%>

<html>
<script type="text/javascript">
function del(id){
   if (!confirm("Are you sure to delete this?")){
      return false;
   }
   var form_id = "del_form_"+id;
   var oForm = document.getElementById(form_id);
   if (oForm){
      oForm.submit();
   }
   return true;
   
}
 function update(id){
	   var form_id = "update_form_"+id;
	   var oForm = document.getElementById(form_id);
	   if (oForm){
	      oForm.submit();
	   } 
	}

function logout(id){
   var form_id = "logout_form_"+id;
   var oForm = document.getElementById(form_id);
   if (oForm){
      oForm.submit();
   }
   
}
	   </script>

  <head>
    <link href="../../CSS/admin.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'welcome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
  
  <body>
	<div id="header">
		<div id="welcome">Welcome to Hospital Management
		<img src="doc.jpg" height="400%" width="100%" /></div>

	</div>
	<br>
	<div id="admin_bar">
		<div id="status">
			name&nbsp;:&nbsp;<%=username %>&nbsp;
			<a href = "javascript:history.go(-1)" >Return</a>
			
		</div>
		<div id="channel"></div>
	</div>
	<div id="main">
		<div id="opt_list">
			<ul>
				<li><form id="logout_form_10000"
						action="../logout.jsp" method="post">
						<a href="javascript:void(0)"
							onClick="logout(10000)">logout</a> <input
							type="hidden" name="uname" value="<%=username%>" /> <input
							type="hidden" name="uid" value="10000" />
					</form></li>
			</ul>
		</div>
		
		
		<div id="opt_area">
			<h1 id="opt_type">Delete Patient Payment:</h1>

			<form name="formupdate1" method="post"
				action="do_del_patient_payment.jsp" onSubmit="checkInput()">
				<table border="0" align="center">
					<tr>
						<td>Patient Id : </td>
						<td><input type="text" name="p_id" id="p_id"></td>
						<td style="text-align: center"><input type="submit"
							value="delete payment" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="site_link">
		<a href="http://www.cs.columbia.edu/~biliris/4111/index.htm">About us: COMS4111 Fall 2013,Columbia University in the city of New York</a>
	</div>
	<div id="footer">
		<p class="">
			24/7 contact: 010-68988888 &#160;&#160;&#160;&#160; <a href="#">regular
				info</a> &#160;&#160;&#160;&#160; contact email:<a href="#">zw2220@columbia.edu</a>
		</p>
		<p class="copyright">
			Copyright &copy; 2013-2014 coms w4111, All Right Reserver<br />
	</div>

</body>
</html>
