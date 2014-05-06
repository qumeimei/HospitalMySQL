<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import = "edu.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String uname = request.getParameter("uname");
String uid = request.getParameter("uid");
String iid = request.getParameter("insurance");

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
	//"jdbc:oracle:thin:testuser/testpass@localhost"
	System.out.println("connect success!!");
	st = conn.createStatement();
	String sql = "update r_purchase"+ " set i_id = " + iid + "where p_id = "+ uid;
	
	System.out.println(sql);
	int affected = st.executeUpdate(sql);
	if (affected > 0) {
		String path = "e_patientBill.jsp?uid="+uid+"&uname="+uname;
		response.sendRedirect(path);
	} else {
					out
				.println("<script type='text/javascript'>alert('Update Failed!');location.href='javascript:history.go(-1)';</script>");
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
