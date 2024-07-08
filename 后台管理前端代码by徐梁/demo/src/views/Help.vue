<template>  
  <div class="help-center">  
    <h1>帮助中心(将处理状态不同的消息分边)</h1>
    <div class="message-list">  
      <div class="message-item" v-for="message in sortedMessages " :key="message.id">  
        <div class="header">  
          {{ message.sender }} - {{ message.type }} - {{ message.subject }}  
        </div>  
        <div class="content">  
          {{ message.content | truncate }}  
        </div>  
        <div><button  @click="showmessageDetails(message)">具体详情</button>  
          <button @click="toggetmessageStatus(message)"> {{ message.status === 'unprocessed' ? '未处理' : '已处理' }}</button></div>
        </div>  
    </div>  
  
    <!-- 消息查看框模态 -->  
    <div v-if="selectedMessage" class="modal">  
      <div class="modal-content">  
        <span class="close" @click="closemessageDetails">&times;</span>  
        <div class="header">  
          {{ selectedMessage.sender }} - {{ selectedMessage.type }} - {{ selectedMessage.subject }}  
        </div>  
        <div class="full-content">  
          {{ selectedMessage.content }}  
        </div>  
        <div class="actions">  
          <button @click="goToUserList">前往用户列表</button>  
          <button @click="goToQuestionnaireList">前往问卷列表</button>  
          <button @click="closemessageDetails">退出查看</button>  
        </div>  
      </div>  
     </div> 
<!-- 状态转换确认框 -->  
<div v-if="confirmingStatusChange" class="confirm-modal">  
      <p>确认要更改状态吗？</p>  
      <button @click="confirmmessageStatusChange">确认</button>
      <button @click="cancelmessageStatusChange">取消</button>  
    </div>  
  </div>  
</template>  
  
<script>  
export default {  
  data() {  
    return {  
      messages: [  
        // 示例数据  
      
        { id: 1, sender: 'Alice', type: 'Tech Support', subject: 'Login Issue', content: 'Long detailed content here...', status: 'unprocessed' }, 
        { id: 2, sender: 'Bob', type: 'Tech Support', subject: 'Login Issue', content: 'Long detailed content here...', status: 'unprocessed' },  
        // 更多消息...  
      ],  
      selectedMessage: null,  
      confirmingStatusChange: false,  
      currentMessage: null, // 用于存储当前要更改状态的消息 
    };  
  },  
  filters: {  
    truncate(value, length = 50) {  
      if (!value) return '';  
      if (value.length <= length) return value;  
      return value.substring(0, length) + '...';  
    },  
  },  
  computed: {  
    // 根据状态对消息进行排序，未处理的置顶，已处理的置底  
    sortedMessages() {  
      return [...this.messages].sort((a, b) => {  
        if (a.status === 'unprocessed' && b.status === 'processed') {  
          return -1; // 未处理的排在前面  
        }  
        if (a.status === 'processed' && b.status === 'unprocessed') {  
          return 1; // 已处理的排在后面  
        }  
        return 0; // 如果状态相同，则顺序不变  
      });  
    },  
  },  
  methods: {  
    showmessageDetails(message) {  
      this.selectedMessage = message;  
    },  
    closemessageDetails() {  
      this.selectedMessage = null;  
    },  
    goToUserList() {  
      // 导航逻辑，可能需要使用vue-router  
      this.$router.push('/users');  
    },  
    goToQuestionnaireList() {  
      // 导航逻辑  
      this.$router.push('/questionnaire');  
    }, 
    toggetmessageStatus(message) {  
      this.confirmingStatusChange = true;  
      this.currentMessage = message;  
    },  
    cancelmessageStatusChange() {  
      this.confirmingStatusChange = false;  
      this.currentMessage = null;  
    },  
    confirmmessageStatusChange() {  
      if (this.currentMessage) {  
        this.currentMessage.status = this.currentMessage.status === 'unprocessed' ? 'processed' : 'unprocessed';  
        // 排序已经通过computed属性处理，所以这里不需要再次排序  
        this.confirmingStatusChange = false;  
        this.currentMessage = null;  
        // 如果需要，可以在这里调用一个方法来重新渲染列表或执行其他操作  
      }  
    },  
  },  
};  
</script>  
  
<style scoped>  
/* 添加你的CSS样式 */  
.message-item {  
  border: 1px solid #ccc; /* 边框颜色和宽度 */  
  padding: 10px; /* 内边距 */  
  margin-bottom: 5px; /* 底部外边距，用于分隔每个消息 */  
  border-radius: 5px; /* 边框圆角，使矩形框看起来更柔和 */  
  background-color: #f9f9f9; /* 背景颜色，可选 */  
}  
.content {  
  /* 设置固定宽度或最大宽度 */  
  width: 200px; /* 示例宽度，根据实际情况调整 */  
  /* 防止内容换行 */  
  white-space: nowrap;  
  /* 超出部分显示省略号 */  
  overflow: hidden;  
  text-overflow: ellipsis;  
}
.modal {  
  position: fixed;  
  top: 0;  
  left: 0;  
  width: 100%;  
  height: 100%;  
  display: flex;  
  justify-content: center;  
  align-items: center;  
  background-color: rgba(0, 0, 0,0.5); 
  z-index: 1000; /* 确保模态框在顶层 */ 
}  
  
.modal-content {  
  background-color: #fefefe;  
  margin: 15% auto;  
  padding: 20px;  
  border: 1px solid #888;  
  width: 80%;  
}  
  
.close {  
  color: #aaa;  
  float: right;  
  font-size: 28px;  
  font-weight: bold;  
}  
  
.close:hover,  
.close:focus {  
  color: black;  
  text-decoration: none;  
  cursor: pointer;  
}  
.confirm-modal {  
  /* 模态框样式 */  
  position: fixed;  
  top: 50%;  
  left: 50%;  
  transform: translate(-50%, -50%);  
  background-color: white;  
  padding: 20px;  
  border-radius: 5px;  
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);  
  z-index: 1000; /* 确保模态框在顶层 */  
}  
  
/* 其他样式... */  
</style>