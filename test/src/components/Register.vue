<template>
    <div class="register-container">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <el-radio-group v-model="selectedOption" class="radio-group" @change="handleRadioChange">
                    <el-radio-button label="login">登录</el-radio-button>
                    <el-radio-button label="register">注册</el-radio-button>
                </el-radio-group>
            </div>
            <el-form @submit.prevent="handleRegister">
                <el-form-item label="邮箱">
                    <el-input type="email" v-model="email" required></el-input>
                </el-form-item>
                <el-form-item label="用户名">
                    <el-input v-model="username" required></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input :type="passwordType" v-model="password" required>
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item label="密保问题">
                    <el-select v-model="securityQuestion" placeholder="请选择密保问题" required>
                        <el-option label="你的名字是？" value="你的名字是？"></el-option>
                        <el-option label="你的生日是？" value="你的生日是？"></el-option>
                        <el-option label="你最喜欢的水果是？" value="你最喜欢的水果是？"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="密保答案">
                    <el-input v-model="securityAnswer" required></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="register-button">注册</el-button>
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
                selectedOption: 'register',
                email: '',
                username: '',
                password: '',
                passwordType: 'password',
                securityQuestion: '',
                securityAnswer: ''
            };
        },
        methods: {
            handleRadioChange(value) {
                if (value === 'login') {
                    this.$router.push('/login');
                } else if (value === 'register') {
                    this.$router.push('/register');
                }
            },
            async handleRegister() {
                try {
                    const response = await axios.post('http://localhost:3000/register', {
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
    }

    .box-card {
        width: 400px;
    }

    .radio-group {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .register-button {
        width: 100%;
    }
</style>