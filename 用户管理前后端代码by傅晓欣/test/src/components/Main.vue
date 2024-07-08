<template>
    <div class="main-container">
        <div class="header">
            <div class="dropdown">
                <button class="dropbtn">{{ userInfo.username }}</button>
                <div class="dropdown-content">
                    <a @click="goToUserCenter">用户信息</a>
                    <a @click="goToLogin">退出</a>
                </div>
            </div>
        </div>
        <router-view></router-view>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                userInfo: null
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
            goToUserCenter() {
                this.$router.push({ name: 'UserCenter' });
            },
            goToLogin() {
                this.$router.push({ name: 'Login' });
            }
        }
    }
</script>

<style scoped>
    .main-container {
        display: flex;
        flex-direction: column;
        height: 100vh;
    }

    .header {
        display: flex;
        justify-content: flex-end;
        padding: 10px;
        background-color: rgba(255, 255, 255, 0.8); /* 白色半透明背景 */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 阴影效果 */
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropbtn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px; /* 增加按钮的宽度 */
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 4px; /* 圆角边框 */
        transition: background-color 0.3s; /* 过渡效果 */
    }

        .dropbtn:hover {
            background-color: #45a049; /* 悬停时的背景色 */
        }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: rgba(255, 255, 255, 0.9); /* 白色半透明背景 */
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        right: 0; /* 确保下拉框从右侧对齐 */
        border-radius: 4px; /* 圆角边框 */
    }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            cursor: pointer;
            transition: background-color 0.3s; /* 过渡效果 */
        }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>
