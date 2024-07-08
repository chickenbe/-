import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

axios.defaults.baseURL = 'http://localhost:8080'

const app = createApp(App)

app.config.globalProperties.$http = axios

app.use(store)
app.use(router)
app.mount('#app')
