<template>
    <div class="background">
        <div class="user-center">
            <h1>注册信息</h1>
            <div class="user-info">
                <div class="info-item">
                    <label>用户名:</label>
                    <span>{{ userInfo.username }}</span>
                </div>
                <div class="info-item">
                    <label>邮件地址:</label>
                    <span>{{ userInfo.email }}</span>
                </div>
                <div class="info-item" @click="showModal = true">
                    <label>密码:</label>
                    <span class="modify-password">修改密码</span>
                </div>
            </div>
        </div>
        <!-- 返回按钮 -->
        <div class="back-button-container">
            <button class="back-button" @click="goBack">返回</button>
        </div>

        <!-- 弹窗组件 -->
        <div class="modal" v-if="showModal">
            <div class="modal-content">
                <span class="close" @click="showModal = false">&times;</span>
                <h2>修改密码</h2>
                <div class="form-group" style="display: flex; align-items: center;">
                    <input type="password" v-model="password" placeholder="请输入旧密码">
                </div>
                <div class="form-group" style="display: flex; align-items: center;">
                    <input type="password" v-model="newPassword" placeholder="请输入新密码">
                </div>
                <div class="form-group" style="display: flex; align-items: center;">
                    <input type="password" v-model="confirmNewPassword" placeholder="请确认新密码">
                </div>
                <div class="button-group">
                    <button class="close-button" @click="showModal = false">关闭</button>
                    <button class="confirm-button" @click="changePassword">确定</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                userInfo: null,
                showModal: false,
                password: '',
                newPassword: '',
                confirmNewPassword: ''
            };
        },
        created() {
            this.fetchUserInfo();
        },
        methods: {
            async fetchUserInfo() {
                try {
                    const response = await axios.get('http://localhost:8080/api/currentUser');
                    if (response.data.identifier) {
                        const userIdentifier = response.data.identifier;
                        const userResponse = await axios.get(`http://localhost:8080/api/userInfo/${userIdentifier}`);
                        this.userInfo = userResponse.data;
                    } else {
                        alert('当前用户不存在');
                    }
                } catch (error) {
                    console.error(error);
                    alert('获取用户信息失败');
                }
            },
            async changePassword() {
                if (this.newPassword !== this.confirmNewPassword) {
                    alert('新密码和确认密码不一致');
                    return;
                }
                try {
                    const response = await axios.post('http://localhost:8080/api/change-password', {
                        password: this.password,
                        newPassword: this.newPassword
                    });
                    if (response.data.success) {
                        alert('密码修改成功');
                        this.showModal = false;
                        this.password = '';
                        this.newPassword = '';
                        this.confirmNewPassword = '';
                    } else {
                        alert(response.data.message);
                    }
                } catch (error) {
                    console.error(error);
                    alert('密码修改失败');
                }
            },
            goBack() {
                this.$router.push({ name: 'Main' });
            }
        }
    };
</script>

<style scoped>
    .background {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-image: url('../image/background.jpg'); /* 使用相对路径引用图片 */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        z-index: -1; /* 确保背景在内容之下 */
    }

    .user-center {
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 200px auto 0 auto;
    }

    h1 {
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .user-info {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .info-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        font-size: 16px;
        cursor: pointer;
    }

    label {
        font-weight: bold;
        color: #555;
    }

    span {
        color: #333;
    }

    .modify-password {
        color: blue;
        text-decoration: underline;
    }

    .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 400px;
        position: relative;
    }

    .close {
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
        color: #555;
        font-size: 20px;
    }

    .form-group {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }

        .form-group label {
            display: block;
            margin-right: 10px;
            color: #555;
            font-weight: bold;
            min-width: 12px; /* 设置最小宽度 */
        }

        .form-group input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

    .button-group {
        display: flex;
        justify-content: space-between;
    }

    .close-button, .confirm-button {
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 48%;
    }

    .close-button {
        background-color: #ccc;
        color: #333;
    }

    .confirm-button {
        background-color: #007bff;
        color: #fff;
    }

    .close-button:hover {
        background-color: #bbb;
    }

    .confirm-button:hover {
        background-color: #0056b3;
    }

    .back-button-container {
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }

    .back-button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        background-color: #007bff;
        color: #fff;
    }

        .back-button:hover {
            background-color: #0056b3;
        }
</style>
