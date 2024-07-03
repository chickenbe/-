<template>
    <div class="forgot-password-container">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <el-radio-group v-model="selectedOption" class="radio-group" @change="handleRadioChange">
                    <el-radio-button label="login">登录</el-radio-button>
                    <el-radio-button label="register">注册</el-radio-button>
                    <el-radio-button label="forgotPassword">忘记密码</el-radio-button>
                </el-radio-group>
            </div>
            <el-form @submit.prevent="handleForgotPassword">
                <el-form-item label="邮箱">
                    <el-input type="email" v-model="email" required @input="fetchSecurityQuestion"></el-input>
                </el-form-item>
                <el-form-item label="密保问题">
                    <el-input v-model="securityQuestion" disabled></el-input>
                </el-form-item>
                <el-form-item label="密保答案">
                    <el-input v-model="securityAnswer" required></el-input>
                </el-form-item>
                <el-form-item label="新密码">
                    <el-input :type="passwordType" v-model="newPassword" required>
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="forgot-password-button">重置密码</el-button>
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
                selectedOption: 'forgotPassword',
                email: '',
                securityQuestion: '',
                securityAnswer: '',
                newPassword: '',
                passwordType: 'password'
            };
        },
        methods: {
            handleRadioChange(value) {
                if (value === 'login') {
                    this.$router.push('/login');
                } else if (value === 'register') {
                    this.$router.push('/register');
                } else if (value === 'forgotPassword') {
                    this.$router.push('/forgot-password');
                }
            },
            async fetchSecurityQuestion() {
                try {
                    const response = await axios.post('http://localhost:3000/fetch-security-question', {
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
                    const response = await axios.post('http://localhost:3000/forgot-password', {
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
    }

    .box-card {
        width: 400px;
    }

    .radio-group {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .forgot-password-button {
        width: 100%;
    }
</style>
