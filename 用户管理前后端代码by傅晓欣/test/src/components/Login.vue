<template>
    <div class="login-container">
        <el-card class="box-card">
            <div style="margin-bottom: 50px;"></div> <!-- 添加空白行 -->
            <el-form @submit.prevent="handleLogin">
                <el-form-item>
                    <el-input v-model="identifier" placeholder="用户名或邮箱" required></el-input>
                </el-form-item>
                <div style="margin-bottom: 50px;"></div> <!-- 添加空白行 -->
                <el-form-item>
                    <el-input :type="passwordType" v-model="password" placeholder="密码" required>
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <div style="margin-bottom: 50px;"></div> <!-- 添加空白行 -->
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="login-button">登录</el-button>
                </el-form-item>
                <div class="links-row">
                    <div class="register-link">
                        <a href="#" @click.prevent="handleRegister">立即注册</a>
                    </div>
                    <div class="forgot-password">
                        <a href="#" @click.prevent="handleForgotPassword">忘记密码？</a>
                    </div>
                </div>
            </el-form>
        </el-card>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                identifier: '',
                password: '',
                passwordType: 'password'
            };
        },
        methods: {
            async handleLogin() {
                try {
                    const response = await axios.post('http://localhost:8080/api/login', {
                        identifier: this.identifier,
                        password: this.password
                    });
                    if (response.data.success) {
                        alert('登录成功');
                        this.$router.push({ name: 'Main' });
                    } else {
                        alert('登录失败，请检查用户名或邮箱和密码');
                    }
                } catch (error) {
                    console.error(error);
                    alert('登录失败，请检查用户名或邮箱和密码');
                }
            },
            togglePasswordVisibility() {
                this.passwordType = this.passwordType === 'password' ? 'text' : 'password';
            },
            handleForgotPassword() {
                this.$router.push('/forgot-password');
            },
            handleRegister() {
                this.$router.push('/register');
            }
        }
    };
</script>

<style scoped>
    .login-container {
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
        width: 400px; /* 调整宽度 */
    }

    .form-item {
        margin-bottom: 20px; /* 调整表单项的下边距 */
    }

    .login-button {
        width: 100%;
        border-radius: 5px; /* 圆角 */
        background-color: #007bff; /* 按钮背景色 */
        color: #ffffff; /* 按钮文字颜色 */
        border: none; /* 去掉边框 */
        padding: 10px; /* 按钮内边距 */
        font-size: 16px; /* 字体大小 */
        cursor: pointer; /* 鼠标悬停效果 */
    }

        .login-button:hover {
            background-color: #0056b3; /* 按钮悬停背景色 */
        }

    .links-row {
        display: flex;
        justify-content: space-between;
        margin-top: 10px;
    }

    .forgot-password a, .register-link a {
        color: #007bff;
        text-decoration: none;
    }

        .forgot-password a:hover, .register-link a:hover {
            text-decoration: underline;
        }
</style>
