<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import = "edu.bean.*" %>

<%
    String id =  request.getParameter("uid");
	String uname = request.getParameter("uname");
	String upwd = request.getParameter("pwd");
    String username = request.getParameter("cname");
	String password = request.getParameter("cpwd");
	String birthday = request.getParameter("ubirthday");
	String gender = request.getParameter("ugender");
	String email = request.getParameter("uemail");
	String addr = request.getParameter("uaddr");
	String zip = request.getParameter("uzipcode");
	String phone = request.getParameter("phone");

%>
<%
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
		String sql_format = "update e_users"
				+ " set users_id = "
				+ id
				+ ", email = '%s', name = '%s', birthday='%s', password= '%s', gender = '%s', address = '%s', zipcode = '%s' where users_id = "
				+ id;
				
		String sql = String.format(sql_format, email, username, birthday, password, gender,addr,zip);
		
		System.out.println(sql);
		int affected = st.executeUpdate(sql);
		if (affected > 0) {
			String path = "../logout.jsp?uname="+username;
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

