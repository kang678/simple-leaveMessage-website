<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>现代化留言板系统</title>
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --success-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
            transition: var(--transition);
        }

        body.dark-mode {
            background-color: #121212;
            color: #f0f0f0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        body.dark-mode header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .theme-toggle {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
            color: var(--dark-color);
            transition: var(--transition);
        }

        body.dark-mode .theme-toggle {
            color: var(--light-color);
        }

        .hero {
            text-align: center;
            margin-bottom: 40px;
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: var(--primary-color);
        }

        .hero p {
            font-size: 1.2rem;
            color: #666;
            max-width: 700px;
            margin: 0 auto;
        }

        body.dark-mode .hero p {
            color: #aaa;
        }

        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            padding: 30px;
            margin-bottom: 40px;
            transition: var(--transition);
        }

        body.dark-mode .form-container {
            background-color: #1e1e1e;
        }

        .form-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: var(--primary-color);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: var(--transition);
        }

        body.dark-mode .form-control {
            background-color: #2d2d2d;
            border-color: #444;
            color: #f0f0f0;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .messages-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .messages-title {
            font-size: 1.8rem;
            color: var(--primary-color);
        }

        .message-count {
            font-size: 1rem;
            background-color: var(--success-color);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
        }

        .messages-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .message-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            transition: var(--transition);
            animation: fadeIn 0.5s ease-out;
            position: relative;
        }

        body.dark-mode .message-card {
            background-color: #1e1e1e;
        }

        .message-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .message-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        body.dark-mode .message-header {
            border-bottom: 1px solid #333;
        }

        .message-user {
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--primary-color);
        }

        .message-time {
            font-size: 0.85rem;
            color: #777;
        }

        body.dark-mode .message-time {
            color: #aaa;
        }

        .message-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--dark-color);
        }

        body.dark-mode .message-title {
            color: #f0f0f0;
        }

        .message-content {
            color: #555;
            margin-bottom: 15px;
            line-height: 1.7;
        }

        body.dark-mode .message-content {
            color: #ccc;
        }

        .message-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: var(--transition);
        }

        .edit-btn {
            background-color: #f8f9fa;
            color: #555;
        }

        body.dark-mode .edit-btn {
            background-color: #333;
            color: #ddd;
        }

        .delete-btn {
            background-color: #ff6b6b;
            color: white;
        }

        .no-messages {
            text-align: center;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            grid-column: 1 / -1;
        }

        body.dark-mode .no-messages {
            background-color: #1e1e1e;
        }

        footer {
            text-align: center;
            padding: 30px 0;
            color: #777;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        body.dark-mode footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #aaa;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .messages-container {
                grid-template-columns: 1fr;
            }
            
            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">留言板系统</div>
            <button class="theme-toggle" id="themeToggle">🌙</button>
        </header>

        <section class="hero">
            <h1>分享您的想法与观点</h1>
            <p>这是一个现代化的留言板系统，您可以在这里留下您的想法、建议或任何想分享的内容。</p>
        </section>

        <section class="form-container">
            <h2 class="form-title">发表新留言</h2>
            <form id="messageForm" action="servlet" method="post">
                <div class="form-group">
                    <label for="user">您的姓名</label>
                    <input type="text" id="user" name="user" class="form-control" placeholder="请输入您的姓名" required>
                </div>
                
                <div class="form-group">
                    <label for="title">留言标题</label>
                    <input type="text" id="title" name="title" class="form-control" placeholder="请输入留言标题" required>
                </div>
                
                <div class="form-group">
                    <label for="content">留言内容</label>
                    <textarea id="content" name="content" class="form-control" placeholder="请输入您的留言内容..." required></textarea>
                </div>
                
                <button type="submit" class="btn">提交留言</button>
            </form>
        </section>

        <section class="messages-container">
            <div class="messages-header">
                <h2 class="messages-title">所有留言</h2>
                <div class="message-count">5 条留言</div>
            </div>
            
            <!-- 留言卡片 -->
            <div class="message-card">
                <div class="message-header">
                    <div class="message-user">张三</div>
                    <div class="message-time">2023-10-15 14:30:25</div>
                </div>
                <h3 class="message-title">这个系统太棒了！</h3>
                <p class="message-content">这是我见过的最好的留言板系统，界面美观，功能完善，用户体验非常好！</p>
                <div class="message-actions">
                    <button class="action-btn edit-btn">编辑</button>
                    <button class="action-btn delete-btn">删除</button>
                </div>
            </div>
            
            <div class="message-card">
                <div class="message-header">
                    <div class="message-user">李四</div>
                    <div class="message-time">2023-10-14 09:15:42</div>
                </div>
                <h3 class="message-title">建议添加搜索功能</h3>
                <p class="message-content">如果能添加按关键字搜索留言的功能就更完美了，期待后续更新！</p>
                <div class="message-actions">
                    <button class="action-btn edit-btn">编辑</button>
                    <button class="action-btn delete-btn">删除</button>
                </div>
            </div>
            
            <div class="message-card">
                <div class="message-header">
                    <div class="message-user">王五</div>
                    <div class="message-time">2023-10-13 18:20:33</div>
                </div>
                <h3 class="message-title">技术问题请教</h3>
                <p class="message-content">请问这个留言板系统使用了哪些技术栈？前端和后端分别是如何实现的？</p>
                <div class="message-actions">
                    <button class="action-btn edit-btn">编辑</button>
                    <button class="action-btn delete-btn">删除</button>
                </div>
            </div>
            
            <div class="message-card">
                <div class="message-header">
                    <div class="message-user">赵六</div>
                    <div class="message-time">2023-10-12 11:05:17</div>
                </div>
                <h3 class="message-title">深色模式体验</h3>
                <p class="message-content">深色模式在夜间使用非常舒适，对眼睛很友好，感谢开发者考虑这么周到！</p>
                <div class="message-actions">
                    <button class="action-btn edit-btn">编辑</button>
                    <button class="action-btn delete-btn">删除</button>
                </div>
            </div>
            
            <div class="message-card">
                <div class="message-header">
                    <div class="message-user">钱七</div>
                    <div class="message-time">2023-10-10 16:40:55</div>
                </div>
                <h3 class="message-title">响应式设计很赞</h3>
                <p class="message-content">在手机和平板上使用体验也很好，自适应布局做得非常到位，继续加油！</p>
                <div class="message-actions">
                    <button class="action-btn edit-btn">编辑</button>
                    <button class="action-btn delete-btn">删除</button>
                </div>
            </div>
        </section>
        
        <footer>
            <p>© 2023 现代化留言板系统 | 使用 HTML, CSS, JavaScript 构建 | JSP/Servlet 后端</p>
        </footer>
    </div>

    <script>
        // 主题切换功能
        const themeToggle = document.getElementById('themeToggle');
        const body = document.body;
        
        // 检查本地存储中的主题设置
        const savedTheme = localStorage.getItem('theme');
        if (savedTheme === 'dark') {
            body.classList.add('dark-mode');
            themeToggle.textContent = '☀️';
        }
        
        themeToggle.addEventListener('click', () => {
            body.classList.toggle('dark-mode');
            
            if (body.classList.contains('dark-mode')) {
                themeToggle.textContent = '☀️';
                localStorage.setItem('theme', 'dark');
            } else {
                themeToggle.textContent = '🌙';
                localStorage.setItem('theme', 'light');
            }
        });
        
        // 表单提交验证
        const messageForm = document.getElementById('messageForm');
        
        messageForm.addEventListener('submit', (e) => {
            const userInput = document.getElementById('user');
            const titleInput = document.getElementById('title');
            const contentInput = document.getElementById('content');
            
            // 简单的表单验证
            if (userInput.value.trim() === '') {
                alert('请输入您的姓名');
                userInput.focus();
                e.preventDefault();
                return;
            }
            
            if (titleInput.value.trim() === '') {
                alert('请输入留言标题');
                titleInput.focus();
                e.preventDefault();
                return;
            }
            
            if (contentInput.value.trim() === '') {
                alert('请输入留言内容');
                contentInput.focus();
                e.preventDefault();
                return;
            }
            
            // 显示提交成功消息
            alert('留言提交成功！即将跳转到留言列表页面...');
        });
        
        // 删除按钮功能
        const deleteButtons = document.querySelectorAll('.delete-btn');
        
        deleteButtons.forEach(button => {
            button.addEventListener('click', () => {
                const messageCard = button.closest('.message-card');
                if (confirm('确定要删除这条留言吗？')) {
                    messageCard.style.opacity = '0';
                    messageCard.style.transform = 'scale(0.9)';
                    
                    setTimeout(() => {
                        messageCard.remove();
                        updateMessageCount();
                    }, 300);
                }
            });
        });
        
        // 更新留言计数
        function updateMessageCount() {
            const messageCards = document.querySelectorAll('.message-card');
            const messageCount = document.querySelector('.message-count');
            messageCount.textContent = `${messageCards.length} 条留言`;
        }
        
        // 添加动画效果到新留言卡片
        const messageCards = document.querySelectorAll('.message-card');
        messageCards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });
    </script>
</body>
</html>
