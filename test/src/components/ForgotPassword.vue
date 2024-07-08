<template>
    <div class="forgot-password-container">
        <el-card class="box-card">
            <el-form @submit.prevent="handleForgotPassword">
                <el-form-item>
                    <el-input type="email" v-model="email" required placeholder="请输入邮箱地址" @input="fetchSecurityQuestion"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input v-model="securityQuestion" disabled></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input v-model="securityAnswer" required placeholder="请输入答案"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-input :type="passwordType" v-model="newPassword" required placeholder="请输入新密码">
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <div style="margin-bottom: 50px;"></div> <!-- 添加空白行 -->
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="forgot-password-button">重置密码</el-button>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="goBackToLogin" class="back-button">返回登录</el-button>
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
                securityQuestion: '',
                securityAnswer: '',
                newPassword: '',
                passwordType: 'password'
            };
        },
        methods: {
            async fetchSecurityQuestion() {
                try {
                    const response = await axios.post('http://localhost:8080/api/fetch-security-question', {
                        email: this.email
                    });
                    if (response.data.success) {
                        this.securityQuestion = response.data.question;
                    } else {
                        this.securityQuestion = '';
                    }
                } catch (error) {
                    console.error(error);
                    this.securityQuestion = '';
                }
            },
            async handleForgotPassword() {
                try {
                    const response = await axios.post('http://localhost:8080/api/forgot-password', {
                        email: this.email,
                        securityAnswer: this.securityAnswer,
                        newPassword: this.newPassword
                    });
                    if (response.data.success) {
                        alert('密码重置成功');
                        this.$router.push('/login');
                    } else {
                        alert(response.data.message);
                    }
                } catch (error) {
                    console.error(error);
                    alert('密码重置失败');
                }
            },
            togglePasswordVisibility() {
                this.passwordType = this.passwordType === 'password' ? 'text' : 'password';
            },
            goBackToLogin() {
                this.$router.push('/login');
            }
        }
    };
</script>

<style scoped>
    .forgot-password-container {
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

    .forgot-password-button, .back-button {
        width: 100%;
        border-radius: 5px; /* 圆角 */
        background-color: #007bff; /* 按钮背景色 */
        color: #ffffff; /* 按钮文字颜色 */
        border: none; /* 去掉边框 */
        padding: 10px; /* 按钮内边距 */
        font-size: 16px; /* 字体大小 */
        cursor: pointer; /* 鼠标悬停效果 */
    }
</style>
