<template>  
  <div class="quiz-list-container">  
     <h1>问卷列表（修改未实现，查看问卷和查看数据框未设置）</h1>
     <table>  
       <thead>  
         <tr>  
           <th>问卷编号</th>  
           <th>问卷名称</th>
           
           <th>简介</th>  
          
           <th>发布人</th>
           <th>发布时间</th>
           <th>启用时间</th>  
           <th>截止时间</th>  
           <th>操作</th>  
         </tr>  
       </thead>  
       <tbody>  
         <!-- 筛选行 -->  
         <tr>  
           <td><input v-model="filters.number" placeholder="问卷编号"></td>  
           <td><input v-model="filters.title" placeholder="问卷名称"></td>
           
           <td><input v-model="filters.introduction" placeholder="简介"></td>
           
           <td><input v-model="filters.publisher" placeholder="发布人"></td>
           <td><input v-model="filters.publishtime" placeholder="发布时间"></td>
           <td><input  v-model="filters.opentime" placeholder="启用时间"></td>  
           <td><input  v-model="filters.closetime" placeholder="截止时间"></td>  
           <td>  
             <button @click="queryQuiz">查询</button>  
           </td>  
         </tr>  
         <!-- 用户数据行 -->  
         <tr v-for="quiz in filteredQuiz" :key="quiz.id">  
           <td>{{ quiz.number }}</td>  
           <td>{{ quiz.title }}</td>
          
           <td>{{ quiz.introduction }}</td> 
            
           <td>{{ quiz.publisher }}</td>
           <td>{{ quiz.publishtime }}</td>
           <td>{{ quiz.opentime }}</td>
           <td>{{ quiz.closetime }}</td>  
           <td>  
             <button @click="deleteQuiz(quiz.id)">删除</button>  
             <button @click="editQuiz(quiz)">修改</button> 
             <button @click="lookQuiz(quiz)">查看问卷</button> 
             <button @click="lookData(quiz)">查看数据</button>
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
       quizs: [  
         // 示例用户数据  
         { id: 1, number: '131',title:'a',introduction:'A',publisher:'Alice',publishtime:'2024.7.5 12:00',opentime:'2024.7.5 12:30',closetime: '2024.7.5 12:55' },  
         { id: 2, number: '132', title:'b',introduction:'B',publisher:'Bob',publishtime:'2024.7.6 12:00',opentime:'2024.7.6 12:30', closetime: '2024.7.6 12:55' },  
         // 更多用户...  
       ],  
       filters: {  
         number: '',  
         title:'',
         
         introduction:'',
        
         publisher:'',
         publishtime:'' ,
         opentime:'', 
         closetime: ''  
       }  
     };  
   },  
   computed: {  
     filteredQuiz() {  
       // 这里可以添加更复杂的筛选逻辑  
       let filtered = [...this.quizs];  
       if (this.filters.number) {  
         filtered = filtered.filter(quiz => quiz.number.includes(this.filters.number));  
       }
       if (this.filters.title) {  
         filtered = filtered.filter(quiz => quiz.title.includes(this.filters.title));  
       }  
       
       if (this.filters.introduction) {  
         filtered = filtered.filter(quiz => quiz.introduction.includes(this.filters.introduction)); 
       }
      
       if (this.filters.publisher) {  
         filtered = filtered.filter(quiz => quiz.publisher.includes(this.filters.publisher));  
       }  
       if (this.filters.publishtime) {  
         filtered = filtered.filter(quiz => quiz.publishtime.includes(this.filters.publishtime));  
       }  
       if (this.filters.opentimetime) {  
         filtered = filtered.filter(quiz => quiz.opentime.includes(this.filters.opentime));  
       }
       if (this.filters.closetimetimetime) {  
         filtered = filtered.filter(quiz => quiz.closetime.includes(this.filters.closetime));  
       }    
       return filtered;  
     }  
   },  
   methods: {  
     queryQuiz() {  
       // 这里可以放置查询逻辑，但在这个例子中，我们仅使用计算属性  
     },  
     deleteQuiz(id) {  
       // 实际应用中应该调用API删除用户，并更新users数组  
       console.log('Deleting user with ID:', id);  
       // 示例：从数组中移除用户  
       this.quizs = this.quizs.filter(quiz => quiz.id !== id);  
     },  
     editQuiz(quiz) {  
       // 在实际应用中，这里可以打开一个编辑用户的模态框或页面  
       // 假设我们使用了一个简单的弹窗或控制台日志来模拟  
       console.log('Editing user:', quiz);  
       // 如果使用Vuex或类似的状态管理，这里可以提交一个mutation来更新用户数据  
       // this.$store.commit('updateUser', user);  
   
       // 或者，如果你使用的是Vue Router，可以导航到编辑页面  
       // this.$router.push({ name: 'edit-user', params: { userId: user.id } });  
       } , 
     lookQuiz(quiz) {  
      console.log('Editing quiz:', quiz);  
      },
    lookData(quiz) {  
      console.log('Editing quiz:', quiz);  
    }
   }  
 };  
 </script>
 
 <style scoped>  
 .quiz-list-container {  
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
   background-color: #4CAF50;  
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
   background-color: #45a049;  
 }  
 </style>