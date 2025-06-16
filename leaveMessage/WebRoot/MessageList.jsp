<%@ page language="java" import="java.util.*,com.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	  
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }
      
      body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        padding: 40px 20px;
      }
      
      .container {
        max-width: 1000px;
        margin: 0 auto;
        padding: 20px;
      }
      
      header {
        text-align: center;
        margin-bottom: 40px;
        padding: 20px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      }
      
      h1 {
        color: #2c3e50;
        font-size: 2.5rem;
        margin-bottom: 10px;
        position: relative;
        display: inline-block;
      }
      
      h1::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 4px;
        background: linear-gradient(to right, #3498db, #9b59b6);
        border-radius: 2px;
      }
      
      .description {
        color: #7f8c8d;
        font-size: 1.1rem;
        max-width: 600px;
        margin: 20px auto;
        line-height: 1.6;
      }
      
      .message-container {
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-bottom: 30px;
      }
      
      .no-messages {
        text-align: center;
        padding: 50px 20px;
      }
      
      .no-messages h2 {
        color: #7f8c8d;
        font-weight: 400;
        margin-bottom: 25px;
        font-size: 1.8rem;
      }
      
      .btn {
        display: inline-block;
        background: linear-gradient(to right, #3498db, #9b59b6);
        color: white;
        padding: 12px 30px;
        border-radius: 50px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        font-size: 1rem;
        box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
      }
      
      .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
      }
      
      .message-card {
        background: white;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 25px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        border-left: 4px solid #3498db;
        position: relative;
        overflow: hidden;
      }
      
      .message-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      }
      
      .message-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 4px;
        height: 100%;
        background: linear-gradient(to bottom, #3498db, #9b59b6);
      }
      
      .message-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        flex-wrap: wrap;
      }
      
      .message-author {
        font-size: 1.3rem;
        color: #2c3e50;
        font-weight: 600;
      }
      
      .message-time {
        color: #95a5a6;
        font-size: 0.9rem;
      }
      
      .message-title {
        font-size: 1.2rem;
        color: #3498db;
        margin-bottom: 10px;
        font-weight: 600;
      }
      
      .message-content {
        color: #34495e;
        line-height: 1.7;
        padding: 15px 0;
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee;
        margin: 15px 0;
      }
      
      .message-count {
        text-align: center;
        margin: 20px 0;
        font-size: 1.1rem;
        color: #7f8c8d;
        font-weight: 500;
      }
      
      footer {
        text-align: center;
        margin-top: 40px;
        color: #7f8c8d;
        font-size: 0.9rem;
        padding: 20px;
      }
      
      @media (max-width: 768px) {
        .container {
          padding: 10px;
        }
        
        .message-header {
          flex-direction: column;
          align-items: flex-start;
        }
        
        .message-time {
          margin-top: 8px;
        }
      }
    </style>
  </head>

  
  <body>
  	<%-- 
   		<%
   			ArrayList array=(ArrayList)application.getAttribute("array");
   		 %>
   		
   		<%  if(array==null) {%>
   			没有任何留言！
   			<a href="index.jsp">去留言</a>
   		<%}else{
   			for(int i=0;i<array.size();i++){
   		 %>
   		<% JavaBean bean=(JavaBean)array.get(i);
   			
   		 %>
   		留言者：<%=bean.getUser() %><br/>
   		留言标题：<%=bean.getTitle()%><br/>
   		留言内容： <%=bean.getContent()%><br/>
   		留言时间：<%=bean.getTime() %>
   		<hr/>
   		
   		<%}
   	  	}%>
   	 --%>
   	   
    
  
  
  
    <div class="container">
      <header>
        <h1>留言板</h1>
        <p class="description">在这里查看所有用户的留言信息，每条留言都记录了留言者、标题、内容和时间。</p>
      </header>
      
      <div class="message-container">
        <%
          ArrayList array = (ArrayList) application.getAttribute("array");
        %>
        
        <% if (array == null) { %>
          <div class="no-messages">
            <h2>目前没有任何留言</h2>
            <p>成为第一个留言的人吧！</p>
            <div style="margin-top: 30px;">
              <a href="index.jsp" class="btn">去留言</a>
            </div>
          </div>
        <% } else { %>
          <div class="message-count">
            共有 <%= array.size() %> 条留言
          </div>
          
          <% for (int i = 0; i < array.size(); i++) { %>
            <% JavaBean bean = (JavaBean) array.get(i); %>
            <div class="message-card">
              <div class="message-header">
                <div class="message-author">留言者：<%= bean.getUser() %></div>
                <div class="message-time">留言时间：<%= bean.getTime() %></div>
              </div>
              <div class="message-title">留言标题：<%= bean.getTitle() %></div>
              <div class="message-content">留言内容：<%= bean.getContent() %></div>
            </div>
          <% } %>
          
          <div style="text-align: center; margin-top: 30px;">
            <a href="index.jsp" class="btn">返回留言页面</a>
          </div>
        <% } %>
      </div>
      
      <footer>
        <p>© 2023 留言板系统 | 让沟通更简单</p>
      </footer>
    </div>
    
    <script>
      // 添加简单的动画效果
      document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.message-card');
        cards.forEach((card, index) => {
          // 添加延迟效果，使卡片依次出现
          card.style.animationDelay = `${index * 0.1}s`;
          card.classList.add('animate__animated', 'animate__fadeInUp');
        });
        
        // 添加按钮悬停效果
        const buttons = document.querySelectorAll('.btn');
        buttons.forEach(button => {
          button.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-3px)';
          });
          
          button.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
          });
        });
      });
    </script>
  </body>
</html>
