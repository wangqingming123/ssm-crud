package com.sgi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgi.mapper.EmployeeMapper;
import com.sgi.pojo.Employee;
import com.sgi.service.EmployeeService;
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeemapper;
	@Override
	public Employee selEmployeeByID(int emp_id) {
		return employeemapper.selEmployeeByID(emp_id);
	}
	/**
	 * 查询所有员工
	 */
	@Override
	public List<Employee> getAllEmp() {
		// TODO Auto-generated method stub
		return employeemapper.getAllEmp();
	}
	/**
	 * 查询所有员工信息，带有部门信息
	 */
	@Override
	public List<Employee> getAllEmpWithDept() {
		// TODO Auto-generated method stub
		return employeemapper.getAllEmpWithDept();
	}

}
