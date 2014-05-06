<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver successful");
	} catch (Exception e1) {
		System.out.println("driver failed! because: " + e1.getMessage());
	}
	try {
		conn = DriverManager
				.getConnection("jdbc:oracle:thin:jg3421/admin@localhost");
				
				//.getConnection("jdbc:oracle:thin:zw2220/wangzihan@//w4111b.cs.columbia.edu:1521/ADB");
		System.out.println("connect success!");
		st = conn.createStatement();
		
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String table = request.getParameter("urole");
		
		
		String sql_format = "select * from e_users where name='%s' and password='%s'";

		String sql = String.format(sql_format, username, password);

		rs = st.executeQuery(sql);
		if (rs != null && rs.next()) {
			String uid = "" + rs.getInt(1);
			System.out.println(uid);
			if (table.equals("e_patient")) {
				sql_format = "select count(*) as Re from "+table+" where p_id = '%s'";
				sql = String.format(sql_format,uid);
			} 
			else if (table.equals("e_users")&&!uid.equals("10000")){
				sql = null;			
			}
			else {
				sql_format = "select count(*) as Re from "+table+" where users_id = '%s'";
				sql = String.format(sql_format,uid);
			}
		}
		//System.out.println(sql);
		rs = st.executeQuery(sql);
		if (rs != null && rs.next()) {
			int result = rs.getInt("Re");
			System.out.println("result is "+result);
			if (result == 0) {
				out.println("<br/><p>Wrong role!</p>");
				out.println("<p><a href='javascript:history.go(-1)' >RETURN</a></p>");
				out.println("<script type='text/javascript'>alert('Invalid username or password\nPlease try again');location.href='../login.jsp';</script>");
				} else {
				request.getRequestDispatcher("../admin/welcome.jsp").forward(request, response);
			}
		}
		else {
			out.println("<br/><p>Wrong username or password!</p>");
			out.println("<p><a href='javascript:history.go(-1)' >RETURN</a></p>");
		}
		

	} catch (SQLException e1) {
		e1.printStackTrace();
		System.out.println("connect failed!");
		out.println("<br/><p>Please re-check your username, password and your role!</p>");
		out.println("<p><a href='javascript:history.go(-1)' >RETURN</a></p>");

	} finally {
		if (rs != null)
			rs.close();
		if (st != null)
			st.close();
		if (conn != null)
			conn.close();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <body>
  <head>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <div id="header">

		<img src="title.jpg" height="40%" width="100%" />
	
	</div>

  </body>
</html>
