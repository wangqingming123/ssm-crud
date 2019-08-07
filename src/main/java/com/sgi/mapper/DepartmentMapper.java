package com.sgi.mapper;

import org.apache.ibatis.annotations.Select;

import com.sgi.pojo.Department;
/**
 * 
 * @author wang
 *
 */
public interface DepartmentMapper {
   @Select("select * from tbl_dept where dept_id=#{0}")
	Department selDepartment(int dept_id);
}
