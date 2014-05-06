<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%@page import = "edu.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	List<Users> list = new ArrayList<Users>();
	List<String> left = new ArrayList<String>();
	String role = null;
	String username = request.getParameter("uname");
	String password =  request.getParameter("pwd");
	System.out.println("welcoom"+username);
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver successful");
	} catch (Exception e1) {
		System.out.println("driver failed! because: " + e1.getMessage());
	}
	try {
		conn = DriverManager
		//.getConnection("jdbc:oracle:thin:zw2220/wangzihan@//w4111b.cs.columbia.edu:1521/ADB");
		.getConnection("jdbc:oracle:thin:jg3421/admin@localhost");
		System.out.println("connect success!!");
		
		st = conn.createStatement();
		String sql_format = "select * from e_users where name='%s' and password='%s'";
		
		String sql = String.format(sql_format, username, password);
	
		rs =st.executeQuery(sql);
		if (rs != null&&rs.next()) {
			System.out.println("1!" + rs);

			Users user = new Users();
			//System.out.println(rs.getInt(1));
			System.out.println(rs.getString(4));
			user.setUserid(rs.getInt(1));
			user.setEmail(rs.getString(2));
			user.setUsername(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setBirthday(rs.getString(5));
			user.setGender(rs.getString(6));
			user.setAddress(rs.getString(7));
			user.setZipcode(rs.getInt(8));
			user.setPhone(rs.getString(9));
			
			list.add(user);
			System.out.println("welcomm"+list.size());
		}
		else{
			out.print("statement cannot get in welcome page");
			out.println("<p><a href='javascript:history.go(-1)' >RETURN</a></p>");
		}
		
	} catch (SQLException e1) {
		e1.printStackTrace();
		System.out.println("connect failed!");
	} finally {
		if (rs != null)
			rs.close();
		if (st != null)
			st.close();
		if (conn != null)
			conn.close();
	}
  	Users user = list.get(0);
 %>


<html>
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
	     
	     function info(id){
		        var form_id = "first_form_"+id;
		        var oForm = document.getElementById(form_id);
		        if (oForm){
		           oForm.submit();
		        } 
		     }
	     
	      function update(id){
	        var form_id = "second_form_"+id;
	        var oForm = document.getElementById(form_id);
	        if (oForm){
	           oForm.submit();
	        } 
	     }
	      function update2(id){
		        var form_id = "third_form_"+id;
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

  </head>
  
  <body>
  <% 
  	String table = request.getParameter("urole");
  	
  	if (table.equals("e_users")){
		role = "Administrator";
		left.add("Information");
		left.add("Update_User");
		left.add("Add_User");
	}
	else if (table.equals("e_doctor")){
		role = "Doctor";
		left.add("Update");
		left.add("Patient");
		left.add("Prescription");
	}
	else if (table.equals("e_nurse")){
		role = "Nurse";
		left.add("Update");
		left.add("Patient");
		left.add("Schedule");
	}
	else {
		role = "Patient";
		left.add("Upadate");
		left.add("MedicalHistory");
		left.add("Bill");
	}
  	
  	String page1 = table+left.get(0);
  	String page2 = table+left.get(1);
  	String page3 = table+left.get(2);
  %>


	<div id="header">
		<div id="welcome">Welcome to Hospital Management
		<img src="doc.jpg" height="400%" width="100%" /></div>

	</div>
	<br>
	<div id="admin_bar">
		<div id="status">
			name&nbsp;:&nbsp;<%=user.getUsername() %>&nbsp;
			<a href = "javascript:history.go(-1)" >Return</a>
			<form id="logout_form_<%=user.getUserid() %>" action="../logout.jsp" method="post">
			 <a href="javascript:void(0)" onClick="logout(<%=user.getUserid()%>)">logout</a>
			 <input type="hidden" name="uname" value="<%=user.getUsername() %>"/>
			 <input type="hidden" name="uid" value="<%=user.getUserid() %>"/>
			 </form>
		</div>
		<div id="channel"></div>
	</div>
	<div id="main">
		<div id="opt_list">
			<ul>
				<li><form id="first_form_<%=user.getUserid()%>"
						action="../admin/Update.jsp" method="post">
						<a href="javascript:void(0)" onClick="info(<%=user.getUserid()%>)"><%=left.get(0)%></a> 
						<input type="hidden" name="uname" value="<%=user.getUsername()%>" /> 
						<input type="hidden" name="pwd" value="<%=user.getPassword()%>" />
						<input type="hidden" name="urole" value="<%=table%>"/>
						<input type="hidden" name="contact_id" value="<%=user.getUserid() %>"/>
					</form></li>
				<li><form id="second_form_<%=user.getUserid()%>"
							action="../action/<%=page2 %>.jsp" method="post">
						<a href="javascript:void(0)" onClick="update(<%=user.getUserid()%>)"><%=left.get(1)%></a> 
						<input type="hidden" name="uname" value="<%=user.getUsername()%>" /> 
						<input type="hidden" name="pwd" value="<%=user.getPassword()%>" />
						<input type="hidden" name="uid" value="<%=user.getUserid() %>"/>
						<input type="hidden" name="urole" value="<%=table%>"/>
					
				</form></li>
				<li><form id="third_form_<%=user.getUserid()%>"
						action="../action/<%=page3 %>.jsp" method="post">
						<a href="javascript:void(0)" onClick="update2(<%=user.getUserid()%>)"><%=left.get(2)%></a> 
						<input type="hidden" name="uname" value="<%=user.getUsername()%>" /> 
						<input type="hidden" name="upwd" value="<%=user.getPassword()%>" />
						<input type="hidden" name="uid" value="<%=user.getUserid() %>"/>
						<input type="hidden" name="urole" value="<%=table%>"/>
				</form></li>

			</ul>
		</div>
		
		
		<div id="opt_area">
			<h1 id="opt_type">Personal Information:</h1>

			<table width="500" border="1" cellspacing="2" cellpadding="2">
				<tr>
					<td width="95">Role</td>
					<td width="385"><%=role %></td>
				</tr>
				<tr>
					<td width="95">ID</td>
					<td width="385"><%=user.getUserid() %></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><%=user.getUsername() %></td>
				</tr>
				<tr>
					<td>Birthday</td>
					<td><%=user.getBirthday() %></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><%=user.getGender() %></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><%=user.getAddress() %></td>
				</tr>
				<tr>
					<td>Zipcode</td>
					<td><%=user.getZipcode() %></td>
				</tr>
				<tr>
					<td>Phone</td>
					<td><%=user.getPhone() %></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="site_link">
		<a href="http://www.cs.columbia.edu/~biliris/4111/index.htm">About us: COMS4111 Fall 2013,Columbia University in the city of New York</a>
	</div>
	<div id="footer">
		<p class="">
			24/7 contact: 010-68988888 &#160;&#160;&#160;&#160; <a href="#">regular
				info</a> &#160;&#160;&#160;&#160; contact email:<a href="#">jg3421@columbia.edu</a>
		</p>
		<p class="copyright">
			Copyright &copy; 2013-2014 coms w4111, All Right Reserver<br />
	</div>

</body>
</html>
