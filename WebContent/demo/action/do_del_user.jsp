<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
  String id =  request.getParameter("contact_id");
  
%>
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
		System.out.println("connect success!!");
		st = conn.createStatement();
		String sql = "delete from e_users where users_id="+id;
		
		int result =st.executeUpdate(sql);
		if (result>0){
			//response.sendRedirect("../admin/welcome.jsp");
			request.getRequestDispatcher("../action/e_usersUpdate_User.jsp").forward(request, response);
		}else{
			out
			.println("<script type='text/javascript'>alert('Delete failed');location.href='../admin/welcome.jsp';</script>");
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
%>