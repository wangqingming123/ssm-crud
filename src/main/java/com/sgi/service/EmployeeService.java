package com.sgi.service;

import java.util.List;

import com.sgi.pojo.Employee;

public interface EmployeeService {

	//根据员工Id查询员工
	Employee selEmployeeByID(int emp_id);
	//查询所有员工信息
	List<Employee>	getAllEmp();
	//查询所有员工信息，带有部门信息
	List<Employee> getAllEmpWithDept();
}
