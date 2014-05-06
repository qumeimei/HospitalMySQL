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
String sql_format = "select s_id, service_fee,s_from,s_to from r_service where p_id='%s'";
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
			name&nbsp;:&nbsp;<%=uname %>&nbsp;
			<form id="logout_form_<%=uid %>" action="../logout.jsp" method="post">
			 <a href="javascript:void(0)" onClick="logout(<%=uid%>)">logout</a>
			 <input type="hidden" name="uname" value="<%=uname %>"/>
			 </form>
		</div>
		<div id="channel"></div>
	</div>
	<div id="main"  style="height:60%; overflow:scroll;" >
		<div id="opt_list">
			<ul>

				<li><a href='javascript:history.go(-1)'> Return</a>
				</li>
			</ul>
		</div>
		
		
		<div id="opt_area">
		
		<H1>Medical Record</H1>
		<br>
				
		<H3>Service Record</H3>
		<br>
<TABLE>
<tr>
<td>Service_ID</td><td>Service_fee</td><td>From</td><td>To</td>
</tr>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>
<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getInt("s_id") + "</td><td>" +
rs.getDouble("service_fee") + "</td>" +
"<td>" + rs.getDate("s_from") + "</td>" +
"<td>" + rs.getDate("s_to") + "</td>");
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


<%
try {
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:jg3421/DATABASE@//w4111b.cs.columbia.edu:1521/ADB");
conn = ods.getConnection();

Statement st = conn.createStatement();
String sql_format = "select R.exam_id, E.e_price,R.e_from,R.e_to from r_exam R,e_examination E where R.p_id='%s'and R.e_id=E.e_id";
//String sql_format =  "select s_id, service_fee,s_from,s_to from r_service where p_id='%s'";
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
<H3>Exam Record</H3>
<TABLE>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>
<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getInt("exam_id") + "</td><td>" +
rs.getDouble("e_price") + "</td>" +
"<td>" + rs.getDate("e_from") + "</td>" +
"<td>" + rs.getDate("e_to") + "</td>");
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

<%
try {
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:jg3421/DATABASE@//w4111b.cs.columbia.edu:1521/ADB");
conn = ods.getConnection();

Statement st = conn.createStatement();
String sql_format = "select R.t_id, E.m_price,R.m_from,R.m_to from r_take R,e_medicine E where R.p_id='%s'and R.m_id=E.m_id";
//String sql_format =  "select s_id, service_fee,s_from,s_to from r_service where p_id='%s'";
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
<H3>Medicine Record</H3>
<TABLE>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>
<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getInt("t_id") + "</td><td>" +
rs.getDouble("m_price") + "</td>" +
"<td>" + rs.getDate("m_from") + "</td>" +
"<td>" + rs.getDate("m_to") + "</td>");
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

<%
try {
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:jg3421/DATABASE@//w4111b.cs.columbia.edu:1521/ADB");
conn = ods.getConnection();

Statement st = conn.createStatement();
String sql_format = "select prescription_id, p_price,p_date from e_prescription where p_id='%s'";

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
<H3>Prescription Record</H3>
<TABLE>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>
<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getInt("prescription_id") + "</td><td>" +
rs.getDouble("p_price") + "</td>" +
"<td>" + rs.getDate("p_date") + "</td>" 
);
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
<%
try {
OracleDataSource ods = new OracleDataSource();
ods.setURL("jdbc:oracle:thin:jg3421/DATABASE@//w4111b.cs.columbia.edu:1521/ADB");
conn = ods.getConnection();

Statement st = conn.createStatement();
String sql_format = "select c_id, care_price,care_from, care_to from r_care where p_id='%s'";

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
<H3>Care Record</H3>
<TABLE>
<tr>
<td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td><td><b>---------------------</b></td>
</tr>
<%
if(rs != null) {
while(rs.next()) {
out.print("<tr>");
out.print("<td>" + rs.getInt("c_id") + "</td><td>" +
rs.getDouble("care_price") + "</td>" +
"<td>" + rs.getDate("care_from") + "</td>"+ 
"<td>" + rs.getDate("care_to") + "</td>"
);
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

