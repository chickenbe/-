<template>  
  <div class="main-content">  
    <sidebar></sidebar> 
    <Top :adminName='adminName'></Top> 
    <main>  
      <router-view></router-view>  
    </main>  
  </div>  
</template>  
  
<script>  
import Sidebar from '@/components/Sidebar.vue';  
import Top from '@/components/Top.vue';
  
export default {  
  components: {  
    Sidebar,
    Top  
  } ,
  data() {  
    return {  
      adminName: 'AdminUser' // 这里应该是从Vuex状态或其他地方获取的管理员名称  
    };  
  }   
};  
</script>
  
<style scoped>  
#app {  
  display: flex;  
  height: 100vh;  
}  
  
.main-content {  
  flex: 1;  
  overflow-y: auto;  
  padding: 20px;  
  margin-left: 250px; /* 侧边栏宽度 */  
}  
</style>