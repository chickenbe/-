import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import axios from 'axios'; // 引入 axios

const app = createApp(App);

app.use(router);
app.use(ElementPlus);

// 设置Axios默认配置
axios.defaults.baseURL = 'http://localhost:8089'; // 后端接口地址

app.mount('#app');
