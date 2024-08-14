package com.sanjiv.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.sanjiv.entities.Employee;

/**
 * Servlet implementation class SalUpdate
 */
public class SalUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id,csl,nsl;
		
		id=Integer.parseInt(request.getParameter("empno"));
		csl=Integer.parseInt(request.getParameter("cursl"));
		nsl=Integer.parseInt(request.getParameter("newsl"));
		
		Configuration cfg=new Configuration().configure();
	    SessionFactory sf=cfg.addAnnotatedClass(Employee.class).buildSessionFactory();
	    Session ses=sf.getCurrentSession();
	    ses.beginTransaction();
	    
	    Query<Employee> q=ses.createQuery("update Employee set salary=:p1 where empno=:p2 and salary=:p3");
	    q.setParameter("p1", nsl);
	    q.setParameter("p2", id);
	    q.setParameter("p3", csl);
	    
	    int cnt=q.executeUpdate();
	    ses.getTransaction().commit();
	    
	    out.println(cnt);
	    
	    if(cnt>0)
	    {
	    	//out.println("Updaed Successfully...");
	        response.sendRedirect("UpdateSuccess.jsp");
	    }
	    else
	    {
	        response.sendRedirect("UpdateFailed.jsp");
	    }
	}

}
