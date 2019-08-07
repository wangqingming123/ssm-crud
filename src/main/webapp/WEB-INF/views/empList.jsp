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
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-1.3.2.min.js"></script>
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
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
						<th>${emp.emp_id}</th>
						<th>${emp.emp_name}</th>
						<th>${emp.gender==1?"男":"女"}</th>
						<th>${emp.email}</th>
						<th>人事部</th>
						<th>
							<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
							</button>
							<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
							</button>
						</th>
					</tr>
					 </c:forEach>
						
				</table>
	</div>
	<!--  分页信息-->
	<div class="row">
		<div class="col-md-6">
			当前${pageInfo.pageNum } 页, 总共${pageInfo.pages }
				页, 总共${pageInfo.total } 条记录
		
		</div>
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  <li><a href="${APP_PATH}/getAllEmp?pageNumber=1">首页</a></li>
			  <c:if test="${pageInfo.hasPreviousPage }">
			   <li>
			      <a href="${APP_PATH}/getAllEmp?pageNumber=${pageInfo.pageNum-1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			  </c:if>
			   
			    <c:forEach items="${pageInfo.navigatepageNums}" var="navigatepage">
			    	<c:if test="${pageInfo.pageNum==navigatepage }">
			    		<li  class="active"><a href="#">${navigatepage}</a></li>
			    	</c:if>
			   	 	<c:if test="${pageInfo.pageNum!=navigatepage }">
			    		<li ><a href="${APP_PATH}/getAllEmp?pageNumber=${navigatepage}">${navigatepage}</a></li>
			    	</c:if>
			    </c:forEach>
			    <c:if test="${pageInfo.hasNextPage }">
			    	<li>
				      <a href="${APP_PATH}/getAllEmp?pageNumber=${pageInfo.pageNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
			   		 </li>
			    </c:if>
			    
			    <li><a href="${APP_PATH}/getAllEmp?pageNumber=${pageInfo.pages}">尾页</a></li>
			  </ul>
			</nav>
		</div>
	
	</div>

</div>
</body>
</html>