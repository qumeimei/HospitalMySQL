<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import = "edu.bean.*" %>

<%
    String id =  request.getParameter("contact_id");
	String uname = request.getParameter("uname");
	String pwd = request.getParameter("pwd");
	String urole = request.getParameter("urole");
%>
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	Users user = new Users();
	String path = null;
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
		String sql =  "select * from e_users where users_id= "+id;
		
		rs =st.executeQuery(sql);
		if (rs != null && rs.next()) {
			System.out.println("update"+rs.getInt(1));
			user.setUserid(rs.getInt(1));
			user.setEmail(rs.getString(2));
			user.setUsername(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setBirthday(rs.getString(5));
			user.setGender(rs.getString(6));
			user.setAddress(rs.getString(7));
			user.setZipcode(rs.getInt(8));
			user.setPhone(rs.getString(9));
		}
		System.out.println("update"+user.getUsername());

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
	if(uname.equals(user.getUsername())){
		path = "../action/do_self_update.jsp";
	}
	else {
		path = "../action/do_update_user.jsp";
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>My JSP 'Update.jsp' starting page</title>
    
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
    <form action=<%=path %> method="post">
    <input type="hidden" name="urole" value="<%=urole %>"/>
    <input type="hidden" name="uname" value="<%=uname %>"/>
    <input type="hidden" name="pwd" value="<%=pwd %>"/>
       ID <input type="text" name="uid"  value="<%=user.getUserid() %>" /><br/>
       NAME <input type="text" name="cname"  value="<%=user.getUsername() %>" /><br/>
       Password <input type="text" name="cpwd"  value="<%=user.getPassword() %>" /><br/>
       Birthday <input type="text" name="ubirthday"  value="<%=user.getBirthday() %>" /><br/>
       Gender <input type="text" name="ugender"  value="<%=user.getGender() %>" /><br/>
       Email<input type="text" name="uemail" value="<%=user.getEmail() %>"/><br/>
       Address<input type="text" name="uaddr" value="<%=user.getAddress()%>" /><br/>
       Zipcode<input type="text" name="uzipcode" value="<%=user.getZipcode() %>"/><br/>
       Phone<input type="text" name="uphone" value="<%=user.getPhone() %>" /><br/>
       <br/>
       <input type="submit" value="submit"/> &nbsp;<input type="reset" value="reset"/>
    </form>
    <a href = "javascript:history.go(-1)" >Return</a>
  </body>
</html>
