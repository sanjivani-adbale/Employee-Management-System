<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.sanjiv.entities.Employee"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FindEmployee</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top: 45px; background-color: rgb(224, 218, 218);">
    <div class="container">
    <h1 align="center" class="display-4" style="color:black"><b>Employee Search Result</b></h1>
    <hr>
         <a href="home.jsp"><img src="images/home.jpg" alt="Home" height="45"></a>
         <br>
    
    <%
    Configuration cfg=new Configuration().configure();
    SessionFactory sf=cfg.addAnnotatedClass(Employee.class).buildSessionFactory();
    Session ses=sf.getCurrentSession();
    ses.beginTransaction();
    
    
    int id=Integer.parseInt(request.getParameter("empno"));
    Query<Employee> q=ses.createQuery("from Employee where empno= :p1");
    q.setParameter("p1",id);
    List<Employee> lst=q.getResultList();
    if(lst.size()>0)
    {
    	%>
    	<br>
    	<table class="table table-bordered table-hover">
    	<tr>
    	<th style="background-color: rgb(92, 231, 145);">Employee Name</th>
    	<th style="background-color: rgb(92, 231, 145);">Department</th>
    	<th style="background-color: rgb(92, 231, 145);">Location</th>
    	<th style="background-color: rgb(92, 231, 145);">Post</th>
    	<th style="background-color: rgb(92, 231, 145);">Salary</th>
    	</tr>
    	
    	<tr>
    	<td style="background-color: antiquewhite;"><%=lst.get(0).getEmpnm()%></td>
    	<td style="background-color: antiquewhite;"><%=lst.get(0).getDepartment()%></td>
    	<td style="background-color: antiquewhite;"><%=lst.get(0).getLocation()%></td>
    	<td style="background-color: antiquewhite;"><%=lst.get(0).getPost()%></td>
    	<td style="background-color: antiquewhite;"><%=lst.get(0).getSalary()%></td>
    	</tr>
    	<%
    }
    else
    {
    	out.println("Employee id does not exist");
    }
    
    %>
    </table>
    
    </div>

</body>
</html>