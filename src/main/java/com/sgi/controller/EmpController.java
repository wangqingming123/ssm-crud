package com.sgi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgi.pojo.Employee;
import com.sgi.pojo.Msg;
import com.sgi.service.EmployeeService;
@Controller
public class EmpController {

	@Autowired
	private EmployeeService empService;
	@RequestMapping("/selEmployeeByID")
	@ResponseBody
	public Employee selEmployeeByID(String emp_id) {
		
		int empID=Integer.parseInt(emp_id);
		return empService.selEmployeeByID(empID);
	}
	/**
	 * 查询所有员工,分页查询,将查询数据放到作用域
	 */
	@RequestMapping("/getAllEmp")
	public String getAllEmp(@RequestParam(value="pageNumber",defaultValue="1")Integer pageNumber ,Model model) {
		PageHelper.startPage(pageNumber, 5);
		List<Employee> empList=empService.getAllEmp();
		PageInfo<Employee> pageInfo=new PageInfo(empList);
		model.addAttribute("pageInfo",pageInfo);
		//将PageInfo放入作用域
		return "empList";
	}
	/**
	 * 查询所有员工信息，带有部门信息。返回带有状态码的Json数据
	 * @param pageNumber
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/getAllEmpWithDept")
	@ResponseBody
	public Msg getAllEmpWithDept(@RequestParam(value="pageNumber",defaultValue="1")Integer pageNumber) {
		PageHelper.startPage(pageNumber, 5);
		List<Employee> empList=empService.getAllEmpWithDept();
		PageInfo<Employee> pageInfo=new PageInfo(empList);
		if(pageInfo!=null) {
			return Msg.Success().add("pageInfo", pageInfo);
		}
		return Msg.Fail().add("pageInfo", pageInfo);
		
	
	}
	
}
