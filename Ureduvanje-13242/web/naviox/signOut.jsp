<jsp:useBean id="modules" class="com.openxava.naviox.Modules" scope="session"/>

<%
session.removeAttribute("naviox.user");
session.removeAttribute("xava.portal.userinfo");
modules.reset();
%>

<script type="text/javascript">
window.location="../m/SignIn";
</script>
