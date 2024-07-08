<template>  
    <div>  
      <form @submit.prevent="login">  
        <input type="text" v-model="username" placeholder="Username">  
        <input type="password" v-model="password" placeholder="Password">  
        <button type="submit">Login</button>  
      </form>  
    </div>  
  </template>  
    
  <script>  
  export default {  
    data() {  
      return {  
        username: '',  
        password: ''  
      };  
    },  
    methods: {  
      login() {  
        // 登录逻辑  
        if (this.username === '123' && this.password === '123') {  
          sessionStorage.setItem('isLoggedIn', true);  
          this.$router.push({ name: 'dashboard' });  
        } else {  
          alert('Login failed');  
        }  
      }  
    }  
  };  
  </script>

  <style>
  
  </style>