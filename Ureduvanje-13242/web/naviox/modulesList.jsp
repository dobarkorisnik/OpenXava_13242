<%@include file="../xava/imports.jsp"%>

<%@page import="java.util.Iterator"%>
<%@page import="org.openxava.application.meta.MetaModule"%>
<%@page import="com.openxava.naviox.Modules"%>

<jsp:useBean id="modules" class="com.openxava.naviox.Modules" scope="session"/>

<img id="modules_list_corner" src="<%=request.getContextPath()%>/naviox/images/corner.png"/>

<div id="search_module">
<input id="search_module_text" type="text" size="38" placeholder='<xava:message key="search_modules"/>'/>
</div>

<% 
for (Iterator it= modules.getAll().iterator(); it.hasNext();) {
	MetaModule module = (MetaModule) it.next();
	String selected = module.getName().equals(request.getParameter("module"))?"selected":"";
%>	
	<a  href="/<%=module.getMetaApplication().getName()%>/m/<%=module.getName()%>">
	<div id="<%=module.getName()%>_module" class="module-row <%=selected%>" onclick="$('#<%=module.getName()%>_loading').show()">	
		<div class="module-name">
			<%=module.getLabel(request.getLocale())%>
			<img id="<%=module.getName()%>_loading" src="<%=request.getContextPath()%>/naviox/images/loading.gif" style="float: right; display:none;"/>
		</div>
		<div class="module-description"><%=module.getDescription(request.getLocale())%></div>
	</div>	
	</a>
	
<%	
}
%>

