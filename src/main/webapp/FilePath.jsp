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
<div id="text" style="color:#f00;"></div>
<input type="file" id="file" onchange="getvl(this)" />
</body>
<script type="text/javascript">
//FX获取文件路径方法
function readFileFirefox(fileBrowser) {
    try {
        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
    }
    catch (e) {
        alert('无法访问本地文件，由于浏览器安全设置。为了克服这一点，请按照下列步骤操作：(1)在地址栏输入"about:config";(2) 右键点击并选择 New->Boolean; (3) 输入"signed.applets.codebase_principal_support" （不含引号）作为一个新的首选项的名称;(4) 点击OK并试着重新加载文件');
        return;
    }
    var fileName=fileBrowser.value; //这一步就能得到客户端完整路径。下面的是否判断的太复杂，还有下面得到ie的也很复杂。
    var file = Components.classes["@mozilla.org/file/local;1"]
        .createInstance(Components.interfaces.nsILocalFile);
    try {
        // Back slashes for windows
        file.initWithPath( fileName.replace(/\//g, "\\\\") );
    }
    catch(e) {
        if (e.result!=Components.results.NS_ERROR_FILE_UNRECOGNIZED_PATH) throw e;
        alert("File '" + fileName + "' cannot be loaded: relative paths are not allowed. Please provide an absolute path to this file.");
        return;
    }
    if ( file.exists() == false ) {
        alert("File '" + fileName + "' not found.");
        return;
    }


    return file.path;
}


//根据不同浏览器获取路径
function getvl(obj){
//判断浏览器
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
        (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
            (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
                (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
                    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    var file_url="";
    if(Sys.ie<="6.0"){
        //ie5.5,ie6.0
        file_url = obj.value;
    }else if(Sys.ie>="7.0"){
        //ie7,ie8
        obj.select();
        file_url = document.selection.createRange().text;
    }else if(Sys.firefox){
        //fx
        //file_url = document.getElementById("file").files[0].getAsDataURL();//获取的路径为FF识别的加密字符串
        file_url = readFileFirefox(obj);
    }else if(Sys.chrome){
        file_url = obj.value;
    }
    //alert(file_url);
    document.getElementById("text").innerHTML="获取文件域完整路径为："+file_url;
}
</script>
</html>