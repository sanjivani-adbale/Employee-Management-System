package com.sanjiv.entities;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="employee")
public class Employee {
@Id
@Column(name="empno")
private int empno;
private String empnm;
private String location;
private String department;
private String post;
private float salary;
private String gender;
private String mobile;
private String emailid;


public int getEmpno() {
	return empno;
}

public void setEmpno(int empno) {
	this.empno = empno;
}

public String getEmpnm() {
	return empnm;
}

public void setEmpnm(String empnm) {
	this.empnm = empnm;
}

public String getLocation() {
	return location;
}

public void setLocation(String location) {
	this.location = location;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}

public String getPost() {
	return post;
}

public void setPost(String post) {
	this.post = post;
}

public float getSalary() {
	return salary;
}

public void setSalary(float salary) {
	this.salary = salary;
}

public String getGender() {
	return gender;
}

public void setGender(String gender) {
	this.gender = gender;
}

public String getMobile() {
	return mobile;
}

public void setMobile(String mobile) {
	this.mobile = mobile;
}

public String getEmailid() {
	return emailid;
}

public void setEmailid(String emailid) {
	this.emailid = emailid;
}

}
