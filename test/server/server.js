const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'qq060606',
    database: 'user'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL connected...');
});

app.post('/register', (req, res) => {
    const { email, username, password, question, answer } = req.body;

    // 将用户名和邮箱转换为小写以进行比较
    const lowerCaseEmail = email.toLowerCase();
    const lowerCaseUsername = username.toLowerCase();

    // 检查邮箱是否已经存在
    const checkEmailQuery = 'SELECT * FROM user WHERE LOWER(EmailAddress) = ?';
    db.query(checkEmailQuery, [lowerCaseEmail], (err, emailResult) => {
        if (err) {
            return res.status(500).json({ success: false, message: '注册失败' });
        }
        if (emailResult.length > 0) {
            return res.status(400).json({ success: false, message: '邮箱已经存在' });
        }

        // 检查用户名是否已经存在
        const checkUsernameQuery = 'SELECT * FROM user WHERE LOWER(userName) = ?';
        db.query(checkUsernameQuery, [lowerCaseUsername], (err, usernameResult) => {
            if (err) {
                return res.status(500).json({ success: false, message: '注册失败' });
            }
            if (usernameResult.length > 0) {
                return res.status(400).json({ success: false, message: '用户名已经存在' });
            }

            // 插入用户数据
            const insertUserQuery = 'INSERT INTO user (userName, EmailAddress, password, question, answer) VALUES (?, ?, ?, ?, ?)';
            db.query(insertUserQuery, [username, email, password, question, answer], (err, result) => {
                if (err) {
                    return res.status(500).json({ success: false, message: '注册失败' });
                }
                res.status(200).json({ success: true, message: '注册成功' });
            });
        });
    });
});

app.post('/login', (req, res) => {
    const { identifier, password } = req.body;
    const lowerCaseIdentifier = identifier.toLowerCase();

    // 开始数据库事务
    db.beginTransaction((err) => {
        if (err) {
            return res.status(500).json({ success: false, message: '登录失败' });
        }

        // 删除现有记录
        const deleteCUserQuery = 'truncate table cuser';
        db.query(deleteCUserQuery, (err, deleteResult) => {
            if (err) {
                return db.rollback(() => {
                    res.status(500).json({ success: false, message: '登录失败' });
                });
            }

            // 查询用户名或邮箱是否存在
            const checkIdentifierQuery = 'SELECT * FROM user WHERE LOWER(userName) = ? OR LOWER(EmailAddress) = ?';
            db.query(checkIdentifierQuery, [lowerCaseIdentifier, lowerCaseIdentifier], (err, identifierResult) => {
                if (err) {
                    return db.rollback(() => {
                        res.status(500).json({ success: false, message: '登录失败' });
                    });
                }
                if (identifierResult.length === 0) {
                    return db.rollback(() => {
                        res.status(400).json({ success: false, message: '用户名或邮箱不存在' });
                    });
                }

                // 检查密码是否匹配
                const user = identifierResult[0];
                if (user.password !== password) {
                    return db.rollback(() => {
                        res.status(400).json({ success: false, message: '密码错误' });
                    });
                }

                // 插入新用户信息到cuser表
                const insertCUserQuery = 'INSERT INTO cuser (identifier, password) VALUES (?, ?)';
                db.query(insertCUserQuery, [lowerCaseIdentifier, password], (err, result) => {
                    if (err) {
                        return db.rollback(() => {
                            res.status(500).json({ success: false, message: '登录失败' });
                        });
                    }

                    // 提交事务
                    db.commit((err) => {
                        if (err) {
                            return db.rollback(() => {
                                res.status(500).json({ success: false, message: '登录失败' });
                            });
                        }
                        console.log('登录成功，事务提交成功');
                        res.status(200).json({ success: true, message: '登录成功' });
                    });
                });
            });
        });
    });
});

app.post('/forgot-password', (req, res) => {
    const { email, securityAnswer, newPassword } = req.body;

    // 将邮箱转换为小写以进行比较
    const lowerCaseEmail = email.toLowerCase();

    // 检查邮箱是否存在
    const checkEmailQuery = 'SELECT * FROM user WHERE LOWER(EmailAddress) = ?';
    db.query(checkEmailQuery, [lowerCaseEmail], (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: '服务器错误' });
        }
        if (result.length === 0) {
            return res.status(400).json({ success: false, message: '邮箱不存在' });
        }

        const user = result[0];
        if (user.answer !== securityAnswer) {
            return res.status(400).json({ success: false, message: '密保答案错误' });
        }

        // 更新密码
        const updatePasswordQuery = 'UPDATE user SET password = ? WHERE LOWER(EmailAddress) = ?';
        db.query(updatePasswordQuery, [newPassword, lowerCaseEmail], (err, updateResult) => {
            if (err) {
                return res.status(500).json({ success: false, message: '更新密码失败' });
            }
            res.status(200).json({ success: true, message: '密码重置成功' });
        });
    });
});

app.post('/fetch-security-question', (req, res) => {
    const { email } = req.body;

    // 将邮箱转换为小写以进行比较
    const lowerCaseEmail = email.toLowerCase();

    // 检查邮箱是否存在
    const checkEmailQuery = 'SELECT question FROM user WHERE LOWER(EmailAddress) = ?';
    db.query(checkEmailQuery, [lowerCaseEmail], (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: '服务器错误' });
        }
        if (result.length === 0) {
            return res.status(400).json({ success: false, message: '邮箱不存在' });
        }

        res.status(200).json({ success: true, question: result[0].question });
    });
});

app.get('/api/currentUser', (req, res) => {
    const query = 'SELECT identifier FROM cuser LIMIT 1';
    db.query(query, (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: '获取当前用户信息失败' });
        }
        if (result.length > 0) {
            return res.status(200).json({ identifier: result[0].identifier });
        } else {
            return res.status(404).json({ success: false, message: '当前用户不存在' });
        }
    });
});

// 获取用户信息
app.get('/api/userInfo/:identifier', (req, res) => {
    const identifier = req.params.identifier.toLowerCase();
    const query = 'SELECT userName, EmailAddress, question, answer FROM user WHERE LOWER(userName) = ? OR LOWER(EmailAddress) = ?';
    db.query(query, [identifier, identifier], (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: '获取用户信息失败' });
        }
        if (result.length > 0) {
            const userInfo = {
                username: result[0].userName,
                email: result[0].EmailAddress,
                question: result[0].question,
                answer: result[0].answer
            };
            return res.status(200).json(userInfo);
        } else {
            return res.status(404).json({ success: false, message: '用户不存在' });
        }
    });
});

// 修改密码接口
app.post('/api/change-password', (req, res) => {
    const { password, newPassword } = req.body;

    // 获取当前用户标识
    const getCurrentUserQuery = 'SELECT identifier FROM cuser LIMIT 1';
    db.query(getCurrentUserQuery, (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: '获取当前用户信息失败' });
        }
        if (result.length === 0) {
            return res.status(404).json({ success: false, message: '当前用户不存在' });
        }

        const identifier = result[0].identifier.toLowerCase();

        // 检查旧密码是否正确
        const checkPasswordQuery = 'SELECT password FROM user WHERE LOWER(userName) = ? OR LOWER(EmailAddress) = ?';
        db.query(checkPasswordQuery, [identifier, identifier], (err, passwordResult) => {
            if (err) {
                return res.status(500).json({ success: false, message: '检查密码失败' });
            }
            if (passwordResult.length === 0) {
                return res.status(404).json({ success: false, message: '用户不存在' });
            }

            const currentPassword = passwordResult[0].password;
            if (currentPassword !== password) {
                return res.status(400).json({ success: false, message: '旧密码错误' });
            }

            // 更新密码
            const updateUserPasswordQuery = `UPDATE user SET password = ? WHERE LOWER(userName) = ? OR LOWER(EmailAddress) = ?`;
            const updateCuserPasswordQuery = `UPDATE cuser SET password = ? WHERE LOWER(identifier) = ?`;

            db.query(updateUserPasswordQuery, [newPassword, identifier, identifier], (err, updateUserResult) => {
                if (err) {
                    return res.status(500).json({ success: false, message: '更新user表密码失败' });
                }

                db.query(updateCuserPasswordQuery, [newPassword, identifier], (err, updateCuserResult) => {
                    if (err) {
                        return res.status(500).json({ success: false, message: '更新cuser表密码失败' });
                    }
                    res.status(200).json({ success: true, message: '密码修改成功' });
                });
            });
        });
    });
});



const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});