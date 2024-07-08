<template>  
  <div class="feedback">  
    <h1>意见反馈（查看逻辑未实现）</h1>
    <div class="idea-list">  
      <div class="idea-item" v-for="idea in sortedIdea " :key="idea.id">  
        <div class="header">  
          {{ idea.sender }}
        </div>  
        <div class="content">  
          {{ idea.content | truncate }}  
        </div>  
        <div><button  @click="showideaDetails(idea)">具体详情</button>  
          <button @click="toggetideaStatus(idea)"> {{ idea.status === 'unlook' ? '未查看' : '已查看' }}</button></div>
        </div>  
    </div>  
  
    <!--消息查看框模态 -->  
    <div v-if="selectedIdea" class="modal">  
      <div class="modal-content">  
        <span class="close" @click="closeideaDetails">&times;</span>  
        <div class="header">  
          {{ selectedIdea.sender }} 
        </div>  
        <div class="full-content">  
          {{ selectedIdea.content }}  
        </div>  
        <div class="actions">  
         <button @click="closeideaDetails">退出查看</button>  
        </div>  
      </div>  
     </div> 
     </div>
    </template>

  
<script>  
export default {  
  data() {  
    return {  
      idea: [  
        // 示例数据  
      
        { id: 1, sender: 'Alice',  content: 'Long detailed content here...', status: 'look' }, 
        { id: 2, sender: 'Bob',  content: 'Long detailed content here...', status: 'unlook' },  
        // 更多消息...  
      ],  
      selectedIdea: null,  
      confirmingStatusChange: false,  
      currentIdea: null, // 用于存储当前要更改状态的消息 
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
    sortedIdea() {  
      return [...this.idea].sort((a, b) => {  
        if (a.status === 'unlook' && b.status === 'look') {  
          return -1; // 未处理的排在前面  
        }  
        if (a.status === 'look' && b.status === 'unlook') {  
          return 1; // 已处理的排在后面  
        }  
        return 0; // 如果状态相同，则顺序不变  
      });  
    },  
  },  
  methods: {  
    showideaDetails(idea) {  
      this.selectedIdea = idea;  
    },  
    closeideaDetails() {  
      this.selectedIdea= null;  
    }, 
    toggetideaStatus(idea) {  
      this.currentIdea = message;  
    },  
    
    
  },  
};  
</script>  
  
<style scoped>  
/* 添加你的CSS样式 */  
.idea-item {  
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
  z-index: 1;  
  left: 0;  
  top: 0;  
  width: 100%;  
  height: 100%;  
  overflow: auto;  
  background-color: rgb(0,0,0);  
  background-color: rgba(0,0,0,0.4);  
  display: flex;  
  justify-content: center;  
  align-items: center;  
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

  
/* 其他样式... */  
</style>