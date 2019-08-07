package com.sgi.mapper;

import java.util.List;

import com.sgi.pojo.Employee;

public interface EmployeeMapper {

	
	Employee selEmployeeByID(int emp_id);
	
    List<Employee>	getAllEmp();
    
    List<Employee> getAllEmpWithDept();
}
