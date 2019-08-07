package com.sgi.pojo;

public class Department {

	private Integer dept_id;
	
	private String dept_name;

	public Integer getDept_id() {
		return dept_id;
	}

	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dept_id == null) ? 0 : dept_id.hashCode());
		result = prime * result + ((dept_name == null) ? 0 : dept_name.hashCode());
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
		Department other = (Department) obj;
		if (dept_id == null) {
			if (other.dept_id != null)
				return false;
		} else if (!dept_id.equals(other.dept_id))
			return false;
		if (dept_name == null) {
			if (other.dept_name != null)
				return false;
		} else if (!dept_name.equals(other.dept_name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Department [dept_id=" + dept_id + ", dept_name=" + dept_name + ", getDept_id()=" + getDept_id()
				+ ", getDept_name()=" + getDept_name() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass()
				+ ", toString()=" + super.toString() + "]";
	}

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
