<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息列表</title>
<!-- web路径 1.以/开头的路径，找资源以服务器路径为准 2.不以/开头的路径以当前路径为基准 -->
<% 
pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入jQuery-->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!--引入bootstrap  -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"   rel="stylesheet">
<script type="text/javascript"  src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!--搭建显示页面  -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM_员工信息</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<button type="button" class="btn btn-primary btn-sm">新增</button>
			<button type="button" class="btn btn-danger btn-sm" >删除</button>
		</div>
	</div>
	<!-- table -->
	<div class="row">
	<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
	</div>
	
		<!-- 显示分页信息 -->
	<div class="row">
		<!--分页文字信息  -->
		<div class="col-md-6" id="page_info_area"></div>
		<!-- 分页条信息 -->
		<div class="col-md-6" id="page_nav_area">
		</div>
	</div>

</div>

<script type="text/javascript">
/*页面加载成功时，请求第一页信息  */
$(function(){
	$.ajax({
		url:"${APP_PATH}/getAllEmpWithDept",
		data:"pageNumber=1",
		type:"POST",
		success:function(result){
			/* 创建员工列表*/
			bulid_emptabl(result);
			console.info(result);
			/* 显示分页信息*/
			bulid_showPageInfo(result);
			/* 创建分页条 */
			build_Page_navigation(result);
			
		}
	});
});
		function bulid_emptabl(result){
			var emp =result.extend.pageInfo.list;
			$.each(emp ,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.emp_id);
				var empNameTd = $("<td></td>").append(item.emp_name);
				var genderTd = $("<td></td>").append(item.gender=='1'?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.deptpartment.dept_name);
				//为编辑按钮添加一个自定义的属性，来表示当前员工id
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为删除按钮添加一个自定义的属性来表示当前删除的员工id
				editBtn.attr("edit-id",item.empId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("del-id",item.empId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBoxTd)
				.append(empIdTd)
				.append(empNameTd)
				.append(genderTd)
				.append(emailTd)
				.append(deptNameTd)
				.append(btnTd)
				.appendTo("#emps_table tbody");
			});
		}

		
	
/* 显示分页信息*/
function bulid_showPageInfo(result){
	$("#page_info_area").empty();
	$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
			result.extend.pageInfo.pages+"页,总"+
			result.extend.pageInfo.total+"条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}
function build_Page_navigation(result){
	
	var ul = $("<ul></ul>").addClass("pagination");
	
	//构建元素
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	//添加首页和前一页 的提示
	
	ul.append(firstPageLi).append(prePageLi);
	
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	
	/* 遍历分页元素，添li */
	var pageInfo =result.extend.pageInfo;
	$.each(pageInfo.navigatepageNums,function(index,item){
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if(result.extend.pageInfo.pageNum == item){
			numLi.addClass("active");
		}
		
		numLi.click(function(){
			to_page(item);
		});
		ul.append(numLi);
		var nav=$("<nav></nav").attr("aria-label","Page navigation").append(ul);
		$("#page_nav_area").append(nav);
	})
	
	ul.append(firstPageLi).append(lastPageLi);
}

</script>
</body>
</html>