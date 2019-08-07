package com.sgi.pojo;

import java.util.HashMap;

public class Msg {

	//状态码
	private String code;
	//返回信息
	private String msg;
	//用户要返回给浏览器的数据
	private HashMap<String ,Object> extend =new HashMap<String ,Object>();
	
	public static Msg Success() {
		Msg result =new Msg();
		result.setCode("100");
		result.setMsg("处理成功");
		return result;
		
	}
	public static Msg Fail() {
		Msg result =new Msg();
		result.setCode("200");
		result.setMsg("处理失败");
		return result;
		
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HashMap<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(HashMap<String, Object> extend) {
		this.extend = extend;
	}

	
}
