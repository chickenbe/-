<template>  
  <div class="sidebar">  
    <ul>  
      <li :class="{ active: isActive('dashboard') }">  
        <router-link to="/dashboard">首页（导航未完成）</router-link>  
      </li>  
      <li :class="{ active: isActive('users') }">  
        <router-link to="/users">用户管理</router-link>  
      </li>  
      <li :class="{ active: isActive('questionnaire') }">  
        <router-link to="/questionnaire">问卷管理</router-link>  
      </li>  
      <li :class="{ active: isActive('help') }">  
        <router-link to="/help">帮助中心</router-link>  
      </li>  
      <li :class="{ active: isActive('feedback') }">  
        <router-link to="/feedback">意见反馈</router-link>  
      </li>  
      <li :class="{ active: isActive('setting') }">  
        <router-link to="/setting">设置</router-link>  
      </li>  
    </ul>  
  </div>  
</template>  
  
<script>  
export default {  
  name: 'Sidebar',  
  methods: {  
    isActive(routeName) {  
      return this.$route.name === routeName;  
    }  
  },  
  watch: {  
    '$route'(to, from) {  
      // 你可以在这里添加额外的逻辑来处理路由变化  
      // 但对于本例来说，仅依赖 `isActive` 方法就足够了  
    }  
  }  
}  
</script>  
  
<style scoped>  
.sidebar {  
  width: 250px;  
  height: 100vh;  
  background-color: #f4f4f4;  
  position: fixed;  
  top: 0;  
  left: 0;  
  padding: 20px;  
  box-sizing: border-box;  
}  
  
.sidebar ul {  
  list-style: none;  
  padding: 0;  
}  
  
.sidebar ul li {  
  margin-bottom: 10px;  
}  
  
.sidebar ul li a {  
  color: #070000;  
  text-decoration: none;  
}  
  
.sidebar ul li.active a {  
  color: #0000ff; /* 高亮颜色，可以根据需要更改 */  
  font-weight: bold;  
}  
  
.sidebar ul li a:hover {  
  color: #0000ff;  
}  
</style>