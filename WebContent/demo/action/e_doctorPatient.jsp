<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String uname = request.getParameter("uname");
String uid = request.getParameter("uid");%>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.pool.OracleDataSource"%>
<!-- Database lookup -->
<%
Connection conn = null;
ResultSet rs = null;

String error_msg = "";
try {
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:jg3421/admin@localhost");
conn = ods.getConnection();


//Statement stmt = conn.createStatement();
//rset = stmt.executeQuery("select empno, ename, sal from emp");
Statement st = conn.createStatement();
String sql_format = "select E.name, R.care_from, R.care_to,P.p_record from r_care R,e_users E, e_patient P where R.d_id='%s'and R.p_id=E.users_id and P.p_id= R.p_id";
String sql = String.format(sql_format, uid);
rs =st.executeQuery(sql);
//Statement st1 = conn.createStatement();
//String sql1_format = "select exam_id, e_price,e_from,e_to from r_exam,e_eamination where p_id='%s'and r_exam.e_id=e_eamination.e_id";
} catch (SQLException e) {
error_msg = e.getMessage();
if( conn != null ) {
conn.close();
}
}
%>
<html>
  <head>
    <link href="../../CSS/admin.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'e_patientMedical_History.jsp' starting page</title>
    
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
	<div id="header">
		<div id="welcome">Welcome to Hospital Management
		<img src="../../Img/doc.jpg" height="400%" width="100%" /></div>		
	</div>
	
	<br>
	<div id="admin_bar">
		<div id="status">
			name&nbsp;:&nbsp;<%=uname %>&nbsp;<span>|</span>
			<form id="logout_form_<%=uid %>" action="../logout.jsp" method="post">
			 <a href="javascript:void(0)" onClick="logout(<%=uid%>)">logout</a>
			 <input type="hidden" name="uname" value="<%=uname %>"/>
			 </form>
		</div>
		<div id="channel"></div>
	</div>
	<div id="main">
		<div id="opt_list">
			<ul>
				<li><a href='javascript:history.go(-1)'>Return</a>
				</li>
			</ul>
		</div>
	
		
		<div id="opt_area">
		
		<H1>Your patient and Care Period</H1>
		<br>

<TABLE>
<tr>
<td>PatientName</td><td>From</td><td>To</td><td>illnessRecord</td>
</tr>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>

<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getString("name") + "</td><td>" +
rs.getDate("care_from") + "</td>" +
"<td>" + rs.getDate("care_to") + "</td>"+
"<td>" + rs.getString("p_record") + "</td>");
out.print("</tr>");
}
} else {
out.print(error_msg);
}

if( conn != null ) {
conn.close();
}
%>
</TABLE>

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

