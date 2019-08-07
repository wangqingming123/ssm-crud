<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 选择一个EasyUI的主题 -->
<link rel="stylesheet" href="${APP_PATH}/static/themes/default/easyui.css" />
<!-- 引入EasyUI的图标样式 -->
<link rel="stylesheet" href="${APP_PATH}/static/themes/icon.css" />
<!-- 引入jQuery-->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!-- easyui文件 -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.easyui.min.js"></script>
<!-- 引入汉化文件 -->
<script type="text/javascript" src="${APP_PATH}/static/js/easyui-lang-zh_CN.js"></script>
<!-- 引入FileSaver -->
<script type="text/javascript" src="${APP_PATH}/static/js/FileSaver.js"></script>
</head>
<body>

 </body>
 <script>
 $(function () {
	 var students = [{
		         "name": "小明1",
		         "age": "6",
		          "sex": "男",
		          "height": "60"
		     }, {
		         "name": "小明2",
		          "age": "7",
		          "sex": "男",
		          "height": "70"
		      }, {
		          "name": "小明3",
		         "age": "8",
		         "sex": "男",
		         "height": "80"
		     }];
	 downloadJson(students);
	 downloadText(students);
		      // 导出生成json文件
		      function downloadJson(data) {
		         var blob = new Blob([JSON.stringify(data)], { type: "" });
		          saveAs(blob, "hello.json");
		      }
		      // 导出生成文本
		     function downloadText(data) {
		         var blob = new Blob([JSON.stringify(data)], { type: "text/plain;charset=utf-8" });
		         saveAs(blob, "hello.log");
		     }
	 
	 
	 
	
})
    

 </script>
</body>

</html>