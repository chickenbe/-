<template>
    <div class="login-container">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <el-radio-group v-model="selectedOption" class="radio-group" @change="handleRadioChange">
                    <el-radio-button label="login">登录</el-radio-button>
                    <el-radio-button label="register">注册</el-radio-button>
                    <el-radio-button label="forgotPassword">忘记密码</el-radio-button>
                </el-radio-group>
            </div>
            <el-form @submit.prevent="handleLogin">
                <el-form-item label="用户名或邮箱">
                    <el-input v-model="identifier" required></el-input>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input :type="passwordType" v-model="password" required>
                        <template #suffix>
                            <el-button icon="el-icon-view" @click="togglePasswordVisibility" circle></el-button>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" native-type="submit" class="login-button">登录</el-button>
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
                selectedOption: 'login',
                identifier: '',
                password: '',
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
            async handleLogin() {
                try {
                    const response = await axios.post('http://localhost:3000/login', {
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
    }

    .box-card {
        width: 400px;
    }

    .radio-group {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .login-button {
        width: 100%;
    }
</style>