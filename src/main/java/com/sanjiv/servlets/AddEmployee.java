package com.sanjiv.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sanjiv.entities.Employee;

/**
 * Servlet implementation class AddEmployee
 */
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int empno;
		String empnm,location, department,post,gender,mobile,emailid;
		float salary;
		empno=Integer.parseInt(request.getParameter("empno"));
		empnm=request.getParameter("empnm");
		location=request.getParameter("location");
		department=request.getParameter("department");
		post=request.getParameter("post");
		salary=Float.parseFloat(request.getParameter("salary"));
		gender=request.getParameter("gender");
		mobile=request.getParameter("mobile");
		emailid=request.getParameter("emailid");
		
		Employee e=new Employee();
		e.setEmpno(empno);
		e.setEmpnm(empnm);
		e.setLocation(location);
		e.setDepartment(department);
		e.setPost(post);
		e.setSalary(salary);
		e.setGender(gender);
		e.setMobile(mobile);
		e.setEmailid(emailid);
		
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(Employee.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		ses.persist(e);
		ses.getTransaction().commit();
		response.sendRedirect("RegistrationSuccess.jsp");
	}

}
