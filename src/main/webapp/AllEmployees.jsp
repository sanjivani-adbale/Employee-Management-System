<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.sanjiv.entities.Employee"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AllEmployees</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top: 45px; background-color: rgb(224, 218, 218);">
    <div class="container">
    <h1 align="center" class="display-4" style="color:black"><b>Employees Report</b></h1>
    <hr>
         <a href="home.jsp"><img src="images/home.jpg" alt="Home" height="55" align="right"></a>
    
    
    <%
    Configuration cfg=new Configuration().configure();
    SessionFactory sf=cfg.addAnnotatedClass(Employee.class).buildSessionFactory();
    Session ses=sf.getCurrentSession();
    ses.beginTransaction();
    
    Query<Employee> q=ses.createQuery("from Employee");
    List<Employee> lst=q.getResultList();
    
    out.println("Record Retrieved :"+lst.size());
    
    %>
    
    <table class="table table-bordered">
    <tr>
    <th style="background-color: rgb(92, 231, 145);">Employee Id</th>
    <th style="background-color: rgb(92, 231, 145);">Employee Name</th>
    <th style="background-color: rgb(92, 231, 145);">Location</th>
    <th style="background-color: rgb(92, 231, 145);">Department</th>
    <th style="background-color: rgb(92, 231, 145);">Post</th>
    <th style="background-color: rgb(92, 231, 145);">Salary</th>
    <th style="background-color: rgb(92, 231, 145);">Gender</th>
    <th style="background-color: rgb(92, 231, 145);">Mobile</th>
    <th style="background-color: rgb(92, 231, 145);">EmailId</th>
    
    </tr>
    <%
    Employee e;
    for(int i=0;i<lst.size();i++)
    {
    	e=lst.get(i);
    	%>
    	<tr>
    	<td><%=e.getEmpno() %></td>
    	<td><%=e.getEmpnm() %></td>
    	<td><%=e.getLocation() %></td>
    	<td><%=e.getDepartment() %></td>
    	<td><%=e.getPost() %></td>
    	<td><%=e.getSalary() %></td>
    	<td><%=e.getGender() %></td>
    	<td><%=e.getMobile() %></td>
    	<td><%=e.getEmailid() %></td>
    	</tr>
    	
    	<%
    	
    }
    %>
    
    </table>
    </div>
</body>
</html>