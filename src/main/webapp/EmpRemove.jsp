<%@page import="com.sanjiv.entities.Employee"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>empRemove</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top:45px; background-color: rgb(224, 218, 218);">
    <div class="container">
        <h1 align="center" class="display-4" style="color: red ">Removing Employee</h1>
         <hr>
         <a href="home.jsp"><img src="images/home.jpg" alt="Home" height="55"></a>
         <br>

         <%
         int eid=Integer.parseInt(request.getParameter("empno"));
         
         Configuration cfg=new Configuration().configure();
 	    SessionFactory sf=cfg.addAnnotatedClass(Employee.class).buildSessionFactory();
 	    Session ses=sf.getCurrentSession();
 	    ses.beginTransaction();
 	    
 	    Query<Employee> q=ses.createQuery("delete from Employee where empno=:p1");
 	    q.setParameter("p1",eid);
 	    
 	    int cnt=q.executeUpdate();
 	    ses.getTransaction().commit();
 	    
 	    if(cnt>0)
 	    {
 	    	response.sendRedirect("RemoveSuccess.jsp");
 	    }
 	    else
 	    {
 	    	response.sendRedirect("RemoveFailed.jsp");

 	    }
 	    
         %>
    </div>
</body>
</html>