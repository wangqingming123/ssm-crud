package com.sgi.pojo;

import java.io.Serializable;

public class Employee implements Serializable{
	
	private int emp_id;
	private String emp_name;
	private String gender;
	private String email;
	private String d_id;
	private Department deptpartment;
	public Department getDeptpartment() {
		return deptpartment;
	}
	public void setDeptpartment(Department deptpartment) {
		this.deptpartment = deptpartment;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((d_id == null) ? 0 : d_id.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + emp_id;
		result = prime * result + ((emp_name == null) ? 0 : emp_name.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (d_id == null) {
			if (other.d_id != null)
				return false;
		} else if (!d_id.equals(other.d_id))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (emp_id != other.emp_id)
			return false;
		if (emp_name == null) {
			if (other.emp_name != null)
				return false;
		} else if (!emp_name.equals(other.emp_name))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		return true;
	}
	public Employee(int emp_id, String emp_name, String gender, String email, String d_id) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.gender = gender;
		this.email = email;
		this.d_id = d_id;
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", emp_name=" + emp_name + ", gender=" + gender + ", email=" + email
				+ ", d_id=" + d_id + "]";
	}

}
