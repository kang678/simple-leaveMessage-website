package com;
import com.JavaBean;//记得导包
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;



public class servlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JavaBean bean=new JavaBean();
		request.setCharacterEncoding("utf-8");
		String user=request.getParameter("user");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Date date=new Date();
		SimpleDateFormat formate=new SimpleDateFormat();
		String time=formate.format(date);
		
		bean.setUser(user);
		bean.setTitle(title);
		bean.setContent(content);
		bean.setTime(time);
		
		
		
//		array.add(s);
//		request.getRequestDispatcher("a.jsp").forward(request, response);
		
		if(user==null){
			PrintWriter out = response.getWriter();
			out.print("请留言！");
			
		}else{
			
		ArrayList array=(ArrayList)request.getSession().getServletContext().getAttribute("array");
		if(array==null){
			array=new ArrayList();
			
		}else { 
			
		}
		
		array.add(bean);
		request.getSession().getServletContext().setAttribute("array",array);
		response.sendRedirect("a.jsp");
		
		}
	}

}
