<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="netgest.bo.system.boApplication"%>
<%@page import="netgest.bo.system.boSession"%>
<%@page import="netgest.bo.runtime.EboContext"%>
<%@page import="org.xeoframework.data.CheckAndFill"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
String req=request.getParameter("Name").toString();
boApplication app = boApplication.getDefaultApplication();
//Login a user
boSession bsession = app.boLogin("SYSUSER", "ABC");
//Create a context
EboContext ctx = app.createContext(bsession);

CheckAndFill data = new CheckAndFill(ctx,response);

String[] attributes=data.CheckXEOModelExists(req);

if(attributes==null)
	response.getWriter().write("Unknown Object");
else
if(attributes.length > 0)
response.getWriter().write("<form method='get' action='/xeo/ObjectCreation.jsp?name="+req);
for (int i=0;i<=attributes.length;i++)	{
	response.getWriter().write("&at"+i+"="+attributes[i]);
}
response.getWriter().write("'>");
for (int i=0;i<=attributes.length;i++)	{
	response.getWriter().write(attributes[i]+"<input name='"+attributes[i]+"'>");
}
response.getWriter().write("<input type='submit'></form>");
ctx.close();
bsession.closeSession();

%>
</body>
</html>