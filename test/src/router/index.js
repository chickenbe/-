import { createRouter, createWebHistory } from 'vue-router';
import Login from '../components/Login.vue';
import Register from '../components/Register.vue';
import Main from '../components/Main.vue';
import ForgotPassword from '../components/ForgotPassword.vue';
import UserCenter from '../components/UserCenter.vue';

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Login // 默认显示登录界面
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/register',
        name: 'Register',
        component: Register
    },
    {
        path: '/main',
        name: 'Main',
        component: Main
    },
    {
        path: '/forgot-password',
        name: 'ForgotPassword',
        component: ForgotPassword
    },
    {
        path: '/user-center',
        name: 'UserCenter',
        component: UserCenter
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;
