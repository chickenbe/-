<template>  
    <div class="setting">  
      <h1>设置（子功能页框未实现）</h1>  
      <!-- 设置功能 -->  
       <button style="width: 200px; height: 50px;" @click="showChangePassword=true">修改管理员密码</button>
       <div v-if="showChangePassword" class="overlay"></div> 
       <div v-if="showChangePassword" class="change-password-modal">  
      <!-- 功能框内容，如输入框、按钮等 -->  
      <input type="password" placeholder="旧密码">  
      <br>
      <input type="password" placeholder="新密码"> 
      <br> 
      <input type="password" placeholder="确认新密码">  
      <button @click="changePassword; showChangePassword = false">确认修改</button>  
      <button @click="showChangePassword = false">取消</button>  
    </div>  
       <br>
       <button style="width: 200px; height: 50px;" @click="setActive()">查询管理员操作</button>
       <br>
       <button style="width: 200px; height: 50px;" @click="setActive()">修改管理员信息</button>
    </div>  
  </template>  
    
    <script>  
    export default {  
      data() {  
        return {  
          showChangePassword: false, // 控制修改密码功能框的显示状态  
        };  
      },  
      methods: {  
        changePassword() {  
          // 这里实现修改密码的逻辑，可能是发送请求到后端  
          console.log('修改密码的逻辑');  
        },  
      },  
    };  
    </script>  
    
    <style>  
    .overlay {  
      position: fixed;  
      top: 0;  
      left: 0;  
      right: 0;  
      bottom: 0;  
      background-color: rgba(0, 0, 0, 0.5); /* 半透明黑色 */  
      z-index: 999; /* 比功能框稍低 */  
    }  
      
    .change-password-modal {  
      position: fixed;  
      /* ...其他样式 */  
      z-index: 1000; /* 确保高于遮罩层 */  
    }  
    </style>