<template>  
    <div class="top-bar">  
      <span>管理员：{{ adminName }}</span>  
      <button @click="logout">退出登录</button>  
    </div>  
  </template>  
    
  <script>  
  export default {  
    
    props: {  
      adminName: {  
        type: String,  
        required: true  
      }  
    },  
    methods: {  
      logout() {  
        // 清除用户状态，例如：this.$store.commit('logout');  
        // 假设你有一个名为'logout'的mutation来处理退出登录  
    
        // 重定向到登录页面  
        this.$router.push({ name: 'Login' });  
      }  
    }  
  }  
  </script>  
    
  <style scoped>  
  .top-bar {  
    display: flex;  
    justify-content: space-between;  
    align-items: center;  
    padding: 10px;  
    background-color: #f5f5f5;  
  }  
  </style>