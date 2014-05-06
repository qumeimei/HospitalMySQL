<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	int id = 0;
	String username = request.getParameter("cname");
	String password = request.getParameter("cpwd");
	String email = request.getParameter("email");
	String urole = request.getParameter("urole");
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver successful");
	} catch (Exception e1) {
		System.out.println("driver failed! because: " + e1.getMessage());
	}
	try {
		conn = DriverManager
				.getConnection("jdbc:oracle:thin:jg3421/admin@localhost");
		System.out.println("connect success!");
		st = conn.createStatement();
		String sql2 = "select count(*) as rownumber from e_users";
		
		
		rs = st.executeQuery(sql2);
		if (rs != null && rs.next()) {
			id =rs.getInt("rownumber");
			System.out.println("this is "+id);
		}
		id = id +10001;
		
		String sql_format = "insert into e_users (users_id,email,name,password) values("+id+",'%s','%s','%s')";
		String sql3 = null;
		if(urole.equals("e_patient")){
			sql3 = "insert into "+urole+"(p_id,p_ssn) values("+id+",100000000)";
		}else{
		sql3 = "insert into "+urole+"(users_id,ssn) values("+id+",100000000)";
		}
		
		String sql = String.format(sql_format, email, username, password);

		System.out.println(sql3);
		
		int affected = st.executeUpdate(sql);
		int affected2 = st.executeUpdate(sql3);
		System.out.println(affected2);
		if (affected > 0) {
			if(affected2>0){
			request.getRequestDispatcher("../admin/welcome2.jsp").forward(request, response);
			}
			else {
				out.println("<script type='text/javascript'>alert('cannot insert second table, please try again');location.href='../reg.jsp';</script>");
			}
		} else {
			out.println("<script type='text/javascript'>alert('please try again');location.href='../reg.jsp';</script>");
		}
	} catch (SQLException e1) {
		e1.printStackTrace();
		out.println("<script type='text/javascript'>alert('email already exist!');location.href='../reg.jsp';</script>");
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
