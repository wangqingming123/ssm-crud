package com.sgi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgi.mapper.DepartmentMapper;
import com.sgi.pojo.Department;
import com.sgi.service.DeptService;
@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DepartmentMapper deptmapper;
	public Department selDepartment(int dept_id) {
		return deptmapper.selDepartment(dept_id);
	}
	
}
