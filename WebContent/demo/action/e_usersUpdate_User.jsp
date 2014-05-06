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
	String password = request.getParameter("pwd");
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver successful");
	} catch (Exception e1) {
		System.out.println("driver failed! because: " + e1.getMessage());
	}
	try {
		conn = DriverManager
		.getConnection("jdbc:oracle:thin:jg3421/admin@localhost");
		System.out.println("connect success!!");
		st = conn.createStatement();
		String sql_format = "select * from e_users where users_id!=10000";

		String sql = String.format(sql_format, username, password);

		rs =st.executeQuery(sql);
		if (rs != null) {
		while(rs.next()){
			//System.out.println("1!" + rs.getDate(5).toString());

			Users user = new Users();
			System.out.println(rs.getInt(1));
			System.out.println(rs.getInt(8));
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
			}
			System.out.println(list.size());
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
  	Users admin = new Users();
  	admin.setUserid(10000);
  	admin.setUsername(username);
  	admin.setPassword(password);
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
       var form_id = "1first_form_"+id;
       var oForm = document.getElementById(form_id);
       if (oForm){
          oForm.submit();
       } 
    }

 function second(id){
   var form_id = "second_form_"+id;
   var oForm = document.getElementById(form_id);
   if (oForm){
      oForm.submit();
   } 
}
 function third(id){
       var form_id = "1third_form_"+id;
       var oForm = document.getElementById(form_id);
       if (oForm){
          oForm.submit();
       } 
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
		<img src="../admin/doc.jpg" height="350%" width="100%" /></div>

	</div>
	<div id="admin_bar">
		<div id="status">
			name&nbsp;:&nbsp;<%=admin.getUsername() %>&nbsp;
			<a href = "javascript:history.go(-1)" >Return</a>
			<form id="logout_form_<%=admin.getUserid() %>" action="../logout.jsp" method="post">
			 <a href="javascript:void(0)" onClick="logout(<%=admin.getUserid()%>)">login out</a>
			 <input type="hidden" name="uname" value="<%=admin.getUsername() %>"/>
			 </form>
		</div>
		<div id="channel"></div>
	</div>
	<div id="main"  style="height:60%; overflow:scroll;">
		<div id="opt_list">
			<ul>
				<li><form id="1first_form_<%=admin.getUserid()%>"
						action="../admin/Update.jsp" method="post">
						<a href="javascript:void(0)" onClick="info(<%=admin.getUserid()%>)"><%=left.get(0)%></a> 
						<input type="hidden" name="uname" value="<%=admin.getUsername()%>" /> 
						<input type="hidden" name="pwd" value="<%=admin.getPassword()%>" />
						<input type="hidden" name="contact_id" value="<%=admin.getUserid() %>"/>
						<input type="hidden" name="urole" value="<%=table%>"/>
					</form></li>
				<li><form id="second_form_<%=admin.getUserid()%>"
						action="../admin/update.jsp" method="post">
						<a href="javascript:void(0)"><%=left.get(1)%></a> <input
							type="hidden" name="uname" value="<%=admin.getUsername()%>" /> <input
							type="hidden" name="pwd" value="<%=admin.getPassword()%>" />
					</form></li>
				<li><form id="1third_form_<%=admin.getUserid()%>"
						action="<%=page3 %>.jsp" method="post">
						<a href="javascript:void(0)" onClick="third(<%=admin.getUserid()%>)"><%=left.get(2)%></a> 
						<input type="hidden" name="uname" value="<%=admin.getUsername()%>" /> 
						<input type="hidden" name="pwd" value="<%=admin.getPassword()%>" />
						<input type="hidden" name="contact_id" value="<%=admin.getUserid() %>"/>
						<input type="hidden" name="urole" value="<%=table%>"/>
					</form>
				</li>
				<li>
					<a href='e_usersPayment.jsp?uname=<%=username %>'>Delete Payment</a>
				</li>
			</ul>
		</div>
		<div id="opt_area" >
			<h1 id="opt_type">Personal Information:</h1>

			<table width="700" border="1" cellspacing="1" cellpadding="1">
				 <tr style="background-color:#ccc">
					<td>
						ID
					</td>
					<td>
						NAME
					</td>
					<td>
						Email
					</td>
					<td>
						Birthday
					</td>
					<td>
						Gender
					</td>
					<td>
						Address
					</td>
					<td>
						Zipcode
					</td>
					<td>
						Phone
					</td>
					<td>&nbsp;
						
					</td>
				</tr>
				<%for(Users user:list){ %>
				<tr>
					<td>
						<%=user.getUserid() %>
					</td>
					<td>
						<%=user.getUsername() %>
					</td>
					<td>
						<%=user.getEmail() %>
					</td>
					<td>
						<%=user.getBirthday() %>
					</td>
					<td>
						<%=user.getGender() %>
					</td>
					<td>
						<%=user.getAddress() %>
					</td>
					<td>
						<%=user.getZipcode() %>
					</td>
					<td>
						<%=user.getPhone() %>
					</td>
					<td align="center">
						 <form id="update_form_<%=user.getUserid() %>" action="../admin/Update.jsp" method="post">
						   <a href="javascript:void(0)" onClick="update(<%=user.getUserid()%>)">UPDATE</a>
						   <input type="hidden" name="contact_id" value="<%=user.getUserid() %>"/>
						   <input type="hidden" name="uname" value="<%=username %>"/>
						   <input type="hidden" name="pwd" value="<%=password %>"/>
						   <input type="hidden" name="urole" value="<%=table %>"/>
						</form>
					</td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	<div id="site_link">
		<a href="http://www.cs.columbia.edu/~biliris/4111/index.htm">About us: COMS4111 Fall 2013,Columbia University in the city of New York</a>
	</div>
	<div id="footer">
		<p class="">
			24/7 contact: 010-68988888 &#160;&#160;&#160;&#160; <a href="#">regular
				info</a> &#160;&#160;&#160;&#160; contact email:<a href="#">jubao@jb-aptech.com.cn</a>
		</p>
		<p class="copyright">
			Copyright &copy; 2013-2014 coms w4111, All Right Reserver<br />
	</div>

</body>
</html>
