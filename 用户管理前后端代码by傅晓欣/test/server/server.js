const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 8080;

// ��� X-Content-Type-Options ͷ
app.use((_req, res, next) => {
    res.setHeader('X-Content-Type-Options', 'nosniff');
    next();
});

// �ṩ��̬�ļ�����
app.use(express.static(path.join(__dirname, 'public')));

// ����������
app.use(bodyParser.json());

// ��� CORS ֧��
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

// ����δƥ������󶼷��� index.html����֧��ǰ��·��
app.get('*', (_req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// ʾ����ǰ�˵��ú�˽ӿ�
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

// ע��·��
app.post('/api/register', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/register', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to register user' });
    }
});

// ��¼·��
app.post('/api/login', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/login', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to login user' });
    }
});

// ��������·��
app.post('/api/forgot-password', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/forgot-password', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to process forgot password request' });
    }
});

// ��ȡ��ȫ����·��
app.post('/api/fetch-security-question', async (req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/fetch-security-question', 'POST', req.body);
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch security question' });
    }
});

// ��ȡ��ǰ�û�·��
app.get('/api/currentUser', async (_req, res) => {
    try {
        const data = await fetchData('http://localhost:8080/api/currentUser', 'GET');
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to get current user' });
    }
});

// ��ȡ�û���Ϣ·��
app.get('/api/userInfo/:identifier', async (req, res) => {
    try {
        const data = await fetchData(`http://localhost:8080/api/userInfo/${req.params.identifier}`, 'GET');
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: 'Failed to get user info' });
    }
});

// �޸�����·��
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
