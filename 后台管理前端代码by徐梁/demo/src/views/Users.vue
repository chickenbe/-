<template>  
 <div class="user-list-container">  
    <h1>用户列表(修改功能未实现)</h1>
    <table>  
      <thead>  
        <tr>  
          <th>姓名</th>  
          <th>昵称</th>
          <th>性别</th>
          <th>年龄</th>  
          <th>生日</th>
          <th>账号</th>
          <th>密码</th>
          <th>邮箱</th>  
          <th>手机号</th>  
          <th>操作</th>  
        </tr>  
      </thead>  
      <tbody>  
        <!-- 筛选行 -->  
        <tr>  
          <td><input v-model="filters.name" placeholder="姓名"></td>  
          <td><input v-model="filters.ID" placeholder="昵称"></td>
          <td>  
            <select v-model="filters.gender">  
              <option value="">全部</option>  
              <option value="男">男</option>  
              <option value="女">女</option>  
            </select>  
          </td>  
          <td><input v-model="filters.age" placeholder="年龄"></td>
          <td>  
            <input type="date" v-model="filters.startDate" placeholder="开始日期">  
            <input type="date" v-model="filters.endDate" placeholder="结束日期">  
          </td>
          <td><input v-model="filters.account" placeholder="账号"></td>
          <td><input v-model="filters.password" readonly placeholder="无法通过密码查询用户"></td>
          <td><input  v-model="filters.email" placeholder="邮箱"></td>  
          <td><input  v-model="filters.phone" placeholder="手机号"></td>  
          <td>  
            <button @click="queryUsers">查询</button>  
          </td>  
        </tr>  
        <!-- 用户数据行 -->  
        <tr v-for="user in filteredUsers" :key="user.id">  
          <td>{{ user.name }}</td>  
          <td>{{ user.ID }}</td>
          <td>{{ user.gender }}</td>
          <td>{{ user.age }}</td> 
          <td>{{ user.birthday }}</td>  
          <td>{{ user.account }}</td>
          <td>{{ user.password }}</td>
          <td>{{ user.email }}</td>
          <td>{{ user.phone }}</td>  
          <td>  
            <button @click="deleteUsers(user.id)">删除</button>  
            <button @click="editUsers(user)">修改</button>  
          </td>  
        </tr>  
      </tbody>  
    </table>  
 </div>   
 
</template>  
  
<script>  
export default {  
  data() {  
    return {  
      users: [  
        // 示例用户数据  
        { id: 1, name: 'Alice',ID:'牛',gender:'女',age:'4', birthday: '2020-01-01',account:'13213',password:'121',email:'1213@qq.com',phone: '1234567890' },  
        { id: 2, name: 'Bob', ID:'马',gender:'男',age:'2',birthday: '2022-02-02',account:'13211',password:'131',email:'1321@qq.com', phone: '0987654321' },  
        // 更多用户...  
      ],  
      filters: {  
        name: '',  
        ID:'',
        gender:'',
        age:'',
        startDate: '',  
        endDate: '',
        account:'',
        password:'' ,
        email:'', 
        phone: ''  
      }  
    };  
  },  
  computed: {  
    filteredUsers() {  
      // 这里可以添加更复杂的筛选逻辑  
      let filtered = [...this.users];  
      if (this.filters.name) {  
        filtered = filtered.filter(user => user.name.includes(this.filters.name));  
      }
      if (this.filters.ID) {  
        filtered = filtered.filter(user => user.ID.includes(this.filters.ID));  
      }  
      if (this.filters.gender) {  
        filtered = filtered.filter(user => user.gender===this.filters.gender); 
      } 
      if (this.filters.age) {  
        filtered = filtered.filter(user => user.age.includes(this.filters.age)); 
      }
      if (this.filters.startDate && this.filters.endDate) {  
        filtered = filtered.filter(user => {  
          const birthdate = new Date(user.birthday);  
          return birthdate >= new Date(this.filters.startDate) && birthdate <= new Date(this.filters.endDate);  
        });  
      }  
      if (this.filters.account) {  
        filtered = filtered.filter(user => user.account.includes(this.filters.account));  
      }  
      if (this.filters.email) {  
        filtered = filtered.filter(user => user.email.includes(this.filters.email));  
      }  
      if (this.filters.phone) {  
        filtered = filtered.filter(user => user.phone.includes(this.filters.phone));  
      }  
      return filtered;  
    }  
  },  
  methods: {  
    queryUsers() {  
      // 这里可以放置查询逻辑，但在这个例子中，我们仅使用计算属性  
    },  
    deleteUsers(id) {  
      // 实际应用中应该调用API删除用户，并更新users数组  
      console.log('Deleting user with ID:', id);  
      // 示例：从数组中移除用户  
      this.users = this.users.filter(user => user.id !== id);  
    },  
    editUsers(user) {  
      console.log('Editing user:', user);  
    }
      // 在实际应用中，这里可以打开一个编辑用户的模态框或页面  
      // 假设我们使用了一个简单的弹窗或控制台日志来模拟
      // 如果使用Vuex或类似的状态管理，这里可以提交一个mutation来更新用户数据  
      // this.$store.commit('updateUser', user);  
      // 或者，如果你使用的是Vue Router，可以导航到编辑页面  
      // this.$router.push({ name: 'edit-user', params: { userId: user.id } });  
      }  
};  
</script>

<style scoped>  
.user-list-container {  
  width: 100%;  
  max-width: 800px;  
  margin: 20px auto;  
  border-collapse: collapse;  
}  
  
table {  
  width: 100%;  
  border: 1px solid #ccc;  
  margin-bottom: 20px;  
}  
  
th, td {  
  padding: 8px;  
  text-align: left;  
  border-bottom: 1px solid #ddd;  
}  
  
th {  
  background-color: #f2f2f2;  
}  
  
tr:hover {  
  background-color: #f9f9f9;  
}  
  
input[type="text"], input[type="date"], select, button {  
  padding: 5px;  
  margin: 0 5px;  
  border: 1px solid #ccc;  
  border-radius: 4px;  
}  
  
button {  
  cursor: pointer;  
  background-color: #28bd75;  
  color: white;  
  border: none;  
  padding: 5px 10px;  
  text-align: center;  
  text-decoration: none;  
  display: inline-block;  
  font-size: 14px;  
  margin: 0 4px;  
  transition: background-color 0.3s;  
}  
  
button:hover {  
  background-color: #259b25;  
}  
</style>