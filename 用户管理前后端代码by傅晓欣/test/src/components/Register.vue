<template>
    <div class="register-container">
        <el-card class="box-card">
            <el-form @submit.prevent="handleRegister">
                <el-form-item>
                    <el-input id="email" type="email" v-model="email" required placeholder="请输入邮箱地址"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input id="username" v-model="username" required placeholder="请输入用户名"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input id="password" :type="passwordType" v-model="password" required placeholder="请输入密码">
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item>
                    <el-select id="securityQuestion" v-model="securityQuestion" placeholder="请选择密保问题" required>
                        <el-option label="你的名字是？" value="你的名字是？"></el-option>
                        <el-option label="你的生日是？" value="你的生日是？"></el-option>
                        <el-option label="你最喜欢的水果是？" value="你最喜欢的水果是？"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-input id="securityAnswer" v-model="securityAnswer" required placeholder="请输入密保答案"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="register-button">注册</el-button>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="goToLogin" class="back-button">返回登录</el-button>
                </el-form-item>
            </el-form>
        </el-card>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                email: '',
                username: '',
                password: '',
                passwordType: 'password',
                securityQuestion: '',
                securityAnswer: ''
            };
        },
        methods: {
            async handleRegister() {
                try {
                    const response = await axios.post('http://localhost:8080/api/register', {
                        email: this.email,
                        username: this.username,
                        password: this.password,
                        question: this.securityQuestion,
                        answer: this.securityAnswer
                    });
                    if (response.data.success) {
                        alert('注册成功');
                        this.$router.push('/login');
                    } else {
                        alert('注册失败，用户名或邮箱已存在');
                    }
                } catch (error) {
                    console.error(error);
                    alert('注册失败，用户名或邮箱已存在');
                }
            },
            togglePasswordVisibility() {
                this.passwordType = this.passwordType === 'password' ? 'text' : 'password';
            },
            goToLogin() {
                this.$router.push('/login');
            }
        }
    };
</script>

<style scoped>
    .register-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url('../image/background.jpg'); /* 使用相对路径引用图片 */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: -1; /* 确保背景在内容之下 */
    }

    .box-card {
        height: 400px;
        width: 400px;
    }

    .register-button, .back-button {
        width: 100%;
        border-radius: 5px; /* 圆角 */
        background-color: #007bff; /* 按钮背景色 */
        color: #ffffff; /* 按钮文字颜色 */
        border: none; /* 去掉边框 */
        padding: 10px; /* 按钮内边距 */
        font-size: 16px; /* 字体大小 */
        cursor: pointer; /* 鼠标悬停效果 */
    }

        .back-button:hover {
            background-color: #0056b3; /* 返回按钮悬停背景色 */
        }
</style>
