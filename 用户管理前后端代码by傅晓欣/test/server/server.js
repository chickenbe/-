const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 8080;

// 添加 X-Content-Type-Options 头
app.use((_req, res, next) => {
    res.setHeader('X-Content-Type-Options', 'nosniff');
    next();
});

// 提供静态文件服务
app.use(express.static(path.join(__dirname, 'public')));

// 解析请求体
app.use(bodyParser.json());

// 添加 CORS 支持
const corsOptions = {
    origin: [
        'http://localhost:8080',
        'http://127.0.0.1:8080',
        'http://39.97.124.144:8080',
        'http://127.0.0.1',
        'http://localhost',
        'http://localhost:3000'
    ],
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true
};
app.use(cors(corsOptions));

// 所有未匹配的请求都返回 index.html，以支持前端路由
app.get('*', (_req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// 示例：前端调用后端接口
const fetchData = async (url, method, body) => {
    const options = {
        method,
        headers: {
            'Content-Type': 'application/json'
        }
    };
    if (body) {
        options.body = JSON.stringify(body);
    }
    const response = await fetch(url, options);
    return await response.json();
};

// 注册路由
app.post('/api/register', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/register', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to register user' });
    }
});

// 登录路由
app.post('/api/login', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/login', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to login user' });
    }
});

// 忘记密码路由
app.post('/api/forgot-password', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/forgot-password', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to process forgot password request' });
    }
});

// 获取安全问题路由
app.post('/api/fetch-security-question', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/fetch-security-question', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch security question' });
    }
});

// 获取当前用户路由
app.get('/api/currentUser', async (_req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/currentUser', 'GET');
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to get current user' });
    }
});

// 获取用户信息路由
app.get('/api/userInfo/:identifier', async (req, res) => {
    try {
        const data = await fetchData(`http://localhost:8080/api/userInfo/${req.params.identifier}`, 'GET');
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to get user info' });
    }
});

// 修改密码路由
app.post('/api/change-password', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/change-password', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to change password' });
    }
});

app.listen(PORT, () => {
    console.log(`Frontend server is running on port ${PORT}`);
});
