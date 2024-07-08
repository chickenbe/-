// src/router/index.js  
import Vue from 'vue';  
import Router from 'vue-router';  
import Login from '@/views/Login.vue'; 
import Dashboard from '@/views/Dashboard.vue';  
import Users from '@/views/Users.vue'; // 假设你有Users组件  
import Questionnaire from '@/views/Questionnaire.vue';
import Help from '@/views/Help.vue';
import Feedback from '@/views/Feedback.vue';
import Setting from '@/views/Setting.vue';
import Layout from '@/components/Layout.vue';

Vue.use(Router);  
  
const router = new Router({  
  mode: 'history',  
  
  routes: [  
    {  
      path: '/',  
      name: 'login',  
      component: Login  
    },  
    {  
      path: '/dashboard',  
      name: 'dashboard',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Dashboard  
        }  
      ]  
    },  
    {  
      path: '/users',  
      name: 'users',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Users  
        }  
      ]  
    },  
    {  
      path: '/questionnaire',  
      name: 'questionnaire',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Questionnaire  
        }  
      ]  
    },  
    {  
      path: '/help',  
      name: 'help',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Help  
        }  
      ]  
    },  
    {  
      path: '/feedback',  
      name: 'feedback',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Feedback 
        }  
      ]  
    } , 
    {  
      path: '/setting',  
      name: 'setting',  
      component: Layout,  
      children: [  
        {  
          path: '',  
          component: Setting 
        }  
      ]  
    }  
  ]  
});  
// 路由守卫  
router.beforeEach((to, from, next) => {  
  // 假设有一个函数checkLoginStatus来检查用户的登录状态  
  checkLoginStatus().then(isLoggedIn => {  
    if (to.name !== 'Login' && !isLoggedIn) {  
      // 如果用户未登录且目标页面不是登录页面，则重定向到登录页面  
      next({ name: 'Login' });  
    } else {  
      // 如果用户已登录或目标页面是登录页面，则继续导航  
      // 在这里，我们可以添加一些额外的逻辑来处理异步数据加载  
      if (to.name === 'Dashboard' && !isDashboardDataLoaded()) {  
        // 假设isDashboardDataLoaded是一个函数，用于检查仪表板数据是否已加载  
        loadDashboardData().then(() => {  
          // 仪表板数据加载完成后，继续导航  
          next();  
        }).catch(error => {  
          // 处理数据加载错误  
          console.error('Failed to load dashboard data:', error);  
          next(false); // 阻止导航，可以选择重定向到错误页面或显示错误消息  
        });  
      } else {  
        // 仪表板数据已加载或不需要加载，继续导航  
        next();  
      }  
    }  
  }).catch(error => {  
    // 处理检查登录状态的错误  
    console.error('Failed to check login status:', error);  
    next(false); // 阻止导航，可以选择重定向到错误页面或显示错误消息  
  });  
});  
  
// 模拟检查登录状态的函数  
function checkLoginStatus() {  
  return new Promise(resolve => {  
    setTimeout(() => {  
      // 假设用户已登录  
      resolve(true);  
    }, 500);  
  });  
}  
  
// 模拟加载仪表板数据的函数  
function loadDashboardData() {  
  return new Promise(resolve => {  
    setTimeout(() => {  
      // 假设数据加载成功  
      console.log('Dashboard data loaded');  
      resolve();  
    }, 1000);  
  });  
}  
  
// 模拟检查仪表板数据是否已加载的函数  
function isDashboardDataLoaded() {  
  // 实际应用中，这里应该有逻辑来检查数据是否已加载  
  // 例如，可以检查Vuex状态或本地存储  
  return false; // 假设数据尚未加载  
}
export default router;
 