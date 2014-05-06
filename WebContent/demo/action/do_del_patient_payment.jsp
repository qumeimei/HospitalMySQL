<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import = "edu.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String p_id = request.getParameter("p_id");

Connection conn = null;
Statement st = null;
ResultSet rs = null;
Users user = new Users();

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
	String sql = "delete from payment where p_id = "+ p_id;
	
	System.out.println(sql);
	int affected = st.executeUpdate(sql);
	if (affected > 0) {
		String path = "../admin/welcome.jsp?uname=admin&pwd=admin&urole=e_users";
		response.sendRedirect(path);
	} else {
					out
				.println("<script type='text/javascript'>alert('This patient has no payment!');location.href='javascript:history.go(-1)';</script>");
	}

} catch (SQLException e1) {
	e1.printStackTrace();
	System.out.println("connect failed!");
	out
	.println("<script type='text/javascript'>alert('Update Failed!');location.href='javascript:history.go(-1)';</script>");

} finally {
	if (rs != null)
		rs.close();
	if (st != null)
		st.close();
	if (conn != null)
		conn.close();
}

%>
