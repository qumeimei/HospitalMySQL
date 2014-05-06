<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../../CSS/admin.css" rel="stylesheet" type="text/css" />
<%
	String uname = request.getParameter("uname");
	String uid = request.getParameter("uid");
%>

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
				<li><a href='change_insurance.jsp?uid=<%=uid %>&uname=<%=uname%>'>Insurance</a>
				</li>
			</ul>
		</div>
		
		<div id="opt_area">
		<h1 id="opt_type">New Insurance:</h1>
		<p> Choose a new insurance will delete the old choice and add a new one.		
		<form name="formupdate1" method="post" action="do_change_insur.jsp?&uid=<%=uid %>&uname=<%=uname %>" onSubmit="checkInput()">
		<table border="0" align="center">
			<tr>
				<td>Insurance name</td>
				
				<td><select name="insurance" id="insurance">
					    <option value="default">choose one</option>
						<option value="12001">undergrad insurance (85%)</option>
						<option value="12002">grad insurance (90%)</option>
						<option value="12003">undergrad adv insurance (95%)</option>
						<option value="12005">general insurance type1 (80%)</option>
						<option value="12006">general insurance type2 (88%)</option>
						<option value="12007">general insurance type3 (70%)</option>
						<option value="12008">general insurance type4 (50%)</option>
						<option value="12009">international travel insurance (75%)</option>
						<option value="12010">international student insurance (90%)</option>
						<option value="12011">special insurance type1 (90%)</option>
				</select>
				</td>
				
				<td style="text-align:center">
					<input type="submit" value="submit"/>
				</td>
			</tr>
		</table>
	</form>
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