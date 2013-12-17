<% Servlets.setCharacterEncoding(request, response); %>

<%@page import="org.openxava.web.servlets.Servlets"%>
<%@page import="org.openxava.util.Locales"%>
<%@page import="com.openxava.naviox.web.NaviOXStyle"%>

<jsp:useBean id="context" class="org.openxava.controller.ModuleContext" scope="session"/>
<jsp:useBean id="modules" class="com.openxava.naviox.Modules" scope="session"/>

<%
String app = request.getParameter("application");
String module = context.getCurrentModule(request);
Locales.setCurrent(request);
modules.setCurrent(request.getParameter("application"), request.getParameter("module"));
String oxVersion = org.openxava.controller.ModuleManager.getVersion(); 
String navioxVersion = "2013v2.1"; 
%>

<!DOCTYPE html>

<head>
	<title><%=modules.getCurrentModuleDescription()%></title>
	<link href="<%=request.getContextPath()%>/naviox/style/naviox.css" rel="stylesheet" type="text/css">
	<script type='text/javascript' src='<%=request.getContextPath()%>/xava/js/dwr-engine.js?ox=<%=oxVersion%>'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/dwr/interface/AjaxModules.js?ox=<%=navioxVersion%>'></script>
</head>

<body <%=NaviOXStyle.getBodyClass(request)%>>
	
	<div id="main_navigation">
		<jsp:include page="mainNavigation.jsp"/>
	</div>
	
	<table width="100%">
		<tr>
			<td id="modules_list">				
				<div id="modules_list_popup" >
					<img id="modules_list_corner" src="<%=request.getContextPath()%>/naviox/images/corner.png"/>
					<div id="modules_list_outbox">
						<table id="modules_list_box">
							<tr id="modules_list_content">
								<td>
									<jsp:include page="modulesList.jsp"/>
								</td>						
							</tr>
						</table>
					</div>
				</div>
			</td>
	
			<td valign="top">
				<div class="module-wrapper">
					<% if ("SignIn".equals(module)) {  %>
					<jsp:include page='signIn.jsp'/>
					<% } else { %>
					<div id="module_description">
						<%=modules.getCurrentModuleDescription()%>
					</div>					
					<jsp:include page='<%="../xava/module.jsp?application=" + app + "&module=" + module%>'/>
					<% } %>
				</div>
			</td>
		</tr>
	</table>
	
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/js/typewatch.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/naviox/js/naviox.js'></script>
	
	<script>
	$(function() {
		naviox.init();
	});
	</script>
	

</body>