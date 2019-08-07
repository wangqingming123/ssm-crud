package com.sgi.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.sgi.pojo.Employee;

@Controller
public class Json2ExcelController {

	@RequestMapping("/Tabel2Excel")
	@ResponseBody
	public Employee Json2Excel(HttpServletResponse httpServletResponse,String name,String gender,String email,String filename) throws IOException {
		System.out.println(name+gender+email+filename);
		Set<String> keys = null;
        // 创建HSSFWorkbook对象
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建HSSFSheet对象
        HSSFSheet sheet = wb.createSheet("sheet0");
        
        //Excel的行
        int rowNo = 0;
        //单元格的列号
        int cellNO = 0;
		//创建json对象
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("name", name);
		jsonObject.put("gender", gender);
		jsonObject.put("email", email);
		
		//遍历jsonObject
		int i=0;
		while( i<jsonObject.size()) {
			// 创建HSSFRow对象
            HSSFRow row = sheet.createRow(rowNo++);
            
            if (keys==null) {
            	//keys值就是列标题
                keys = jsonObject.keySet();
                for (String s : keys) {
                    HSSFCell cell = row.createCell(cellNO++);
                    cell.setCellValue(s);
                }
                cellNO = 0;
                row = sheet.createRow(rowNo++);
            }
            
            for (String s : keys) {
                HSSFCell cell = row.createCell(cellNO++);
                cell.setCellValue(jsonObject.getString(s));
            }
            cellNO = 0;
            i++;
		}
		
		 // 输出Excel文件
		//设置响应头
        httpServletResponse.setContentType("application/octet-stream; charset=utf-8");
        httpServletResponse.setHeader("Content-Disposition", "attachment; filename="+filename);
        OutputStream output = httpServletResponse.getOutputStream();
        wb.write(output);
        wb.close();
        output.flush();
        output.close();
		return null;
	}
}
