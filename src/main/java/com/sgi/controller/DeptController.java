package com.sgi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgi.pojo.Department;
import com.sgi.pojo.Employee;
import com.sgi.service.DeptService;
@Controller
public class DeptController {

	@Autowired
	private DeptService deptService;
	@ResponseBody
	@RequestMapping("/selDept")
	public Department selDepartment(String  dept_id ) {
		int DeptID=Integer.parseInt(dept_id);
		return deptService.selDepartment(DeptID);
	}
	
	public Employee selEmployeeById(String emp_id) {
		return null;
	}
}
