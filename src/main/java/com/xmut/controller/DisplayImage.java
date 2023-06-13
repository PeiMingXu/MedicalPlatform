package com.xmut.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;

@Controller
public class DisplayImage {
	@RequestMapping(value = "/DisplayImage", method = RequestMethod.GET)
	public void display(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String file = "D:/upload/" + request.getParameter("src");//����·��
//		String file = "/var/lib/tomcat8/upload/" + request.getParameter("src");	//������·��
		response.setContentType("image/jpeg");
		ServletOutputStream out;
		out = response.getOutputStream();
		FileInputStream fin = new FileInputStream(file);
		BufferedInputStream bin = new BufferedInputStream(fin);
		BufferedOutputStream bout = new BufferedOutputStream(out);
		int ch = 0;
		while ((ch = bin.read()) != -1) {
			bout.write(ch);
		}
		bin.close();
		fin.close();
		bout.close();
		out.close();
	}
	@RequestMapping(value = "/downloadfile", method = RequestMethod.GET)
	public void downloadfile(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {
		//设置ContentType字段值
				response.setContentType("text/html;charset=utf-8");
				//设置相应消息编码
				response.setCharacterEncoding("utf-8");
				//设置请求消息编码
				request.setCharacterEncoding("utf-8"); 				
				//获取所要下载的文件名称
				String filename = request.getParameter("filename");		
				//对文件名称编码
				filename = new String(filename.trim().getBytes("iso8859-1"),"UTF-8");  
		        //下载文件所在目录
		        String folder = "D:/upload/";
		        // 通知浏览器以下载的方式打开
				response.addHeader("Content-Type", "application/octet-stream");
				response.addHeader("Content-Disposition", 
		        		"attachment;filename="+URLEncoder.encode(filename,"utf-8"));
				// 通过文件流读取文件
				InputStream in = new FileInputStream(folder+filename);
				/*
				 * session.getServletContext().getResourceAsStream( folder+filename);
				 */
				// 获取response对象的输出流
				OutputStream out = response.getOutputStream();
				byte[] buffer = new byte[1024];
				int len;
				//循环取出流中的数据
				while ((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}
		
	}
	@RequestMapping("/fileDownload")
    public ResponseEntity<byte[]> testFileDownload(HttpSession session) throws IOException {
    	String file = "D:/upload/";
        //获取ServletContext对象
        ServletContext servletContext = session.getServletContext();
        //文件的真实路径
        String realPath = servletContext.getRealPath(file);
        //创建输入流
        InputStream inputStream = new FileInputStream(realPath);
        //创建字节数组
        byte[] bytes = new byte[inputStream.available()];
        //将流读到字节数组中
        inputStream.read(bytes);
        //创建HttpHeaders对象，设置响应头信息
        MultiValueMap<String,String> headers = new HttpHeaders();
        //设置下载方式和下载文件的名称   attachment表示以附件的形式下载
        headers.add("Content-Disposition","attachment;filename=a.jpg");
        //设置响应状态码
        HttpStatus  status = HttpStatus.OK;
        //创建ResponseEntity对象
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(bytes,headers,status);
        //关闭输入流
        inputStream.close();
        return responseEntity;
		/* <a href="${pageContext.request.contextPath}/fileDownload">下载a.jpg</a> */
    }
}
