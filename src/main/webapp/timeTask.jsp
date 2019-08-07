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
</head>
<body>
<table>
 <!--  <tr>
    <td>选择导入数据源：</td>
    <td><input id="path" type="text" name="path" size="30"></td>
    <td><input type=button value="选择" onclick="browseFolder('path')"></td>
  </tr> -->
  <tr> 
  <td> <input class="easyui-timespinner" id="time" data-options="showSeconds:true" value="17:00:00"> </input></td>
  <td>  <a id="yjxz" href="javascript:void(0)"  class="easyui-linkbutton" data-options="width:'80px', iconCls:'icon-ok'">应急下载</a></td>
  <td>  <a id="ksxz" href="javascript:void(0)"  class="easyui-linkbutton" data-options="width:'80px', iconCls:'icon-ok'">开始下载</a></td>
  </tr>
</table>
</body>
<script type="text/javascript">
$(function() {
	var serviceList=[1,2,3];
	var time=$("#time").val();
	$("#yjxz").click(function(){
		batchDownload(serviceList,time,false);
	})
	$("#ksxz").click(function(){
		batchDownload(serviceList,time,true);
	})
	
	function batchDownload(serviceList,Time,isTiming){
		var time=$("#time").val();
		//设置的时分秒
		var Hour=time.split(":")[0];
		var Min=time.split(":")[1];
		var Sec=time.split(":")[2];
		console.info(Hour,Min,Sec);
		//当前时分秒
		var nowDate=new Date();
		var nowHour=parseInt(nowDate.getHours());
		var nowMin=parseInt(nowDate.getMinutes());
		var nowSec=parseInt(nowDate.getSeconds());
		if(isTiming){
			var delay=(Hour-nowHour)*3600+(Min-nowMin)*60+(Sec-nowSec);
			//设置时间大于当前时间，在设置时间点执行,否则在下一天的设置时间执行
			if(Hour>nowHour||Min>nowMin||Sec>nowSec){
				setTimeout (batchDownload,delay*1000);
				console.info("执行时间差"+delay);
			}else{
				delay=(delay+60*60*24);
				setTimeout (downloadTask,delay*1000);
				console.info("执行时间差"+delay);
			}
			
			
		}else{
			console.info("执行批量下载任务")
			setTimeout (downloadTask,500);
		}
		
		
	}
	
	function downloadTask(){
		for( var i=0;i<3;i++){
			console.info("批量下载"+i);
		}
	}
	
})



</script>
</html>